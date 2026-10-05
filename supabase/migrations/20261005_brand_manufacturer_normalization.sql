SET client_encoding = 'UTF8';

-- =========================================================================
-- Windwah Inventory - Brand + Manufacturer normalization migration
--  1. Create brand & manufacturer tables (with Amazon Brand Registry cols)
--  2. Add brand_id / manufacturer_id FK columns to product
--  3. Upsert distinct brand/manufacturer names currently stored as TEXT
--     (migration from the legacy denormalized product.brand / .manufacturer)
--  4. Update product.brand_id / manufacturer_id from the legacy text matches
--  5. Finally drop legacy TEXT columns (brand/manufacturer) from product
-- =========================================================================

CREATE TABLE IF NOT EXISTS brand (
    id                       BIGSERIAL PRIMARY KEY,
    name                     TEXT NOT NULL UNIQUE,
    amazon_brand_store_url   TEXT,
    logo_url                 TEXT,
    description              TEXT,
    created_at               TIMESTAMP(6) WITH TIME ZONE,
    updated_at               TIMESTAMP(6) WITH TIME ZONE,
    CONSTRAINT ck_brand_name_len        CHECK (char_length(name) <= 128),
    CONSTRAINT ck_brand_store_url_len   CHECK (char_length(amazon_brand_store_url) <= 255),
    CONSTRAINT ck_brand_logo_url_len    CHECK (char_length(logo_url) <= 2048),
    CONSTRAINT ck_brand_desc_len        CHECK (char_length(description) <= 2000)
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_brand_name ON brand (name);

CREATE TABLE IF NOT EXISTS manufacturer (
    id              BIGSERIAL PRIMARY KEY,
    name            TEXT NOT NULL UNIQUE,
    contact_person  TEXT,
    contact_phone   TEXT,
    contact_email   TEXT,
    address         TEXT,
    country         TEXT,
    created_at      TIMESTAMP(6) WITH TIME ZONE,
    updated_at      TIMESTAMP(6) WITH TIME ZONE,
    CONSTRAINT ck_manuf_name_len     CHECK (char_length(name) <= 128),
    CONSTRAINT ck_manuf_contact_len  CHECK (char_length(contact_person) <= 128),
    CONSTRAINT ck_manuf_phone_len    CHECK (char_length(contact_phone) <= 64),
    CONSTRAINT ck_manuf_email_len    CHECK (char_length(contact_email) <= 128),
    CONSTRAINT ck_manuf_addr_len     CHECK (char_length(address) <= 500),
    CONSTRAINT ck_manuf_country_len  CHECK (char_length(country) <= 64)
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_manufacturer_name ON manufacturer (name);

-- =========================================================================
-- Add FK columns + constraints (safe idempotent)
-- =========================================================================
ALTER TABLE product ADD COLUMN IF NOT EXISTS brand_id        BIGINT;
ALTER TABLE product ADD COLUMN IF NOT EXISTS manufacturer_id BIGINT;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_product_brand') THEN
        ALTER TABLE product ADD CONSTRAINT fk_product_brand
            FOREIGN KEY (brand_id) REFERENCES brand(id) ON DELETE SET NULL;
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_product_manufacturer') THEN
        ALTER TABLE product ADD CONSTRAINT fk_product_manufacturer
            FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(id) ON DELETE SET NULL;
    END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_product_brand_id        ON product (brand_id);
CREATE INDEX IF NOT EXISTS idx_product_manufacturer_id ON product (manufacturer_id);

-- =========================================================================
-- (3) Migration: extract distinct brand/manufacturer from legacy TEXT
--     columns (if they exist on product) and populate reference tables.
-- =========================================================================
DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'product' AND column_name = 'brand'
    ) THEN
        INSERT INTO brand (name, created_at, updated_at)
        SELECT DISTINCT TRIM(p.brand), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
        FROM   product p
        WHERE  p.brand IS NOT NULL AND char_length(TRIM(p.brand)) > 0
        ON CONFLICT (name) DO NOTHING;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'product' AND column_name = 'manufacturer'
    ) THEN
        INSERT INTO manufacturer (name, created_at, updated_at)
        SELECT DISTINCT TRIM(p.manufacturer), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
        FROM   product p
        WHERE  p.manufacturer IS NOT NULL AND char_length(TRIM(p.manufacturer)) > 0
        ON CONFLICT (name) DO NOTHING;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'product' AND column_name = 'brand'
    ) THEN
        UPDATE product p SET brand_id = b.id
        FROM   brand b
        WHERE  TRIM(p.brand) = b.name;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_name = 'product' AND column_name = 'manufacturer'
    ) THEN
        UPDATE product p SET manufacturer_id = m.id
        FROM   manufacturer m
        WHERE  TRIM(p.manufacturer) = m.name;
    END IF;
END $$;

-- =========================================================================
-- (4) Drop legacy TEXT columns (now fully replaced by FK cols)
-- =========================================================================
ALTER TABLE product DROP COLUMN IF EXISTS brand;
ALTER TABLE product DROP COLUMN IF EXISTS manufacturer;
