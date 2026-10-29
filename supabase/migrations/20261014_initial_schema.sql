SET client_encoding = 'UTF8';

-- =============================================================================
-- Windwah Inventory - Initial Schema (fresh Supabase deployment)
-- Creates: product (with E-Gate Offer fields), brand, manufacturer
-- Matches the JPA entity definitions exactly.
-- =============================================================================

-- -----------------------------------------------------------------------------
-- brand table
-- -----------------------------------------------------------------------------
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

-- -----------------------------------------------------------------------------
-- manufacturer table
-- -----------------------------------------------------------------------------
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

-- -----------------------------------------------------------------------------
-- product table (full modern schema = base + E-Gate Offer fields)
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS product (
    id              BIGSERIAL
        CONSTRAINT pk_product PRIMARY KEY,

    -- Core fields
    sku             TEXT NOT NULL
        CONSTRAINT uq_product_sku UNIQUE
        CONSTRAINT ck_product_sku_len CHECK (char_length(sku) <= 64),

    title           TEXT NOT NULL
        CONSTRAINT ck_product_title_len CHECK (char_length(title) <= 512),

    description     TEXT
        CONSTRAINT ck_product_desc_len CHECK (char_length(description) <= 4000),

    quantity        INTEGER NOT NULL
        CONSTRAINT ck_product_qty_nonneg CHECK (quantity >= 0),

    price           NUMERIC(14,2) NOT NULL
        CONSTRAINT ck_product_price_positive CHECK (price > 0),

    currency        TEXT
        CONSTRAINT ck_product_currency_len CHECK (char_length(currency) <= 8),

    -- Normalized brand / manufacturer FKs
    brand_id        BIGINT
        CONSTRAINT fk_product_brand
            REFERENCES brand(id) ON DELETE SET NULL,

    manufacturer_id BIGINT
        CONSTRAINT fk_product_manufacturer
            REFERENCES manufacturer(id) ON DELETE SET NULL,

    category        TEXT
        CONSTRAINT ck_product_category_len CHECK (char_length(category) <= 256),

    condition       TEXT
        CONSTRAINT ck_product_condition CHECK (condition IN (
            'NEW', 'USED_LIKE_NEW', 'USED_VERY_GOOD', 'USED_GOOD', 'ACCEPTABLE'
        )),

    image_urls      TEXT
        CONSTRAINT ck_product_img_len CHECK (char_length(image_urls) <= 4000),

    weight_kg       NUMERIC(13,3),

    dimensions      TEXT
        CONSTRAINT ck_product_dim_len CHECK (char_length(dimensions) <= 128),

    listing_status  TEXT
        CONSTRAINT ck_product_listing_status CHECK (listing_status IN (
            'ACTIVE', 'INACTIVE', 'DRAFT'
        )),

    created_at      TIMESTAMP(6) WITH TIME ZONE,
    updated_at      TIMESTAMP(6) WITH TIME ZONE,

    -- EAN / UPC / MPN
    upc             TEXT
        CONSTRAINT ck_product_upc_len CHECK (char_length(upc) <= 32),
    ean             TEXT
        CONSTRAINT ck_product_ean_len CHECK (char_length(ean) <= 32),
    mpn             TEXT
        CONSTRAINT ck_product_mpn_len CHECK (char_length(mpn) <= 64),

    -- =========================================================================
    -- E-Gate Offer / COBI fields (15 columns)
    -- =========================================================================
    collection                       VARCHAR(128),
    index_code                       VARCHAR(128),
    purchase_price                   NUMERIC(14,2),
    master_carton_pcs                INTEGER,
    box_type                         VARCHAR(32),
    box_gross_volume_m3              NUMERIC(14,6),
    master_carton_gross_volume_m3    NUMERIC(14,6),
    box_gross_weight_kg              NUMERIC(14,6),
    master_carton_gross_weight_kg    NUMERIC(14,6),
    total_master_carton_volume_m3    NUMERIC(14,6),
    total_master_carton_weight_kg    NUMERIC(14,6),
    total_master_carton_qty          INTEGER,
    rrp_eur                          NUMERIC(14,2),
    rrp_text                         VARCHAR(128),
    availability                     VARCHAR(128)
);

-- Indexes
CREATE UNIQUE INDEX IF NOT EXISTS idx_product_sku ON product (sku);
CREATE INDEX IF NOT EXISTS idx_product_brand_id        ON product (brand_id);
CREATE INDEX IF NOT EXISTS idx_product_manufacturer_id ON product (manufacturer_id);
CREATE INDEX IF NOT EXISTS idx_product_listing_status  ON product (listing_status);
CREATE INDEX IF NOT EXISTS idx_product_category        ON product (category);
CREATE INDEX IF NOT EXISTS idx_product_collection      ON product (collection);
CREATE INDEX IF NOT EXISTS idx_product_index_code      ON product (index_code);
CREATE INDEX IF NOT EXISTS idx_product_availability    ON product (availability);
