SET client_encoding = 'UTF8';

ALTER TABLE product
    ADD COLUMN IF NOT EXISTS collection                         VARCHAR(128),
    ADD COLUMN IF NOT EXISTS index_code                       VARCHAR(128),
    ADD COLUMN IF NOT EXISTS purchase_price                   NUMERIC(14,2),
    ADD COLUMN IF NOT EXISTS master_carton_pcs                 INTEGER,
    ADD COLUMN IF NOT EXISTS box_type                       VARCHAR(32),
    ADD COLUMN IF NOT EXISTS box_gross_volume_m3              NUMERIC(14,6),
    ADD COLUMN IF NOT EXISTS master_carton_gross_volume_m3   NUMERIC(14,6),
    ADD COLUMN IF NOT EXISTS box_gross_weight_kg              NUMERIC(14,6),
    ADD COLUMN IF NOT EXISTS master_carton_gross_weight_kg    NUMERIC(14,6),
    ADD COLUMN IF NOT EXISTS total_master_carton_volume_m3     NUMERIC(14,6),
    ADD COLUMN IF NOT EXISTS total_master_carton_weight_kg     NUMERIC(14,6),
    ADD COLUMN IF NOT EXISTS total_master_carton_qty         INTEGER,
    ADD COLUMN IF NOT EXISTS rrp_eur                        NUMERIC(14,2),
    ADD COLUMN IF NOT EXISTS rrp_text                        VARCHAR(128),
    ADD COLUMN IF NOT EXISTS availability                    VARCHAR(128);

CREATE INDEX IF NOT EXISTS idx_product_collection   ON product (collection);
CREATE INDEX IF NOT EXISTS idx_product_index_code   ON product (index_code);
CREATE INDEX IF NOT EXISTS idx_product_availability ON product (availability);
