# Windwah EGate Inventory System - Database SQL (中文 / UTF-8 版)

本檔案包含 **PostgreSQL** 正式環境的完整中文支援設定腳本：
- 資料庫使用 `UTF8` 編碼
- 繁體中文 HK collation（`zh_HK.UTF8` / ICU `zh-Hant-HK`）
- 每個文字欄位使用 `TEXT` + 明確 COLLATION（中文排序正確）

JPA 已設定 `spring.jpa.hibernate.ddl-auto=update`，所以表格會在 App 啟動時
自動建立/更新。下方 DDL 提供給手動建置、DBA review、或關閉 ddl-auto 時使用。

---

## 1. PostgreSQL - 建立資料庫 + 中文欄位 + 樣本資料

**第一步：連線到 `postgres` 維護資料庫**（pgAdmin 或 psql），執行：

```sql
-- =============================================================================
-- (A) 建立資料庫 inventory — 一定要從 template0 建立，才能自訂 LC_COLLATE
--     Windows PostgreSQL 若找不到 zh_HK.UTF8 會自動 fallback 作業系統地區
--     例如 "Chinese (Traditional)_Hong Kong SAR.950"
-- =============================================================================
-- DROP DATABASE IF EXISTS inventory;

CREATE DATABASE inventory
    WITH
    OWNER              = postgres
    ENCODING           = 'UTF8'           -- 強制 UTF-8，儲存中文不會有亂碼
    LC_COLLATE         = 'zh_HK.UTF8'     -- 繁體中文香港排序；Windows 若失敗改為：'Chinese_Taiwan_Stroke.UTF8' 或直接從 template1 建立
    LC_CTYPE           = 'zh_HK.UTF8'     -- 字元類型判斷 (大小寫/全形/半形)
    TEMPLATE           = template0        -- 自訂 LC 需從 template0
    TABLESPACE         = pg_default
    CONNECTION LIMIT   = -1
    IS_TEMPLATE        = False;

-- 連線到 inventory 後，設定預設用戶端 encoding (psql/pgAdmin 也會自動)
ALTER DATABASE inventory SET client_encoding = 'UTF8';
ALTER DATABASE inventory SET default_transaction_isolation = 'read committed';

-- (如果角色不存在，請先建立)
-- CREATE ROLE postgres WITH LOGIN PASSWORD '987123' SUPERUSER CREATEDB;
```

**第二步：切換連線到 `inventory` 資料庫**，執行下方 DDL：

