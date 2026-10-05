SET client_encoding = 'UTF8';

-- Patch: brand/manufacturer tables already created; now populate + backfill FKs + drop legacy cols.

INSERT INTO brand (name, created_at, updated_at)
SELECT DISTINCT TRIM(p.brand), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM   product p
WHERE  p.brand IS NOT NULL AND char_length(TRIM(p.brand)) > 0
ON CONFLICT (name) DO NOTHING;

INSERT INTO manufacturer (name, created_at, updated_at)
SELECT DISTINCT TRIM(p.manufacturer), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM   product p
WHERE  p.manufacturer IS NOT NULL AND char_length(TRIM(p.manufacturer)) > 0
ON CONFLICT (name) DO NOTHING;

UPDATE product p SET brand_id = b.id
FROM   brand b WHERE TRIM(p.brand) = b.name;

UPDATE product p SET manufacturer_id = m.id
FROM   manufacturer m WHERE TRIM(p.manufacturer) = m.name;

ALTER TABLE product DROP COLUMN IF EXISTS brand;
ALTER TABLE product DROP COLUMN IF EXISTS manufacturer;