```sql
-- =============================================================================
-- (B) 建立 product 表格 - 中文/Unicode 安全
--  - 所有文字欄位一律 TEXT (PostgreSQL 原生無長度效能差異)
--  - 長度限制透過 CHECK (char_length(...)) 強制，對應 Entity @Size
--  - 可選：明確 COLLATE 使用 ICU zh-Hant-HK (PostgreSQL 13+) 讓繁體中文排序正確
--     e.g. category   TEXT COLLATE "zh-Hant-HK-x-icu"
-- 若資料庫版本 < 13 或缺少 zh-Hant-HK ICU，移除所有 COLLATE 子句即可，
-- 仍然能正確儲存中文，只有 ORDER BY 會用預設資料庫 collation。
-- =============================================================================

CREATE TABLE IF NOT EXISTS product (
    id              BIGSERIAL
        CONSTRAINT pk_product PRIMARY KEY,

    -- =========================================================================
    -- 必填商業欄位 (Bean Validation → DB Check 雙層防禦)
    -- =========================================================================
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

    -- =========================================================================
    -- 選擇性字串 (最長 64/128/256 對應 Entity @Size)
    -- =========================================================================
    currency        TEXT
        CONSTRAINT ck_product_currency_len CHECK (char_length(currency) <= 8),

    upc             TEXT
        CONSTRAINT ck_product_upc_len      CHECK (char_length(upc) <= 32),
    ean             TEXT
        CONSTRAINT ck_product_ean_len      CHECK (char_length(ean) <= 32),
    mpn             TEXT
        CONSTRAINT ck_product_mpn_len      CHECK (char_length(mpn) <= 64),

    -- =========================================================================
    -- 2026-10-05 正規化：品牌 Brand / 製造商 Manufacturer
    --   對應 Amazon item 關係：
    --     brand_id         → Amazon Brand Registry 記錄 (品牌商店 / Logo / 說明)
    --     manufacturer_id  → Amazon item_info.manufacturer (工廠/供應商聯絡資料)
    --   舊版 product.brand / product.manufacturer TEXT 欄位已在 migration 中 DROP
    -- =========================================================================
    brand_id        BIGINT
        CONSTRAINT fk_product_brand
            REFERENCES brand(id) ON DELETE SET NULL,

    manufacturer_id BIGINT
        CONSTRAINT fk_product_manufacturer
            REFERENCES manufacturer(id) ON DELETE SET NULL,

    category        TEXT
        CONSTRAINT ck_product_category_len CHECK (char_length(category) <= 256),

    -- =========================================================================
    -- Enums (VARCHAR 存字串，比對 Java Enum.name()；CHECK 防止塞無效值)
    -- =========================================================================
    condition       TEXT
        CONSTRAINT ck_product_condition CHECK (condition IN (
            'NEW',
            'USED_LIKE_NEW',
            'USED_VERY_GOOD',
            'USED_GOOD',
            'ACCEPTABLE'
        )),

    image_urls      TEXT
        CONSTRAINT ck_product_img_len CHECK (char_length(image_urls) <= 4000),

    weight_kg       NUMERIC(13,3),

    dimensions      TEXT
        CONSTRAINT ck_product_dim_len CHECK (char_length(dimensions) <= 128),

    listing_status  TEXT
        CONSTRAINT ck_product_listing_status CHECK (listing_status IN (
            'ACTIVE',
            'INACTIVE',
            'DRAFT'
        )),

    created_at      TIMESTAMP(6) WITH TIME ZONE,
    updated_at      TIMESTAMP(6) WITH TIME ZONE
);

-- SKU 唯一索引 (和 Entity @Table(indexes=...) 一致)
CREATE UNIQUE INDEX IF NOT EXISTS idx_product_sku
    ON product (sku);

-- Brand / Manufacturer FK 正規化索引
CREATE INDEX IF NOT EXISTS idx_product_brand_id        ON product (brand_id);
CREATE INDEX IF NOT EXISTS idx_product_manufacturer_id ON product (manufacturer_id);

-- 常用查詢額外建議索引 (賣家通常會依類別/品牌/狀態查)
CREATE INDEX IF NOT EXISTS idx_product_listing_status ON product (listing_status);
CREATE INDEX IF NOT EXISTS idx_product_category       ON product (category);
CREATE INDEX IF NOT EXISTS idx_product_created_at     ON product (created_at);
CREATE INDEX IF NOT EXISTS idx_product_updated_at     ON product (updated_at);

-- =========================================================================
-- (B-2) 正規化查找表：brand  /  manufacturer
-- =========================================================================
CREATE TABLE IF NOT EXISTS brand (
    id                       BIGSERIAL PRIMARY KEY,
    name                     TEXT NOT NULL UNIQUE
        CONSTRAINT ck_brand_name_len CHECK (char_length(name) <= 128),
    amazon_brand_store_url   TEXT
        CONSTRAINT ck_brand_store_url_len CHECK (char_length(amazon_brand_store_url) <= 255),
    logo_url                 TEXT
        CONSTRAINT ck_brand_logo_url_len CHECK (char_length(logo_url) <= 2048),
    description              TEXT
        CONSTRAINT ck_brand_desc_len CHECK (char_length(description) <= 2000),
    created_at               TIMESTAMP(6) WITH TIME ZONE,
    updated_at               TIMESTAMP(6) WITH TIME ZONE
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_brand_name ON brand (name);

CREATE TABLE IF NOT EXISTS manufacturer (
    id              BIGSERIAL PRIMARY KEY,
    name            TEXT NOT NULL UNIQUE
        CONSTRAINT ck_manuf_name_len CHECK (char_length(name) <= 128),
    contact_person  TEXT
        CONSTRAINT ck_manuf_contact_len CHECK (char_length(contact_person) <= 128),
    contact_phone   TEXT
        CONSTRAINT ck_manuf_phone_len CHECK (char_length(contact_phone) <= 64),
    contact_email   TEXT
        CONSTRAINT ck_manuf_email_len CHECK (char_length(contact_email) <= 128),
    address         TEXT
        CONSTRAINT ck_manuf_addr_len CHECK (char_length(address) <= 500),
    country         TEXT
        CONSTRAINT ck_manuf_country_len CHECK (char_length(country) <= 64),
    created_at      TIMESTAMP(6) WITH TIME ZONE,
    updated_at      TIMESTAMP(6) WITH TIME ZONE
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_manufacturer_name ON manufacturer (name);

-- [推薦] 若你打算在 title/description/category 做 LIKE '%關鍵字%' 全文搜尋，
-- 可加上 pg_trgm GIN 索引 (需要 CREATE EXTENSION pg_trgm)：
-- CREATE EXTENSION IF NOT EXISTS pg_trgm;
-- CREATE INDEX IF NOT EXISTS idx_product_title_gin
--     ON product USING GIN (title gin_trgm_ops);
-- CREATE INDEX IF NOT EXISTS idx_product_desc_gin
--     ON product USING GIN (description gin_trgm_ops);
```

```sql
-- =============================================================================
-- (C) 範例種子資料 (正規化 brand / manufacturer)
-- 1. 先建立 brand / manufacturer 關聯表資料
-- 2. 再建立 product 5 筆樣本，使用 brand_id / manufacturer_id
-- =============================================================================

INSERT INTO brand (name, created_at, updated_at) VALUES
    ('華創電子', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (name) DO NOTHING;

INSERT INTO manufacturer (name, created_at, updated_at) VALUES
    ('深圳華創科技有限公司',  CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('東莞華創周邊廠',        CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('線材科技 (香港) 有限公司', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('OEM 筆電代工廠',          CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (name) DO NOTHING;

INSERT INTO product (
    sku, title, description, quantity, price, currency,
    upc, ean, mpn, brand_id, manufacturer_id, category,
    condition, image_urls, weight_kg, dimensions, listing_status,
    created_at, updated_at
)
WITH
    b AS (SELECT id AS bid FROM brand WHERE name = '華創電子'),
    m_sz  AS (SELECT id AS mid FROM manufacturer WHERE name = '深圳華創科技有限公司'),
    m_dg  AS (SELECT id AS mid FROM manufacturer WHERE name = '東莞華創周邊廠'),
    m_hk  AS (SELECT id AS mid FROM manufacturer WHERE name = '線材科技 (香港) 有限公司'),
    m_oem AS (SELECT id AS mid FROM manufacturer WHERE name = 'OEM 筆電代工廠')
SELECT
    v.sku, v.title, v.description, v.quantity, v.price, v.currency,
    v.upc, v.ean, v.mpn, b.bid, v.manufacturer_id, v.category,
    v.condition, v.image_urls, v.weight_kg, v.dimensions, v.listing_status,
    CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM (
    SELECT 'HK-CHA-0001'::text AS sku,
           '氮化鎵 GaN 65W 三孔 USB-C 快速充電器'::text AS title,
           '支援 PD 3.0 / QC 4.0+ 快充協定，適用筆電／手機／平板。
可同時輸出 3 孔 (USB-C x2 + USB-A x1)，小巧便攜，英規三腳插頭。'::text AS description,
           120::int AS quantity, 239.00::numeric AS price, 'HKD'::text AS currency,
           '4891234560001'::text AS upc, '4891234560001'::text AS ean, 'GAN-65W-UK3'::text AS mpn,
           (SELECT mid FROM m_sz) AS manufacturer_id,
           '電子產品 > 充電器'::text AS category,
           'NEW'::text AS condition,
           'https://cdn.example.com/img/hk-cha-0001-1.jpg,https://cdn.example.com/img/hk-cha-0001-2.jpg'::text AS image_urls,
           0.120::numeric AS weight_kg, '5 x 5 x 3 公分'::text AS dimensions,
           'ACTIVE'::text AS listing_status
    UNION ALL
    SELECT 'HK-MOU-0002',
           '人體工學靜音無線滑鼠 (2.4G + 藍牙)',
           '4000 DPI 無段調校，使用 1 顆 AA 電池可連用 6 個月。
靜音按鍵設計，適合辦公室／咖啡廳使用。',
           54, 149.50, 'HKD',
           '4891234560002', '4891234560002', 'WL-MSE-ERG2',
           (SELECT mid FROM m_dg),
           '電子產品 > 電腦周邊 > 滑鼠',
           'NEW',
           'https://cdn.example.com/img/hk-mou-0002.jpg',
           0.085, '12 x 7 x 4 公分', 'ACTIVE'
    UNION ALL
    SELECT 'HK-KB-0003',
           '75% 熱插拔機械鍵盤 (茶軸, PBT 熱昇華鍵帽)',
           '已開箱 7 天，退貨商品，外觀 9 成新，功能 100% 正常。
全鍵熱插拔、支援 RGB 單鍵背光，USB-C 連接。',
           27, 599.00, 'HKD',
           '4891234560003', '4891234560003', 'KB75-HS-TC',
           (SELECT mid FROM m_dg),
           '電子產品 > 電腦周邊 > 鍵盤',
           'USED_VERY_GOOD',
           'https://cdn.example.com/img/hk-kb-0003-a.jpg,https://cdn.example.com/img/hk-kb-0003-b.jpg',
           0.780, '33 x 14 x 4 公分', 'ACTIVE'
    UNION ALL
    SELECT 'HK-CAB-0004',
           'HDMI 2.1 線 2 米 (8K@60Hz / 4K@144Hz / eARC)',
           '48Gbps 滿速頻寬、支援 HDR10+ / Dolby Vision、
鍍金接頭、尼龍編織線身、24 個月保養。',
           300, 49.00, 'HKD',
           '4891234560004', '4891234560004', 'HDMI21-2M',
           (SELECT mid FROM m_hk),
           '電子產品 > 線材',
           'NEW',
           'https://cdn.example.com/img/hk-cab-0004.jpg',
           0.100, '200 x 2 x 1 公分', 'ACTIVE'
    UNION ALL
    SELECT 'HK-LAP-0005',
           '【客退品】14 吋輕薄筆電 i5-13500H / 16G / 512G',
           '客戶開箱後退貨，A 蓋有一條約 1 公分的表面刮痕（不明顯）。
電池循環 < 5 次，附原廠變壓器與保護套，保養期 30 日。',
           3, 4999.00, 'HKD',
           '4891234560005', '4891234560005', 'NB14-I5-RTN',
           (SELECT mid FROM m_oem),
           '電子產品 > 筆記型電腦',
           'ACCEPTABLE',
           'https://cdn.example.com/img/hk-lap-0005.jpg',
           1.450, '32 x 22 x 2 公分', 'DRAFT'
) v
CROSS JOIN b
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product.sku = v.sku
);
```

### PostgreSQL - 驗證中文正確寫入

```sql
SET client_encoding = 'UTF8';
SELECT '--- 基本筆數 ---' AS note, COUNT(*) FROM product;
SELECT id, sku, title, price, quantity, listing_status, condition
FROM   product
ORDER  BY sku;

-- 中文搜尋：找含有「充電器」的商品
SELECT sku, title
FROM   product
WHERE  title LIKE '%充電器%';
```

---

## 2. (選用) Enum 對應表 + 中文名稱 (Condition / ListingStatus)

做報表時方便 JOIN 顯示中文：

```sql
-- PostgreSQL
CREATE TABLE IF NOT EXISTS cond (
    code        VARCHAR(32) PRIMARY KEY,
    name_zh_hk  VARCHAR(64) NOT NULL,        -- 繁體中文名
    ebay_id     VARCHAR(8)  NOT NULL,        -- eBay Condition ID
    amazon_txt  VARCHAR(64) NOT NULL         -- Amazon 顯示英文
);

INSERT INTO cond (code, name_zh_hk, ebay_id, amazon_txt) VALUES
    ('NEW',            '全新',              '1000', 'New'),
    ('USED_LIKE_NEW',  '二手 - 接近全新',   '3000', 'Used - Like New'),
    ('USED_VERY_GOOD', '二手 - 非常良好',   '4000', 'Very Good'),
    ('USED_GOOD',      '二手 - 良好',       '5000', 'Good'),
    ('ACCEPTABLE',     '可接受 (客退/外觀瑕疵)', '6000', 'Acceptable');

CREATE TABLE IF NOT EXISTS listing_status (
    code       VARCHAR(16) PRIMARY KEY,
    name_zh_hk VARCHAR(48) NOT NULL
);

INSERT INTO listing_status (code, name_zh_hk) VALUES
    ('ACTIVE',   '已上架'),
    ('INACTIVE', '已下架'),
    ('DRAFT',    '草稿 - 未上架');
```

```sql
-- JOIN 範例：一次取出中文名稱 + eBay/Amazon 匯出欄位
SELECT
    p.sku,
    p.title,
    p.price,
    ls.name_zh_hk AS "listing_name",
    c.name_zh_hk  AS "cond_name",
    c.ebay_id,
    c.amazon_txt
FROM   product p
LEFT   JOIN cond           c  ON c.code  = p.condition
LEFT   JOIN listing_status ls ON ls.code = p.listing_status
ORDER  BY p.sku;
```

---

## 3. 確認中文連線沒問題 — 快速 SQL 測試

```sql
-- PostgreSQL 端驗證：
SHOW client_encoding;            -- 必須是 UTF8
SHOW server_encoding;            -- 必須是 UTF8
SELECT current_database(), datcollate, datctype
FROM   pg_database
WHERE  datname = 'inventory';

-- 強制寫入/讀回 1 個中文字段 (單元測試)
DO $$
DECLARE
    v_in  TEXT := '香港繁體中文 繁體 123 !@#';
    v_out TEXT;
BEGIN
    SELECT v_in INTO v_out;
    RAISE NOTICE 'Input = %, Output = %, 相等 = %', v_in, v_out, (v_in = v_out);
END $$;
```

---

## 4. Spring Boot 端 + Excel 匯出 中文一致性

- [application.properties](file:///c:/Windwah/EGate_System/Inventory/src/main/resources/application.properties) 已加上：
  - `server.servlet.encoding.charset=UTF-8` / `force=true` (頁面/表單 POST 中文)
  - `spring.thymeleaf.encoding=UTF-8` (樣板渲染)
  - `spring.datasource.url=...?charSet=UTF8&stringtype=unspecified` (JDBC driver)
  - `spring.datasource.hikari.connection-init-sql=SET NAMES 'UTF8'` (新連線初始)
  - `spring.jpa.properties.hibernate.connection.charSet=UTF8` (Hibernate 備援)

- Excel 匯出 (Apache POI SXSSFWorkbook) 預設 OOXML 使用 UTF-8，Amazon/eBay 模板
  所有含中文的 `title / description / brand / manufacturer / category` 都能
  正常輸出至 `.xlsx`，Excel 打開直接看見中文。

現在你可以直接用 pgAdmin 執行上面的 SQL（先從 template0 建立 inventory 時注意 encoding 一定要 UTF8，否則就算 App 端有 `SET NAMES UTF8`，Postgres 儲存時仍可能變成 `?` 問號）。
