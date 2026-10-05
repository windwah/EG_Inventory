SET client_encoding = 'UTF8';
-- Ensure COBI brand / COBI FACTORY S.A. manufacturer exist
INSERT INTO brand (name, created_at, updated_at) VALUES ('COBI', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (name) DO NOTHING;
INSERT INTO manufacturer (name, created_at, updated_at) VALUES ('COBI FACTORY S.A', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (name) DO NOTHING;

INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-6281', '2476 PCS TRAINS /6281/ KRIEGSLOKOMOTIVE BAUREIHE', '2476 PCS TRAINS /6281/ KRIEGSLOKOMOTIVE BAUREIHE', 100, 149.99, 'EUR', '5902251062811', 'COBI TRAINS',
    'NEW', '/extracted_images/img_A12.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TRAINS', 'COBI-6281', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 149.99, 'RRP 149,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-6282', '2505 PCS TRAINS /6282/ DR BR 52 STEAM LOCOMOTIVE', '2505 PCS TRAINS /6282/ DR BR 52 STEAM LOCOMOTIVE', 100, 149.99, 'EUR', '5902251062828', 'COBI TRAINS',
    'NEW', '/extracted_images/img_A13.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TRAINS', 'COBI-6282', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 149.99, 'RRP 149,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-6283', '1723 PCS TRAINS /6283/ STEAM LOCOMOTIVE DR BR 52', '1723 PCS TRAINS /6283/ STEAM LOCOMOTIVE DR BR 52', 100, 79.99, 'EUR', '5902251062835', 'COBI TRAINS',
    'NEW', '/extracted_images/img_A14.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TRAINS', 'COBI-6283', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-6285', '584 PCS TRAINS 6285/ GUTERWAGEN TYP OMMR 32 LINZ', '584 PCS TRAINS 6285/ GUTERWAGEN TYP OMMR 32 LINZ', 100, 49.99, 'EUR', '5902251062859', 'COBI TRAINS',
    'NEW', '/extracted_images/img_A15.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TRAINS', 'COBI-6285', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-6286', '2721 PCS TRAINS /6286/ STEAM LOCOMOTIVE DR BR 03', '2721 PCS TRAINS /6286/ STEAM LOCOMOTIVE DR BR 03', 100, 199.99, 'EUR', '5902251062866', 'COBI TRAINS',
    'NEW', '/extracted_images/img_A16.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TRAINS', 'COBI-6286', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 199.99, 'RRP 199,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-6287', '2747 PCS TRAINS /6287/ DRB CLASS 52 STEAM L&RAIL', '2747 PCS TRAINS /6287/ DRB CLASS 52 STEAM L&RAIL', 100, 199.99, 'EUR', '5902251062873', 'COBI TRAINS',
    'NEW', '/extracted_images/img_A17.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TRAINS', 'COBI-6287', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 199.99, 'RRP 199,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-6288', '2564 PCS TRAINS /6288/ DR BR 03 STEAM LOCOMOTIVE', '2564 PCS TRAINS /6288/ DR BR 03 STEAM LOCOMOTIVE', 100, 199.99, 'EUR', '5902251062880', 'COBI TRAINS',
    'NEW', '/extracted_images/img_A18.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TRAINS', 'COBI-6288', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 199.99, 'RRP 199,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-6289', '2001 PCS TRAINS /6289/ COMPIEGNE WAGON 1940', '2001 PCS TRAINS /6289/ COMPIEGNE WAGON 1940', 100, 189.99, 'EUR', '5902251062897', 'COBI TRAINS',
    'NEW', '/extracted_images/img_A19.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TRAINS', 'COBI-6289', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 189.99, 'RRP 189,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-6291', '1927 PCS TRAINS /6291/ COMPIEGNE WAGON 1918', '1927 PCS TRAINS /6291/ COMPIEGNE WAGON 1918', 100, 189.99, 'EUR', '5902251062910', 'COBI TRAINS',
    'NEW', '/extracted_images/img_A20.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TRAINS', 'COBI-6291', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 189.99, 'RRP 189,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-6292', 'TRAINS /6292/ FLYING SCOTSMAN BST 2677 PCS ', 'TRAINS /6292/ FLYING SCOTSMAN BST 2677 PCS ', 100, 199.99, 'EUR', '5902251062927', 'COBI TRAINS',
    'NEW', '/extracted_images/img_A21.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TRAINS', 'COBI-6292', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 199.99, 'RRP 199,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5811A', '757 PCS TOP GUN /5811A/ F14 TOMCAT', '757 PCS TOP GUN /5811A/ F14 TOMCAT', 100, 69.99, 'EUR', '5902251058111', 'COBI TOP GUN',
    'NEW', '/extracted_images/img_A23.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TOP GUN', 'COBI-5811A', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5847A', '150 PCS TOP GUN MAVERICK /5847/ P-51D MUSTANG', '150 PCS TOP GUN MAVERICK /5847/ P-51D MUSTANG', 100, 25.99, 'EUR', '5902251058470', 'COBI TOP GUN',
    'NEW', '/extracted_images/img_A24.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TOP GUN', 'COBI-5847A', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'NEW PRODUCTION 07 AUGUST 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5859', '332 PCS TOP GUN /5859/ MIG-28', '332 PCS TOP GUN /5859/ MIG-28', 100, 39.99, 'EUR', '5902251058593', 'COBI TOP GUN',
    'NEW', '/extracted_images/img_A25.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TOP GUN', 'COBI-5859', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5920', '869  PCS TOP GUN /5920/ GRUMMAN F-14 TOMCAT', '869  PCS TOP GUN /5920/ GRUMMAN F-14 TOMCAT', 100, 79.99, 'EUR', '5902251059200', 'COBI TOP GUN',
    'NEW', '/extracted_images/img_A26.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TOP GUN', 'COBI-5920', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5921', '851 PCS TOP GUN MAVERICK /5921/ ENEMY STRIKE JET                 ', '851 PCS TOP GUN MAVERICK /5921/ ENEMY STRIKE JET                 ', 100, 79.99, 'EUR', '5902251059217', 'COBI TOP GUN',
    'NEW', '/extracted_images/img_A27.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TOP GUN', 'COBI-5921', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5922', '6130 PCS TOP GUN /5922/ AIRCRAFT CARRIEC CV-65', '6130 PCS TOP GUN /5922/ AIRCRAFT CARRIEC CV-65', 100, 499.00, 'EUR', '5902251059224', 'COBI TOP GUN',
    'NEW', '/extracted_images/img_A28.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TOP GUN', 'COBI-5922', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 499.00, 'RRP 499, EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5923', 'TOP GUN /5923/ F-14 TOMCAT 58 KL.', 'TOP GUN /5923/ F-14 TOMCAT 58 KL.', 100, 9.99, 'EUR', '5902251059231', 'COBI TOP GUN',
    'NEW', '/extracted_images/img_A29.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TOP GUN', 'COBI-5923', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5925', 'TOP GUN /5925/ LOGO 630 KL.', 'TOP GUN /5925/ LOGO 630 KL.', 100, 69.99, 'EUR', '5902251059255', 'COBI TOP GUN',
    'NEW', '/extracted_images/img_A30.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TOP GUN', 'COBI-5925', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5943', 'TOP GUN /5943/ CDU TOP GUN           ( 12x 5923+ 8 x 5924) ', 'TOP GUN /5943/ CDU TOP GUN           ( 12x 5923+ 8 x 5924) ', 100, 183.80, 'EUR', '5902251059439', 'COBI TOP GUN',
    'NEW', '/extracted_images/img_A31.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'TOP GUN', 'COBI-5943', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 183.80, 'RRP 183,80 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-1680', '593 PCS HC /1680/ R.M.S. TITANIC', '593 PCS HC /1680/ R.M.S. TITANIC', 100, 49.99, 'EUR', '5902251016807', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A33.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-1680', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'NEW PRODUCTION JULY  2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-1686', 'HC /1686/ R.M.S. TITANIC 3260 PCS', 'HC /1686/ R.M.S. TITANIC 3260 PCS', 100, 259.99, 'EUR', '5902251016869', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A34.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-1686', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 259.99, 'RRP 259,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-1688', '850 PCS HC /1688/ TITANIC', '850 PCS HC /1688/ TITANIC', 100, 69.99, 'EUR', '5902251016883', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A35.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-1688', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-1384', 'HC /1384/ DORNIER DO JA WAL "AMUNDSEN" N-25 478K', 'HC /1384/ DORNIER DO JA WAL "AMUNDSEN" N-25 478K', 100, 54.99, 'EUR', '5902251013844', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A37.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-1384', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 54.99, 'RRP 54,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-1681', '636 PCS HC /1681/ H.M.H.S. BRITANNIC', '636 PCS HC /1681/ H.M.H.S. BRITANNIC', 100, 49.99, 'EUR', '5902251016814', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A38.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-1681', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', '07 AUGUST 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-1687', '595 PCS HC /1687/ R.M.S. OLYMPIC (1911)', '595 PCS HC /1687/ R.M.S. OLYMPIC (1911)', 100, 49.99, 'EUR', '5902251016876', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A39.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-1687', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-1689', '519 PCS HC /1689/ CONCORDE', '519 PCS HC /1689/ CONCORDE', 100, 59.99, 'EUR', '5902251016890', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A40.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-1689', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', '05 JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26603', '836 PCS BOEING /26603/ 787 DREAMLINER', '836 PCS BOEING /26603/ 787 DREAMLINER', 100, 69.99, 'EUR', '5902251266035', 'COBI BOEING',
    'NEW', '/extracted_images/img_A42.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'BOEING', 'COBI-26603', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26608', '340 PCS BOEING /26608/ 737 - 8', '340 PCS BOEING /26608/ 737 - 8', 100, 39.99, 'EUR', '5902251266080', 'COBI BOEING',
    'NEW', '/extracted_images/img_A43.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'BOEING', 'COBI-26608', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'VERY LIMITED QUANTITY, ''NEW PRODUCTION 26 JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26610A', '1085 PCS BOEING /26610/ 747 AIR FORCE ONE', '1085 PCS BOEING /26610/ 747 AIR FORCE ONE', 100, 79.99, 'EUR', '5902251266103', 'COBI BOEING',
    'NEW', '/extracted_images/img_A44.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'BOEING', 'COBI-26610A', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', '30 JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20090', '41 PCS HC NW /20090/ 3 FIGURES SET', '41 PCS HC NW /20090/ 3 FIGURES SET', 100, 9.99, 'EUR', '5902251200909', 'COBI HC NAPOLEONIC WARS',
    'NEW', '/extracted_images/img_A46.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HC NAPOLEONIC WARS', 'COBI-20090', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20091', '145 PCS HC NW /20091/ THE BATTLE OF MOSCOW', '145 PCS HC NW /20091/ THE BATTLE OF MOSCOW', 100, 19.99, 'EUR', '5902251200916', 'COBI HC NAPOLEONIC WARS',
    'NEW', '/extracted_images/img_A47.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HC NAPOLEONIC WARS', 'COBI-20091', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20092', '243 PCS HC NW /20092/ CAMPAGNE D''EGYPTE 1798-1801', '243 PCS HC NW /20092/ CAMPAGNE D''EGYPTE 1798-1801', 100, 29.99, 'EUR', '5902251200923', 'COBI HC NAPOLEONIC WARS',
    'NEW', '/extracted_images/img_A48.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HC NAPOLEONIC WARS', 'COBI-20092', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 29.99, 'RRP 29,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20093', 'HC NW /20093/ FRENCH ARTILLERYMAN & CANNON 97 PCS', 'HC NW /20093/ FRENCH ARTILLERYMAN & CANNON 97 PCS', 100, 19.99, 'EUR', '5902251200930', 'COBI HC NAPOLEONIC WARS',
    'NEW', '/extracted_images/img_A49.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HC NAPOLEONIC WARS', 'COBI-20093', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20094', '39 PCS HC NW /20094/ 3 FIGURINES - PRUSIAN', '39 PCS HC NW /20094/ 3 FIGURINES - PRUSIAN', 100, 9.99, 'EUR', '5902251200947', 'COBI HC NAPOLEONIC WARS',
    'NEW', '/extracted_images/img_A50.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HC NAPOLEONIC WARS', 'COBI-20094', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20096', '2517 PCS HC NW /20096/ HMS VICTORY', '2517 PCS HC NW /20096/ HMS VICTORY', 100, 159.99, 'EUR', '5902251200961', 'COBI HC NAPOLEONIC WARS',
    'NEW', '/extracted_images/img_A51.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HC NAPOLEONIC WARS', 'COBI-20096', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 159.99, 'RRP 159,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20097', '80 PCS HC NW /20097/ NELSON''S COLUMN TRAFALGAR', '80 PCS HC NW /20097/ NELSON''S COLUMN TRAFALGAR', 100, 19.99, 'EUR', '5902251200978', 'COBI HC NAPOLEONIC WARS',
    'NEW', '/extracted_images/img_A52.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HC NAPOLEONIC WARS', 'COBI-20097', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20098', '45 PCS HC NW /20098/ NAPOLEONIC ERA SOLDIERS', '45 PCS HC NW /20098/ NAPOLEONIC ERA SOLDIERS', 100, 15.99, 'EUR', '5902251200985', 'COBI HC NAPOLEONIC WARS',
    'NEW', '/extracted_images/img_A53.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HC NAPOLEONIC WARS', 'COBI-20098', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 15.99, 'RRP 15,99 EUR', '06 JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2988', '263 PCS HC GREAT WAR /2988/ ROLLS ROYCE ARMORED', '263 PCS HC GREAT WAR /2988/ ROLLS ROYCE ARMORED', 100, 25.99, 'EUR', '5902251029883', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A55.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2988', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2990', '886 PCS HC GREAT WAR /2990/ VICKERS A1E1 INDEPEN', '886 PCS HC GREAT WAR /2990/ VICKERS A1E1 INDEPEN', 100, 39.99, 'EUR', '5902251029906', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A56.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2990', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2994', '256 PCS HC GREAT WAR /2994/ FOKKER D. VII', '256 PCS HC GREAT WAR /2994/ FOKKER D. VII', 100, 34.99, 'EUR', '5902251029944', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A57.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2994', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 34.99, 'RRP 34,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2995', '848 PCS HC GREAT WAR /2995/ MARK V (MALE) N.9199', '848 PCS HC GREAT WAR /2995/ MARK V (MALE) N.9199', 100, 49.99, 'EUR', '5902251029951', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A58.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2995', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2996', '221 PCS HC GREAT WAR /2996/ FOKKER DRI RED.BARON', '221 PCS HC GREAT WAR /2996/ FOKKER DRI RED.BARON', 100, 34.99, 'EUR', '5902251029968', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A59.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2996', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 34.99, 'RRP 34,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2997', '277 PCS HC GREAT WAR /2997/ NIEUPORT 17C.1 110HP', '277 PCS HC GREAT WAR /2997/ NIEUPORT 17C.1 110HP', 100, 36.99, 'EUR', '5902251029975', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A60.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2997', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 36.99, 'RRP 36,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2998', '274 PCS HC GREAT WAR /2998/ NIEUPORT 17C.1 110 PL', '274 PCS HC GREAT WAR /2998/ NIEUPORT 17C.1 110 PL', 100, 36.99, 'EUR', '5902251029982', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A61.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2998', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 36.99, 'RRP 36,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2058A', '33 PCS HC WWII /2058A/ D-DAY 6 JUN 1944', '33 PCS HC WWII /2058A/ D-DAY 6 JUN 1944', 100, 9.99, 'EUR', '5902251020583', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A63.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2058A', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2060', '33 PCS HC WWII /2060/ GERMAN INFANTRY', '33 PCS HC WWII /2060/ GERMAN INFANTRY', 100, 9.99, 'EUR', '5902251020606', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A64.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2060', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2061', '76 PCS HC WWII /2061/ BATTLE OF STALINGRAD', '76 PCS HC WWII /2061/ BATTLE OF STALINGRAD', 100, 19.99, 'EUR', '5902251020613', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A65.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2061', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2062', '44 PCS HC WWII /2062/ POLISH UHLANS', '44 PCS HC WWII /2062/ POLISH UHLANS', 100, 15.99, 'EUR', '5902251020620', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A66.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2062', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 15.99, 'RRP 15,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2063', '73 PCS HC WWII /2063/ BATTLE OF MONTE CASSINO', '73 PCS HC WWII /2063/ BATTLE OF MONTE CASSINO', 100, 19.99, 'EUR', '5902251020637', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A67.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2063', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2064', 'HC WWII /2064/ BATTLE OF BERLIN 1945 77 KL.', 'HC WWII /2064/ BATTLE OF BERLIN 1945 77 KL.', 100, 19.99, 'EUR', '5902251020644', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A68.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2064', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2257', '293 PCS HC WWII /2257/ 1942 AMBULANCE WC 54', '293 PCS HC WWII /2257/ 1942 AMBULANCE WC 54', 100, 24.99, 'EUR', '5902251022570', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A69.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2257', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2264', '199 PCS HC WWII /2264/ CITROEN TRACTION 7C', '199 PCS HC WWII /2264/ CITROEN TRACTION 7C', 100, 9.99, 'EUR', '5902251022648', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A70.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2264', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2266', '236 PCS HC WWII /2266/ CITROEN TRACTION 11CV BL', '236 PCS HC WWII /2266/ CITROEN TRACTION 11CV BL', 100, 9.99, 'EUR', '5902251022662', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A71.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2266', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2267', '262 PCS HC WWII /2267/ CITROEN 15CV SIX D', '262 PCS HC WWII /2267/ CITROEN 15CV SIX D', 100, 9.99, 'EUR', '5902251022679', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A72.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2267', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2279', '525 PCS HC WWII /2279/ H.M.C M8 SCOTT', '525 PCS HC WWII /2279/ H.M.C M8 SCOTT', 100, 25.99, 'EUR', '5902251022792', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A73.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2279', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2281', '498 PCS HC WWII /2281/ SD.KFZ.9/1 "FAMO"', '498 PCS HC WWII /2281/ SD.KFZ.9/1 "FAMO"', 100, 39.99, 'EUR', '5902251022815', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A74.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2281', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2283', '485 PCS HC WWII /2283/ SD.KFZ.251/9 "STUMMEL"', '485 PCS HC WWII /2283/ SD.KFZ.251/9 "STUMMEL"', 100, 39.99, 'EUR', '5902251022839', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A75.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2283', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2287', '470 PCS HC WWII /2287/ SD.KFZ 234/2 PUMA', '470 PCS HC WWII /2287/ SD.KFZ 234/2 PUMA', 100, 39.99, 'EUR', '5902251022877', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A76.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2287', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2288', '438 PCS HC WWII /2288/ SD.KFZ 234/3 STUMMEL', '438 PCS HC WWII /2288/ SD.KFZ 234/3 STUMMEL', 100, 39.99, 'EUR', '5902251022884', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A77.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2288', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2299', '2280 PCS HC WWII /2299/ CHURCH SAINTE-MERE-EGLIS', '2280 PCS HC WWII /2299/ CHURCH SAINTE-MERE-EGLIS', 100, 129.99, 'EUR', '5902251022990', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A78.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2299', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 129.99, 'RRP 129,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2405', '185 PCS HC WWII /2405/ 1937 HORCH 901 (KFZ.15)', '185 PCS HC WWII /2405/ 1937 HORCH 901 (KFZ.15)', 100, 9.99, 'EUR', '5902251024055', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A79.jpg', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2405', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2543', '590 PCS HC WWII /2543/ M24 CHAFFEE', '590 PCS HC WWII /2543/ M24 CHAFFEE', 100, 39.99, 'EUR', '5902251025434', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A80.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2543', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2550', '720 PCS HC WWII /2550/ SHERMAN M4A3E2', '720 PCS HC WWII /2550/ SHERMAN M4A3E2', 100, 39.99, 'EUR', '5902251025502', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A81.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2550', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2572', '1511 PCS HC WWII /2572/ PANZERKAMPFWAGEN E-100', '1511 PCS HC WWII /2572/ PANZERKAMPFWAGEN E-100', 100, 79.99, 'EUR', '5902251025724', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A82.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2572', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2583', '1268 PCS HC WWII /2583/ SD.KFZ. 184 FERDINAND', '1268 PCS HC WWII /2583/ SD.KFZ. 184 FERDINAND', 100, 89.99, 'EUR', '5902251025830', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A83.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2583', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 89.99, 'RRP 89,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2585', '1100 PCS HC WWII /2585/ 38CM STURMMORSER STURMT.', '1100 PCS HC WWII /2585/ 38CM STURMMORSER STURMT.', 100, 94.99, 'EUR', '5902251025854', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A84.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2585', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 94.99, 'RRP 94,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2588', 'HC WWII /2588/ PANZER VI TIGER I NO 131 1275 PCS', 'HC WWII /2588/ PANZER VI TIGER I NO 131 1275 PCS', 100, 96.99, 'EUR', '5902251025885', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A85.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2588', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 96.99, 'RRP 96,99 EUR', 'NEW PRODUCTION SEPTEMBER 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2590', '1170 PCS HC WWII /2590/ IS-3 SOVIET HEAVY TANK', '1170 PCS HC WWII /2590/ IS-3 SOVIET HEAVY TANK', 100, 94.99, 'EUR', '5902251025908', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A86.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2590', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 94.99, 'RRP 94,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2592', '1107 PCS HC WWII /2592/ PZKPFW IV AUSF.G', '1107 PCS HC WWII /2592/ PZKPFW IV AUSF.G', 100, 94.99, 'EUR', '5902251025922', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A87.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2592', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 94.99, 'RRP 94,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2597', '813 PCS HC WWII /2597/ PANZERKAMPFWAGEN II AUSFF', '813 PCS HC WWII /2597/ PANZERKAMPFWAGEN II AUSFF', 100, 79.99, 'EUR', '5902251025977', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A88.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2597', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2598', '860 PCS HC WWII /2598/ SD.KFZ.124 WESPE EX.ED.', '860 PCS HC WWII /2598/ SD.KFZ.124 WESPE EX.ED.', 100, 89.99, 'EUR', '5902251025984', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A89.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2598', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 89.99, 'RRP 89,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2654A', '1152 PCS HC WWII /2654/ PZ.KPFW.V PANTHER AUSF.A', '1152 PCS HC WWII /2654/ PZ.KPFW.V PANTHER AUSF.A', 100, 99.99, 'EUR', '5902251026547', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A90.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2654A', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRP 99,99 EUR', '10 JULY 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2655', 'HC WWII /2655/ PANZER V PANTHER AUSF.G PUDEL1133', 'HC WWII /2655/ PANZER V PANTHER AUSF.G PUDEL1133', 100, 99.99, 'EUR', '5902251026554', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A91.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2655', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRPP 99,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2657', '502 PCS HC WWII /2657/ SD.KFZ.222', '502 PCS HC WWII /2657/ SD.KFZ.222', 100, 39.99, 'EUR', '5902251026578', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A92.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2657', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2658', 'HC WWII /2658/ TANKETTE TK-3/LE.PZKPFW TK 318 KL', 'HC WWII /2658/ TANKETTE TK-3/LE.PZKPFW TK 318 KL', 100, 34.99, 'EUR', '5902251026585', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A93.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2658', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 34.99, 'RRP 34,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2660', '654 PCS HC WWII /2660/ PANZER I (FRANCE 1940)', '654 PCS HC WWII /2660/ PANZER I (FRANCE 1940)', 100, 49.99, 'EUR', '5902251026608', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A94.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2660', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2661', '669 PCS HC WWII /2661/ LIGHT TANK 7 TP', '669 PCS HC WWII /2661/ LIGHT TANK 7 TP', 100, 49.99, 'EUR', '5902251026615', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A95.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2661', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2663', '1118 PCS HC WWII /2663/ SD.KFZ.165 PANZER.HUMMEL', '1118 PCS HC WWII /2663/ SD.KFZ.165 PANZER.HUMMEL', 100, 99.99, 'EUR', '5902251026639', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A96.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2663', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRP 99,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2665', '720 PCS HC WWII /2665/ STURMPANZER 38(T) GRILLE', '720 PCS HC WWII /2665/ STURMPANZER 38(T) GRILLE', 100, 49.99, 'EUR', '5902251026653', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A97.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2665', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2666', '690  PCS HC WWII /2666/ PANZER 38(T)/(CKD) LT VZ', '690  PCS HC WWII /2666/ PANZER 38(T)/(CKD) LT VZ', 100, 49.99, 'EUR', '5902251026660', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A98.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2666', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2668', '1012 PCS HC WWII /2668/ JAGDPANZER IV/70 (V)', '1012 PCS HC WWII /2668/ JAGDPANZER IV/70 (V)', 100, 99.99, 'EUR', '5902251026684', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A99.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2668', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRP 99,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2670', 'HC WWII /2670/ JAGDPANZER 38(T) "CHWAT" 732 KL.', 'HC WWII /2670/ JAGDPANZER 38(T) "CHWAT" 732 KL.', 100, 59.99, 'EUR', '5902251026707', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A100.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2670', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2672', 'HC WWII /2672/ PANZER III AUSF.H 958 KL.', 'HC WWII /2672/ PANZER III AUSF.H 958 KL.', 100, 89.99, 'EUR', '5902251026721', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A101.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2672', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 89.99, 'RRP 89,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2674', '1355 PCS HC WWII /2674/ PANZERJAGER TIGER AUSF.B', '1355 PCS HC WWII /2674/ PANZERJAGER TIGER AUSF.B', 100, 119.99, 'EUR', '5902251026745', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A102.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2674', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 119.99, 'RRP 119,99 EUR', '19 JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2710', '340 PCS HC WWII /2710/ PZKPFW VI TIGER "131"', '340 PCS HC WWII /2710/ PZKPFW VI TIGER "131"', 100, 29.99, 'EUR', '5902251027100', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A103.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2710', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 29.99, 'RRP 29,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2719', '258 PCS HC WWII /2719/ RENAULT R-35', '258 PCS HC WWII /2719/ RENAULT R-35', 100, 19.99, 'EUR', '5902251027193', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A104.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2719', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2732', '500 PCS HC WWII /2732/ PZ.KPFW.VIB TIGER II KON.', '500 PCS HC WWII /2732/ PZ.KPFW.VIB TIGER II KON.', 100, 39.99, 'EUR', '5902251027322', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A105.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2732', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2733', 'HC WWII /2733/ PANZERJAGER TIGER AUSF.B 528 PCS', 'HC WWII /2733/ PANZERJAGER TIGER AUSF.B 528 PCS', 100, 39.99, 'EUR', '5902251027339', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A106.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2733', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2734', '442 PCS HC WWII /2734/ PANZER VI TIGER I NO 131', '442 PCS HC WWII /2734/ PANZER VI TIGER I NO 131', 100, 36.99, 'EUR', '5902251027346', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A107.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2734', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 36.99, 'RRP 36,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2735', '422 PCS HC WWII /2735/ PZ.KPFW.VI TIGER AUSF.E', '422 PCS HC WWII /2735/ PZ.KPFW.VI TIGER AUSF.E', 100, 36.99, 'EUR', '5902251027353', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A108.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2735', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 36.99, 'RRP 36,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2740', '595 PCS HC WWII /2740/ RENAULT, VALENTINE, PANZE', '595 PCS HC WWII /2740/ RENAULT, VALENTINE, PANZE', 100, 39.99, 'EUR', '5902251027407', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A109.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2740', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2803', '1326 PCS HC WWII /2803/ KUBELWAGEN TYP 82', '1326 PCS HC WWII /2803/ KUBELWAGEN TYP 82', 100, 89.99, 'EUR', '5902251028039', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A110.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2803', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 89.99, 'RRP 89,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2804', '1580 PCS HC WWII /2804/ WILLYS MB+TRAILER EX.ED.', '1580 PCS HC WWII /2804/ WILLYS MB+TRAILER EX.ED.', 100, 129.99, 'EUR', '5902251028046', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A111.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2804', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 129.99, 'RRP 129,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2805', '1207 PCS HC WWII /2805/ WILLYS MB', '1207 PCS HC WWII /2805/ WILLYS MB', 100, 99.99, 'EUR', '5902251028053', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A112.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2805', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRP 99,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2806', '1131 PCS HC WWII /2806/ WILLYS MB (MEDICAL)', '1131 PCS HC WWII /2806/ WILLYS MB (MEDICAL)', 100, 89.99, 'EUR', '5902251028060', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A113.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2806', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 89.99, 'RRP 89,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2807', '8000 PCS HC WWII /2807/ PZKPFW VI TIGER EX.ED.', '8000 PCS HC WWII /2807/ PZKPFW VI TIGER EX.ED.', 100, 599.90, 'EUR', '5902251028077', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A114.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2807', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 599.90, 'RRP 599,90 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2808', '11170 PCS HC WWII /2808/ PZKPFW VI B TIGER II', '11170 PCS HC WWII /2808/ PZKPFW VI B TIGER II', 100, 799.90, 'EUR', '5902251028084', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A115.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2808', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 799.90, 'RRP 799,90 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3110', '508 PCS HC WWII /3110/ DUKW AMPHIBIA', '508 PCS HC WWII /3110/ DUKW AMPHIBIA', 100, 49.99, 'EUR', '5902251031107', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A116.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3110', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3111', '208 PCS HC WWII /3111/ DODGE WC-56 COMMAND CAR', '208 PCS HC WWII /3111/ DODGE WC-56 COMMAND CAR', 100, 24.99, 'EUR', '5902251031114', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A117.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3111', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'VERY LIMITED QUANTITY, NEW PRODUCTION SEPTEMBER 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3113', '802 PCS HC WWII /3113/ PANZER VI AUSF.B  KONIGST', '802 PCS HC WWII /3113/ PANZER VI AUSF.B  KONIGST', 100, 69.99, 'EUR', '5902251031138', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A118.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3113', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3114', '302 PCS HC WWII /3114/ KUBUŚ', '302 PCS HC WWII /3114/ KUBUŚ', 100, 29.99, 'EUR', '5902251031145', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A119.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3114', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 29.99, 'RRP 29,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3115', '380 PCS HC WWII /3115/ TYPE 95 HA-GO', '380 PCS HC WWII /3115/ TYPE 95 HA-GO', 100, 39.99, 'EUR', '5902251031152', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A120.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3115', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3116', '230 PCS HC WWII /3116/ 37MM GMC M6 FARGO', '230 PCS HC WWII /3116/ 37MM GMC M6 FARGO', 100, 24.99, 'EUR', '5902251031169', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A121.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3116', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'NEW PRODUCTION SEPTEMBER 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3118', '865 PCS HC WWII /3118/ SHERMAN M4A2E8 (76)W', '865 PCS HC WWII /3118/ SHERMAN M4A2E8 (76)W', 100, 69.99, 'EUR', '5902251031183', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A122.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3118', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3120', '1191 PCS HC WWII /3120/ V2 ROCKET ON MEILLER EX.', '1191 PCS HC WWII /3120/ V2 ROCKET ON MEILLER EX.', 100, 79.99, 'EUR', '5902251031206', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A123.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3120', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3121', '560 PCS HC WWII /3121/ V2 ROCKET/VERGELTUNGSWAFF', '560 PCS HC WWII /3121/ V2 ROCKET/VERGELTUNGSWAFF', 100, 49.99, 'EUR', '5902251031213', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A124.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3121', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3123', '898 PCS HC WWII /3123/ PANZER VI TIGER I NO 131', '898 PCS HC WWII /3123/ PANZER VI TIGER I NO 131', 100, 69.99, 'EUR', '5902251031237', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A125.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3123', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3124', '870 PCS HC WWII /3124/ PZ.KPFW. VI TIGER AUSF.E', '870 PCS HC WWII /3124/ PZ.KPFW. VI TIGER AUSF.E', 100, 69.99, 'EUR', '5902251031244', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A126.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3124', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3125', '664 PCS HC WWII /3125/ U.S. CONTROL TOWER', '664 PCS HC WWII /3125/ U.S. CONTROL TOWER', 100, 49.99, 'EUR', '5902251031251', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A127.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3125', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3126', '663 PCS HC WWII /3126/ M4A1 SHERMAN', '663 PCS HC WWII /3126/ M4A1 SHERMAN', 100, 49.99, 'EUR', '5902251031268', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A128.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3126', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3128', '668 PCS HC WWII /3128/ MARK IV CHURCHILL', '668 PCS HC WWII /3128/ MARK IV CHURCHILL', 100, 49.99, 'EUR', '5902251031282', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A129.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3128', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3129', '511 PCS HC WWII /3129/ M 3 STUART', '511 PCS HC WWII /3129/ M 3 STUART', 100, 39.99, 'EUR', '5902251031299', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A130.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3129', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3131', 'HC WWII /3131/ SD.KFZ.139 MARDER III 486 PCS', 'HC WWII /3131/ SD.KFZ.139 MARDER III 486 PCS', 100, 39.99, 'EUR', '5902251031312', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A131.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3131', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3132', 'HC WWII /3132/ WILLYS MB & TRAILER 200 PCS', 'HC WWII /3132/ WILLYS MB & TRAILER 200 PCS', 100, 25.99, 'EUR', '5902251031329', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A132.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3132', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'LIMITED QUANTITY, NEW PRODUCTION AUGUST 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3133', 'HC WWII /3133/ WILLYS MB 132 PCS', 'HC WWII /3133/ WILLYS MB 132 PCS', 100, 19.99, 'EUR', '5902251031336', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A133.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3133', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'NEW PRODUCTION AUGUST 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3135', '265 PCS HC WWII /3135/ V-1 FLYING BOMB (FI 103)', '265 PCS HC WWII /3135/ V-1 FLYING BOMB (FI 103)', 100, 29.99, 'EUR', '5902251031350', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A134.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3135', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 29.99, 'RRP 29,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3138', '1353 PCS HC WWII /3138/ PANZER VIII MAUS', '1353 PCS HC WWII /3138/ PANZER VIII MAUS', 100, 99.99, 'EUR', '5902251031381', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A135.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3138', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRP 99,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3140', '357 PCS HC WWII /3140/ 8.8CM FLAK WITH CARRIAGE', '357 PCS HC WWII /3140/ 8.8CM FLAK WITH CARRIAGE', 100, 39.99, 'EUR', '5902251031404', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A136.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3140', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3141', '233 PCS HC WWII /3141/ 8.8CM FLAK 18 (DAK)', '233 PCS HC WWII /3141/ 8.8CM FLAK 18 (DAK)', 100, 24.99, 'EUR', '5902251031411', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A137.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3141', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3142', '339 PCS HC WWII /3142/ 10,5 CM FLAK 39', '339 PCS HC WWII /3142/ 10,5 CM FLAK 39', 100, 39.99, 'EUR', '5902251031428', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A138.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3142', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3143', 'HC WWII /3143/ SD.KFZ.8 TOWING 8,8CM FLAK36 975K', 'HC WWII /3143/ SD.KFZ.8 TOWING 8,8CM FLAK36 975K', 100, 79.99, 'EUR', '5902251031435', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A139.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3143', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-22105', '60 PCS GAME /22105/ BATTLE OF MIDWAY', '60 PCS GAME /22105/ BATTLE OF MIDWAY', 100, 9.99, 'EUR', '5902251221058', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A140.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-22105', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5721', '394 PCS HC WWII /5721/ MESSERSCHMITT ME 262A-1A', '394 PCS HC WWII /5721/ MESSERSCHMITT ME 262A-1A', 100, 44.99, 'EUR', '5902251057213', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A142.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5721', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 44.99, 'RRP 44,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5728', 'HC WWII /5728/ HAWKER HURRICANE MK.I 382 KL.', 'HC WWII /5728/ HAWKER HURRICANE MK.I 382 KL.', 100, 0.01, 'EUR', '5902251057282', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A143.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5728', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, NULL, 'TBC', 'NEW PRODUCTION 12  JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5729', 'HC WWII /5729/ MITSUBISHI A6M2 "ZERO" 349 KL', 'HC WWII /5729/ MITSUBISHI A6M2 "ZERO" 349 KL', 100, 39.99, 'EUR', '5902251057299', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A144.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5729', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5731', '375 PCS HC WWII /5731/ F4F WILDCAT', '375 PCS HC WWII /5731/ F4F WILDCAT', 100, 39.99, 'EUR', '5902251057312', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A145.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5731', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5733', '1160 PCS HC WWII /5733/ JUNKERS JU-88', '1160 PCS HC WWII /5733/ JUNKERS JU-88', 100, 84.99, 'EUR', '5902251057336', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A146.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5733', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 84.99, 'RRP 84,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5734', '335 PCS HC WWII /5734/ DEWOITINE D.520', '335 PCS HC WWII /5734/ DEWOITINE D.520', 100, 36.99, 'EUR', '5902251057343', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A147.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5734', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 36.99, 'RRP 36,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5737', '477 PCS HC WWII /5737/ P-47 THUNDERBOLT', '477 PCS HC WWII /5737/ P-47 THUNDERBOLT', 100, 44.99, 'EUR', '5902251057374', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A148.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5737', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 44.99, 'RRP 44,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5739', '1445 PCS HC WWII /5739/ CONSOLIDATED B-24D LIBER', '1445 PCS HC WWII /5739/ CONSOLIDATED B-24D LIBER', 100, 99.99, 'EUR', '5902251057398', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A149.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5739', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRP 99,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5742', '320 PCS HC WWII /5742/ PZL P-11C', '320 PCS HC WWII /5742/ PZL P-11C', 100, 36.99, 'EUR', '5902251057428', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A150.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5742', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 36.99, 'RRP 36,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5744', '625 PCS HC WWII /5744/ IL-2M3 SHTURMOVIK', '625 PCS HC WWII /5744/ IL-2M3 SHTURMOVIK', 100, 49.99, 'EUR', '5902251057442', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A151.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5744', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5745', '643 PCS HC WWII /5745/ ILYUSHIN IL-2 (1943)', '643 PCS HC WWII /5745/ ILYUSHIN IL-2 (1943)', 100, 44.99, 'EUR', '5902251057459', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A152.jpg', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5745', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 44.99, 'RRP 44,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5746', '361 PCS HC WWII /5746/ BELL P-39D AIRACOBRA', '361 PCS HC WWII /5746/ BELL P-39D AIRACOBRA', 100, 34.99, 'EUR', '5902251057466', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A153.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5746', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 34.99, 'RRP 34,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5747', '380 PCS HC WWII /5747/ BELL P-39Q AIRACOBRA', '380 PCS HC WWII /5747/ BELL P-39Q AIRACOBRA', 100, 34.99, 'EUR', '5902251057473', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A154.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5747', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 34.99, 'RRP 34,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5749', '1376 PCS HC WWII /5749/ BOEING B-17F FLYING FORT', '1376 PCS HC WWII /5749/ BOEING B-17F FLYING FORT', 100, 109.99, 'EUR', '5902251057497', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A155.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5749', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 109.99, 'RRP 109,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5750', '1210 PCS HC WWII /5750/ BOEING B-17G FLYING FORTR', '1210 PCS HC WWII /5750/ BOEING B-17G FLYING FORTR', 100, 99.99, 'EUR', '5902251057503', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A156.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5750', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRP 99,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5751', '586 PCS HC WWII /5751/ PZL.23 KARAS', '586 PCS HC WWII /5751/ PZL.23 KARAS', 100, 54.99, 'EUR', '5902251057510', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A157.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5751', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 54.99, 'RRP 54,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5752', '392 PCS HC WWII /5752/ GRUMMAN TBF AVENGER', '392 PCS HC WWII /5752/ GRUMMAN TBF AVENGER', 100, 39.99, 'EUR', '5902251057527', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A158.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5752', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5754', '1383 PCS HC WWII /5754/ DORNIER DO 17Z-2', '1383 PCS HC WWII /5754/ DORNIER DO 17Z-2', 100, 99.99, 'EUR', '5902251057541', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A159.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5754', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRP 99,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5755', '784 PCS HC WWII /5755/ WACO CG-4', '784 PCS HC WWII /5755/ WACO CG-4', 100, 59.99, 'EUR', '5902251057558', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A160.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5755', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5757', '953 PCS HC WWII /5757/ HORTEN HO 229', '953 PCS HC WWII /5757/ HORTEN HO 229', 100, 79.99, 'EUR', '5902251057572', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A161.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5757', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5758', '1795 PCS HC WWII /5758/ AVRO LANCASTER BIII EXED.', '1795 PCS HC WWII /5758/ AVRO LANCASTER BIII EXED.', 100, 129.99, 'EUR', '5902251057589', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A162.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5758', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 129.99, 'RRP 129,99 EUR', 'VERY LIMITED QUANTITY, NEW  PRODUCTION 10 SEPTEMBER 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5759', '1595 PCS HC WWII /5759/ AVRO LANCASTER B.III', '1595 PCS HC WWII /5759/ AVRO LANCASTER B.III', 100, 119.99, 'EUR', '5902251057596', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A163.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5759', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 119.99, 'RRP 119,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5760', '404 PCS HC WWII /5760/ MACCHI C.202 "FOLGORE"', '404 PCS HC WWII /5760/ MACCHI C.202 "FOLGORE"', 100, 39.99, 'EUR', '5902251057602', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A164.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5760', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5762', 'HC WWII /5762/ HAWKER HURRICANE (NO.302) 373 PCS', 'HC WWII /5762/ HAWKER HURRICANE (NO.302) 373 PCS', 100, 39.99, 'EUR', '5902251057626', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A165.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5762', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5763', 'HC WWII /5763/ LOCKHEED P-38H LIGHTNING 650 PCS', 'HC WWII /5763/ LOCKHEED P-38H LIGHTNING 650 PCS', 100, 59.99, 'EUR', '5902251057633', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A166.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5763', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5764', '364 PCS HC WWII /5764/ SUPERMARINE SPITFIRE MKIX', '364 PCS HC WWII /5764/ SUPERMARINE SPITFIRE MKIX', 100, 39.99, 'EUR', '5902251057640', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A167.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5764', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5766', '543 PCS HC WWII /5766/ MESSERSCHMITT ME 163B KOM', '543 PCS HC WWII /5766/ MESSERSCHMITT ME 163B KOM', 100, 49.99, 'EUR', '5902251057664', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A168.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5766', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5767', '565 PCS HC WWII /5767/ JUNKERS JU 87G-2 STUKA', '565 PCS HC WWII /5767/ JUNKERS JU 87G-2 STUKA', 100, 59.99, 'EUR', '5902251057671', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A169.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5767', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5768', '556 PCS HC WWII /5768/ JUNKERS JU 87G-2 STUKA', '556 PCS HC WWII /5768/ JUNKERS JU 87G-2 STUKA', 100, 59.99, 'EUR', '5902251057688', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A170.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5768', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5769', '960 PCS HC WWII /5769/ FAIREY SWORDFISH EX.ED.', '960 PCS HC WWII /5769/ FAIREY SWORDFISH EX.ED.', 100, 89.99, 'EUR', '5902251057695', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A171.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5769', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 89.99, 'RRP 89,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5770', '809 PCS HC WWII /5770/ FAIREY SWORDFISH', '809 PCS HC WWII /5770/ FAIREY SWORDFISH', 100, 79.99, 'EUR', '5902251057701', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A172.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5770', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5771', 'HC WWII /5771/ HEINKEL HE 111 H-22 EX.ED. 840 KL', 'HC WWII /5771/ HEINKEL HE 111 H-22 EX.ED. 840 KL', 100, 69.99, 'EUR', '5902251057718', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A173.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5771', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5772', 'HC WWII /5772/ HEINKEL HE 111 H-3 760 KL.', 'HC WWII /5772/ HEINKEL HE 111 H-3 760 KL.', 100, 67.99, 'EUR', '5902251057725', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A174.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5772', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 67.99, 'RRP 67,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5773', '650 PCS WWII /5773/ VOUGHT F4U-1 CORSAIR', '650 PCS WWII /5773/ VOUGHT F4U-1 CORSAIR', 100, 59.99, 'EUR', '5902251057732', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A175.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5773', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', '03 JULY  2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5774', '1050  PCS HC WWII /5774/ Boeing B-29 Superfortress      ', '1050  PCS HC WWII /5774/ Boeing B-29 Superfortress      ', 100, 89.99, 'EUR', 'TBC', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A176.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5774', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 89.99, 'RRP 89,99 EUR', '19 JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5775', 'HC WWII /5775/ FOCKE WULF FW 190 A-4 365 KL.', 'HC WWII /5775/ FOCKE WULF FW 190 A-4 365 KL.', 100, 39.99, 'EUR', '5902251057756', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A177.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5775', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'JULY 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5777', '573 PCS HC WWII /5777/ MESSERSCHMITT BF 110C', '573 PCS HC WWII /5777/ MESSERSCHMITT BF 110C', 100, 59.99, 'EUR', '5902251057770', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A178.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5777', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', '06 JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4830', '2613 PCS HC WWII /4830/ HMS HOOD', '2613 PCS HC WWII /4830/ HMS HOOD', 100, 129.99, 'EUR', '5902251048303', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A180.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4830', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 129.99, 'RRP 129,99 EUR', 'LIMITED QIANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4835', '2417 PCS HC WWII /4835/ BATTLESHIP GNEISENAU', '2417 PCS HC WWII /4835/ BATTLESHIP GNEISENAU', 100, 99.99, 'EUR', '5902251048358', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A181.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4835', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRP 99,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4839', '2880 PCS HC WWII /4839/ BATTLESHIP TIRPITZ', '2880 PCS HC WWII /4839/ BATTLESHIP TIRPITZ', 100, 199.99, 'EUR', '5902251048396', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A182.jpg', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4839', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 199.99, 'RRP 199,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4842', '2088 PCS HC WWII /4842/ PENNSYLVANIA-CLASS BATTL', '2088 PCS HC WWII /4842/ PENNSYLVANIA-CLASS BATTL', 100, 169.99, 'EUR', '5902251048426', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A183.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4842', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 169.99, 'RRP 169,99 EUR', 'LIMITED QIANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4843', '2046 PCS HC WII /4843/ USS ARIZONA (BB-39)', '2046 PCS HC WII /4843/ USS ARIZONA (BB-39)', 100, 149.99, 'EUR', '5902251048433', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A184.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4843', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 149.99, 'RRP 149,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4844', '1517 PCS HC WWII /4844/ HMS BELFAST IWM', '1517 PCS HC WWII /4844/ HMS BELFAST IWM', 100, 99.99, 'EUR', '5902251048440', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A185.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4844', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRP 99,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4851', '3573 PCS HC WWII /4851/ IJN AKAGI', '3573 PCS HC WWII /4851/ IJN AKAGI', 100, 249.90, 'EUR', '5902251048518', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A186.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4851', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 249.90, 'RRP 249,90 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4852', '474 PCS HC WWII /4852/ SUBMARINE VIIB U-BOAT U52', '474 PCS HC WWII /4852/ SUBMARINE VIIB U-BOAT U52', 100, 49.99, 'EUR', '5902251048525', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A187.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4852', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4853', '600 PCS HC WWII /4853/ BATTLESHIP TIRPITZ', '600 PCS HC WWII /4853/ BATTLESHIP TIRPITZ', 100, 49.99, 'EUR', '5902251048532', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A188.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4853', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4854', '600 PCS HC WWII /4854/ BATTLESHIP BISMARCK', '600 PCS HC WWII /4854/ BATTLESHIP BISMARCK', 100, 49.99, 'EUR', '5902251048549', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A189.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4854', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4855', '190 PCS HC WWII /4855/ POLISH SUBMARINE ORP ORZEŁ', '190 PCS HC WWII /4855/ POLISH SUBMARINE ORP ORZEŁ', 100, 19.99, 'EUR', '5902251048556', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A190.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4855', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4856', '185 PCS HC WWII /4856/ POLISH SUBMARINE ORP SĘP', '185 PCS HC WWII /4856/ POLISH SUBMARINE ORP SĘP', 100, 19.99, 'EUR', '5902251048563', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A191.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4856', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4857', '162 PCS HC WWII /4857/ U-BOOT VIIC U-96', '162 PCS HC WWII /4857/ U-BOOT VIIC U-96', 100, 19.99, 'EUR', '5902251048570', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A192.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4857', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4858', '165 PCS HC WWII /4858/ U-BOOT VIIB U-47', '165 PCS HC WWII /4858/ U-BOOT VIIB U-47', 100, 19.99, 'EUR', '5902251048587', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A193.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4858', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4860', '3080 PCS HC WWII /4860/ BATTLESHIP BISMARCK', '3080 PCS HC WWII /4860/ BATTLESHIP BISMARCK', 100, 259.90, 'EUR', '5902251048600', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A194.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4860', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 259.90, 'RRP 259,90 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4861', '137 PCS HC WWII /4861/ HNOMS UREED (P41) U-CLASS', '137 PCS HC WWII /4861/ HNOMS UREED (P41) U-CLASS', 100, 19.99, 'EUR', '5902251048617', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A195.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4861', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4862', '138 PCS HC WWII /4862/ HMS UPHOLDER (P37)', '138 PCS HC WWII /4862/ HMS UPHOLDER (P37)', 100, 19.99, 'EUR', '5902251048624', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A196.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4862', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4863', '137 PC HC WWII /4863/ POLISH SUBM. ORP SOKÓŁ', '137 PC HC WWII /4863/ POLISH SUBM. ORP SOKÓŁ', 100, 19.99, 'EUR', '5902251048631', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A197.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4863', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4864', '141 PCS HC WWII /4864/ POLISH SUBMARINE ORP DZIK', '141 PCS HC WWII /4864/ POLISH SUBMARINE ORP DZIK', 100, 19.99, 'EUR', '5902251048648', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A198.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4864', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4865', 'HC WWII /4865/ ORP BŁYSKAWICA 700 KL.', 'HC WWII /4865/ ORP BŁYSKAWICA 700 KL.', 100, 59.99, 'EUR', '5902251048655', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A199.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4865', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', '12 JUNE  2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4866', 'HC WWII /4866/ USS KIDD/FCD 700 KL.', 'HC WWII /4866/ USS KIDD/FCD 700 KL.', 100, 59.99, 'EUR', '5902251048662', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A200.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-4866', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', '12 JUNE  2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3093', '99 PCS HC WWII /3093/ SOMUA S-35', '99 PCS HC WWII /3093/ SOMUA S-35', 100, 9.99, 'EUR', '5902251030933', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A202.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3093', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3094', '119 PCS HC GREAT WAR /3094/ STURMPANZERWAGEN A7V', '119 PCS HC GREAT WAR /3094/ STURMPANZERWAGEN A7V', 100, 9.99, 'EUR', '5902251030940', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A203.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3094', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3108', '1 PC HC WWII /3108/ CDU 12 PCS TANKS SCALE 1/72', '1 PC HC WWII /3108/ CDU 12 PCS TANKS SCALE 1/72', 100, 119.88, 'EUR', '5902251031084', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A204.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3108', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 119.88, 'RRP 119,88 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3095', '144 PCS HC WWII /3095/ TIGER I 131', '144 PCS HC WWII /3095/ TIGER I 131', 100, 14.99, 'EUR', '5902251030957', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A206.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3095', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAIABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3096', '135 PCS HC WWII /3096/ ISU 152', '135 PCS HC WWII /3096/ ISU 152', 100, 14.99, 'EUR', '5902251030964', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A207.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3096', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAIABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3097', '128 PCS HC WWII /3097/ PANZER IV AUSF.J', '128 PCS HC WWII /3097/ PANZER IV AUSF.J', 100, 14.99, 'EUR', '5902251030971', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A208.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3097', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAIABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3098', '130 PCS HC WWII /3098/ IS 2', '130 PCS HC WWII /3098/ IS 2', 100, 14.99, 'EUR', '5902251030988', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A209.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3098', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAIABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3104', '127 PCS ARMED FORCES /3104/ PATTON M48', '127 PCS ARMED FORCES /3104/ PATTON M48', 100, 14.99, 'EUR', '5902251031046', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A210.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-3104', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAIABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3105', '147 PCS ARMED FORCES /3105/ LEOPARD I', '147 PCS ARMED FORCES /3105/ LEOPARD I', 100, 14.99, 'EUR', '5902251031053', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A211.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3105', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAIABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3106', '174 PCS ARMED FORCES /3106/ ABRAMS M1A2', '174 PCS ARMED FORCES /3106/ ABRAMS M1A2', 100, 14.99, 'EUR', '5902251031060', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A212.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3106', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAIABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3107', '160 PCS ARMED FORCES /3107/ K2 BLACK PANTHER', '160 PCS ARMED FORCES /3107/ K2 BLACK PANTHER', 100, 14.99, 'EUR', '5902251031077', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A213.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3107', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAIABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-3109', '1 PC HC WWII /3109/ CDU 12 PCS TANKS SCALE 1/72', '1 PC HC WWII /3109/ CDU 12 PCS TANKS SCALE 1/72', 100, 179.88, 'EUR', '5902251031091', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A214.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-3109', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 179.88, 'RRP 179,88 EUR', 'AVAIABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5862', '140 PCS HC WWII /5862/ YAKOVLEV YAK-3', '140 PCS HC WWII /5862/ YAKOVLEV YAK-3', 100, 24.99, 'EUR', '5902251058623', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A216.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5862', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5863', '142 PCS HC WWII /5863/ YAKOVLEV YAK-1B', '142 PCS HC WWII /5863/ YAKOVLEV YAK-1B', 100, 24.99, 'EUR', '5902251058630', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A217.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5863', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5864', '190 PCS HC WWII /5864/ HAWKER TYPHOON MK.IB', '190 PCS HC WWII /5864/ HAWKER TYPHOON MK.IB', 100, 24.99, 'EUR', '5902251058647', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A218.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5864', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5865', '152 PCS HC WWII /5865/ SPITFIRE MK.XVI BUBBLETOP', '152 PCS HC WWII /5865/ SPITFIRE MK.XVI BUBBLETOP', 100, 24.99, 'EUR', '5902251058654', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A219.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5865', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5866', '138 PCS HC WWII /5866/ HAWKER HURRICANE MK.1', '138 PCS HC WWII /5866/ HAWKER HURRICANE MK.1', 100, 24.99, 'EUR', '5902251058661', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A220.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5866', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5867', '192 PCS HC WWII /5867/ FIAT G.55 CENTAURO', '192 PCS HC WWII /5867/ FIAT G.55 CENTAURO', 100, 24.99, 'EUR', '5902251058678', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A221.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5867', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5868', 'HC WWII /5868/ SPITFIRE MK.I N3200 146 PCS', 'HC WWII /5868/ SPITFIRE MK.I N3200 146 PCS', 100, 24.99, 'EUR', '5902251058685', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A222.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5868', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'VERY LIMITED QUANTITY, NEW PRODUCTION 07 AUGUST 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5869', 'HC WWII /5869/ MUSTANG P-51B 158 PCS', 'HC WWII /5869/ MUSTANG P-51B 158 PCS', 100, 24.99, 'EUR', '5902251058692', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A223.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5869', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5871', '170 PCS HC WWII /5871/ FOCKE-WULF FW 190 F-8', '170 PCS HC WWII /5871/ FOCKE-WULF FW 190 F-8', 100, 24.99, 'EUR', '5902251058715', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A224.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5871', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5872', '141 PCS HC WWII /5872/ KAWASAKI KI-61 HIEN', '141 PCS HC WWII /5872/ KAWASAKI KI-61 HIEN', 100, 24.99, 'EUR', '5902251058722', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A225.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5872', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5873', '123 PCS HC WWII /5873/ MESSERSCHMITT BF-109F', '123 PCS HC WWII /5873/ MESSERSCHMITT BF-109F', 100, 24.99, 'EUR', '5902251058739', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A226.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5873', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5882', '335 PCS HC WWII /5882/ LOCKHEED P-38 LIGHTNING', '335 PCS HC WWII /5882/ LOCKHEED P-38 LIGHTNING', 100, 39.99, 'EUR', '5902251058821', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A227.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5882', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5883', '235 PCS HC WWII /5883/ GRUMMAN F6F HELLCAT', '235 PCS HC WWII /5883/ GRUMMAN F6F HELLCAT', 100, 29.99, 'EUR', '5902251058838', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A228.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5883', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 29.99, 'RRP 29,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5822', '504 PCS HC COLD WAR /5822/ LIM-1 POLISH AIR FORC', '504 PCS HC COLD WAR /5822/ LIM-1 POLISH AIR FORC', 100, 25.99, 'EUR', '5902251058227', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A230.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5822', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5823', '568 PCS HC COLD WAR /5823/ MIG-17 NATO CODE FRES', '568 PCS HC COLD WAR /5823/ MIG-17 NATO CODE FRES', 100, 25.99, 'EUR', '5902251058234', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A231.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5823', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5824', '575 PCS HC COLD WAR /5824/ LIM-5 POLISH AIR FORC', '575 PCS HC COLD WAR /5824/ LIM-5 POLISH AIR FORC', 100, 25.99, 'EUR', '5902251058241', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A232.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5824', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5825', '575 PCS HC COLD WAR /5825/ LIM-5 (MIG-17F) EAST', '575 PCS HC COLD WAR /5825/ LIM-5 (MIG-17F) EAST', 100, 25.99, 'EUR', '5902251058258', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A233.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-5825', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2416', '504 PCS HC KOREAN WAR /2416/ MIG-15 N.CODE FAGOT', '504 PCS HC KOREAN WAR /2416/ MIG-15 N.CODE FAGOT', 100, 25.99, 'EUR', '5902251024161', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A235.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2416', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'LIMITED QIANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2417', '520 PCS HC KOREAN WAR /2417/ VOUGHT F4U-4 CORSAI', '520 PCS HC KOREAN WAR /2417/ VOUGHT F4U-4 CORSAI', 100, 49.99, 'EUR', '5902251024178', 'COBI HISTORICAL COLLECTION',
    'NEW', '/extracted_images/img_A236.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'HISTORICAL COLLECTION', 'COBI-2417', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2238', '615 PCS HC VIETNAM WAR /2238/ PATROL BOAT RIVER', '615 PCS HC VIETNAM WAR /2238/ PATROL BOAT RIVER', 100, 25.99, 'EUR', '5902251022389', 'COBI VIETNAM WAR',
    'NEW', '/extracted_images/img_A238.jpg', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VIETNAM WAR', 'COBI-2238', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2425', '352 PCS HC VIETNAM WAR /2425/ NORTHROP F-5A F.F.', '352 PCS HC VIETNAM WAR /2425/ NORTHROP F-5A F.F.', 100, 39.99, 'EUR', '5902251024253', 'COBI VIETNAM WAR',
    'NEW', '/extracted_images/img_A239.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VIETNAM WAR', 'COBI-2425', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2426', 'HC VIETNAM WAR /2426/ LOCKHEED F-104 STARF. 438 PCS', 'HC VIETNAM WAR /2426/ LOCKHEED F-104 STARF. 438 PCS', 100, 49.99, 'EUR', '5902251024260', 'COBI VIETNAM WAR',
    'NEW', '/extracted_images/img_A240.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VIETNAM WAR', 'COBI-2426', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2427', '738 PCS HC VIETNAM WAR/2427/                         F-4F PHANTOM II   ', '738 PCS HC VIETNAM WAR/2427/                         F-4F PHANTOM II   ', 100, 59.99, 'EUR', '5902251024277', 'COBI VIETNAM WAR',
    'NEW', '/extracted_images/img_A241.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VIETNAM WAR', 'COBI-2427', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2624', 'ARMED FORCES /2624/ T-72 M1R (PL/UA) 724 KL.', 'ARMED FORCES /2624/ T-72 M1R (PL/UA) 724 KL.', 100, 49.99, 'EUR', '5902251026240', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A243.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-2624', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2625', '680 PCS ARMED FORCES /2625/ T-72 (EAST GERM/SOV)', '680 PCS ARMED FORCES /2625/ T-72 (EAST GERM/SOV)', 100, 49.99, 'EUR', '5902251026257', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A244.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-2625', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2626', '604 PCS ARMED FORCES /2626/ M142 HIMARS', '604 PCS ARMED FORCES /2626/ M142 HIMARS', 100, 49.99, 'EUR', '5902251026264', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A245.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-2626', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2627', '954 PCS ARMED FORCES /2627/ CHALLENGER 2', '954 PCS ARMED FORCES /2627/ CHALLENGER 2', 100, 59.99, 'EUR', '5902251026271', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A246.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-2627', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2628', '1006 PCS ARMED FORCES /2628/ PANZERHAUBITZE 2000', '1006 PCS ARMED FORCES /2628/ PANZERHAUBITZE 2000', 100, 59.99, 'EUR', '5902251026288', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A247.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-2628', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2629', '666 PCS ARMED FORCES /2629/ KTO ROSOMAK (PL/UA)', '666 PCS ARMED FORCES /2629/ KTO ROSOMAK (PL/UA)', 100, 49.99, 'EUR', '5902251026295', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A248.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-2629', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2630', '756 PCS ARMED FORCES /2630/ BWP-1 (PL/UA)', '756 PCS ARMED FORCES /2630/ BWP-1 (PL/UA)', 100, 49.99, 'EUR', '5902251026301', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A249.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-2630', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2631', '758 PCS ARMED FORCES /2631/ BWP-1 (DDR/RUS) 2IN1', '758 PCS ARMED FORCES /2631/ BWP-1 (DDR/RUS) 2IN1', 100, 49.99, 'EUR', '5902251026318', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A250.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-2631', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2632', '1000 PCS ARMED FORCES /2632/ M1A2 ABRAMS 1:35 US', '1000 PCS ARMED FORCES /2632/ M1A2 ABRAMS 1:35 US', 100, 59.99, 'EUR', '5902251026325', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A251.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-2632', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2633', '1000 PCS ARMED FORCES /2633/ M1A2 ABRAMS 1:35 PL', '1000 PCS ARMED FORCES /2633/ M1A2 ABRAMS 1:35 PL', 100, 59.99, 'EUR', '5902251026332', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A252.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-2633', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-2635', '667 PCS ARMED FORCES /2635/ STRYKER M1126', '667 PCS ARMED FORCES /2635/ STRYKER M1126', 100, 49.99, 'EUR', '5902251026356', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A253.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-2635', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', '31 JULY 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-4859', '643 PCS HC WWII /4859/ SOUS-MARIN SNLE', '643 PCS HC WWII /4859/ SOUS-MARIN SNLE', 100, 69.99, 'EUR', '5902251048594', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A254.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-4859', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5841A', '387 PCS ARMED FORCES /5841A/ ALPHA JET PATROUILLE', '387 PCS ARMED FORCES /5841A/ ALPHA JET PATROUILLE', 100, 39.99, 'EUR', '5902251058418', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A255.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5841A', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'NEW PRODUCTION JULY 2026 '
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5842', '364 PCS ARMED FORCES /5842/ ALPHA JET', '364 PCS ARMED FORCES /5842/ ALPHA JET', 100, 34.99, 'EUR', '5902251058425', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A256.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5842', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 34.99, 'RRP 34,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5843', '577 PCS ARMED FORCES /5843/ EUROFIGHTER TYPHOON', '577 PCS ARMED FORCES /5843/ EUROFIGHTER TYPHOON', 100, 49.99, 'EUR', '5902251058432', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A257.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5843', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5845', '362 PCS ARMED FORCES /5845/ BAE HAWK T1', '362 PCS ARMED FORCES /5845/ BAE HAWK T1', 100, 34.99, 'EUR', '5902251058456', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A258.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5845', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 34.99, 'RRP 34,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5848A', '644 PCS ARMED FORCES /5848A/ EUROFIGHTER', '644 PCS ARMED FORCES /5848A/ EUROFIGHTER', 100, 59.99, 'EUR', '5902251058487', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A259.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5848A', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5852', '520 PCS ARMED FORCES /5852/ PANAVIA TORNADO GR.1', '520 PCS ARMED FORCES /5852/ PANAVIA TORNADO GR.1', 100, 49.99, 'EUR', '5902251058524', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A260.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5852', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5853', '493 PCS ARMED FORCES /5853/ PANAVIA TORNADO IDS', '493 PCS ARMED FORCES /5853/ PANAVIA TORNADO IDS', 100, 49.99, 'EUR', '5902251058531', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A261.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5853', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5854', '527 PCS ARMED FORCES /5854/ TORNADO GR.MK 1 MIG', '527 PCS ARMED FORCES /5854/ TORNADO GR.MK 1 MIG', 100, 49.99, 'EUR', '5902251058548', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A262.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5854', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5855', '695 PCS ARMED FORCES /5855/ LOCKHEED F-22 RAPTOR', '695 PCS ARMED FORCES /5855/ LOCKHEED F-22 RAPTOR', 100, 64.99, 'EUR', '5902251058555', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A263.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5855', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 64.99, 'RRP 64,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5856', '667 PCS ARMED FORCES /5856/ A10 THUNDERBOLT II W', '667 PCS ARMED FORCES /5856/ A10 THUNDERBOLT II W', 100, 59.99, 'EUR', '5902251058562', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A264.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5856', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5857', '351 PCS ARMED FORCES /5857/ NORTHROP F-5E TIGER', '351 PCS ARMED FORCES /5857/ NORTHROP F-5E TIGER', 100, 39.99, 'EUR', '5902251058579', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A265.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5857', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5858', '358 PCS ARMED FORCES /5858/ NORTHROP F-5E FREEDO', '358 PCS ARMED FORCES /5858/ NORTHROP F-5E FREEDO', 100, 39.99, 'EUR', '5902251058586', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A266.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5858', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5890', '1424 PCS ARMED FORCES /5890/ LOCKHEED SR-71 EX.E', '1424 PCS ARMED FORCES /5890/ LOCKHEED SR-71 EX.E', 100, 114.99, 'EUR', '5902251058906', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A267.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5890', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 114.99, 'RRP 114,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5891', '1374 PCS ARMED FORCES /5891/ LOCKHEED SR-71', '1374 PCS ARMED FORCES /5891/ LOCKHEED SR-71', 100, 99.99, 'EUR', '5902251058913', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A268.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5891', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRP 99,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5892', '375 PCS ARMED FORCES /5892/ F-16 FST FLIGHT ED.', '375 PCS ARMED FORCES /5892/ F-16 FST FLIGHT ED.', 100, 46.99, 'EUR', '5902251058920', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A269.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5892', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 46.99, 'RRP 46,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5893', '500 PCS ARMED FORCES /5893/ F-16C FIGHT.FALC UA', '500 PCS ARMED FORCES /5893/ F-16C FIGHT.FALC UA', 100, 49.99, 'EUR', '5902251058937', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A270.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5893', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5894', '483 PCS ARMED FORCES /5894/ PANAVIA TORNADO IDS', '483 PCS ARMED FORCES /5894/ PANAVIA TORNADO IDS', 100, 49.99, 'EUR', '5902251058944', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A271.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5894', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5895', '610 PCS ARMED FORCES /5895/ F-35B STOVL LIGHT.II', '610 PCS ARMED FORCES /5895/ F-35B STOVL LIGHT.II', 100, 59.99, 'EUR', '5902251058951', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A272.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5895', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5897', 'ARMED FORCES /5897/ F-4 PHANTOM II 703 PCS', 'ARMED FORCES /5897/ F-4 PHANTOM II 703 PCS', 100, 59.99, 'EUR', '5902251058975', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A273.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5897', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5898', 'ARMED FORCES /5898/ F-4F PHANTOM II (LUFT.) 666K', 'ARMED FORCES /5898/ F-4F PHANTOM II (LUFT.) 666K', 100, 59.99, 'EUR', '5902251058982', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A274.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5898', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5899', 'ARMED FORCES /5899/ F-4S PHANTOM II 608 PCS', 'ARMED FORCES /5899/ F-4S PHANTOM II 608 PCS', 100, 59.99, 'EUR', '5902251058999', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A275.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5899', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5900', '743 PCS ARMED FORCES /5900/ BOEING F-15X EAGLEII', '743 PCS ARMED FORCES /5900/ BOEING F-15X EAGLEII', 100, 65.99, 'EUR', '5902251059002', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A276.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5900', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 65.99, 'RRP 65,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5901', 'ARMED FORCES /5901/ DESSAULT RAFALE C 551 PCS', 'ARMED FORCES /5901/ DESSAULT RAFALE C 551 PCS', 100, 49.99, 'EUR', '5902251059019', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A277.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5901', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5903', '795 PCS ARMED FORCES /5903/ LOCKHEED F-117 NIGHT', '795 PCS ARMED FORCES /5903/ LOCKHEED F-117 NIGHT', 100, 69.99, 'EUR', '5902251059033', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A278.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5903', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5904', '605 PCS ARMED FORCES /5904/ F-35A LIGHTNING II', '605 PCS ARMED FORCES /5904/ F-35A LIGHTNING II', 100, 59.99, 'EUR', '5902251059040', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A279.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5904', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5905', 'ARMED FORCES /5905/ AT-6 WOLVERINE BEECHCRAFT262', 'ARMED FORCES /5905/ AT-6 WOLVERINE BEECHCRAFT262', 100, 34.99, 'EUR', '5902251059057', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A280.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5905', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 34.99, 'RRP 34,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5906', 'ARMED FORCES /5906/ SIKORSKY UH-60 BLACK HAWK928', 'ARMED FORCES /5906/ SIKORSKY UH-60 BLACK HAWK928', 100, 79.99, 'EUR', '5902251059064', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A281.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5906', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'LIMITED QUANTITY, NEW PRODUCTION OCTOBER 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5907', 'ARMED FORCES /5907/ LOCKHEED F-104 STARFIGHT.428 PCS', 'ARMED FORCES /5907/ LOCKHEED F-104 STARFIGHT.428 PCS', 100, 49.99, 'EUR', '5902251059071', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A282.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5907', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5908', '728 PCS ARMED FORCES /5908/ F-4F PHANTOM II RAF', '728 PCS ARMED FORCES /5908/ F-4F PHANTOM II RAF', 100, 59.99, 'EUR', '5902251059088', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A283.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5908', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5909', '928 PCS ARMED FORCES /5909/ SUKHOI SU-57/FELON/', '928 PCS ARMED FORCES /5909/ SUKHOI SU-57/FELON/', 100, 79.99, 'EUR', '5902251059095', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A284.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5909', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5910', '463 PCS ARMED FORCES /5910/ F-16C FIGHTING FALCO', '463 PCS ARMED FORCES /5910/ F-16C FIGHTING FALCO', 100, 49.99, 'EUR', '5902251059101', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A285.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5910', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'LIMITED QUANTITY, NEW PRODUCTION 10 SEPTEMBER 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5911', '911 PCS ARMED FORCES /5911/ SAAB AJS37 VIGGEN', '911 PCS ARMED FORCES /5911/ SAAB AJS37 VIGGEN', 100, 69.99, 'EUR', '5902251059118', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A286.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5911', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5912', '614 PCS ARMED FORCES /5912/ F-35B LIGHTNING II', '614 PCS ARMED FORCES /5912/ F-35B LIGHTNING II', 100, 59.99, 'EUR', '5902251059125', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A287.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5912', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5913', '495 PCS ARMED FORCES /5913/ F-16AM FIGHTING FALCON', '495 PCS ARMED FORCES /5913/ F-16AM FIGHTING FALCON', 100, 49.99, 'EUR', '5902251059132', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A288.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5913', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5914', '436 PCS ARMED FORCES /5914/ F-16D FIGHTING FALCON', '436 PCS ARMED FORCES /5914/ F-16D FIGHTING FALCON', 100, 49.99, 'EUR', '5902251059149', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A289.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5914', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5915', '881 PCS ARMED FORCES /5915/ SAAB AJ37 VIGGEN', '881 PCS ARMED FORCES /5915/ SAAB AJ37 VIGGEN', 100, 69.99, 'EUR', '5902251059156', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A290.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5915', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5916', '1115 PCS ARMED FORCES /5916/ NORTHROP GRUMMAN B2', '1115 PCS ARMED FORCES /5916/ NORTHROP GRUMMAN B2', 100, 89.99, 'EUR', '5902251059163', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A291.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5916', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 89.99, 'RRP 89,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5917', '495 PCS ARMED FORCES /5917/ MIRAGE 2000-5F', '495 PCS ARMED FORCES /5917/ MIRAGE 2000-5F', 100, 49.99, 'EUR', '5902251059170', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A292.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5917', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5918', '381 PCS ARMED FORCES /5918/ MIG-21 MF', '381 PCS ARMED FORCES /5918/ MIG-21 MF', 100, 49.99, 'EUR', '5902251059187', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A293.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5918', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5919', '397 PCS ARMED FORCES /5919/ MIG 21', '397 PCS ARMED FORCES /5919/ MIG 21', 100, 49.99, 'EUR', '5902251059194', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A294.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5919', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5930', '375 PCS ARMED FORCES /5930/ MIRAGE III C', '375 PCS ARMED FORCES /5930/ MIRAGE III C', 100, 49.99, 'EUR', '5902251059309', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A295.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5930', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5931', '441 PCS ARMED FORCES /5931/ DESSAULT RAFALE', '441 PCS ARMED FORCES /5931/ DESSAULT RAFALE', 100, 49.99, 'EUR', '5902251059316', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A296.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5931', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', '19 JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5926', 'ARMED FORCES /5926/ LOCKHEED MARTIN F-35A 47 KL.', 'ARMED FORCES /5926/ LOCKHEED MARTIN F-35A 47 KL.', 100, 7.99, 'EUR', '5902251059262', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A298.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5926', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 7.99, 'RRP 7,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5927', 'ARMED FORCES /5927/ LOCKHEED MARTIN F-35B 47 KL.', 'ARMED FORCES /5927/ LOCKHEED MARTIN F-35B 47 KL.', 100, 7.99, 'EUR', '5902251059279', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A299.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5927', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 7.99, 'RRP 7,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5928', 'ARMED FORCES /5928/ MIG-29 40 KL.', 'ARMED FORCES /5928/ MIG-29 40 KL.', 100, 7.99, 'EUR', '5902251059286', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A300.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5928', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 7.99, 'RRP 7,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5929', 'ARMED FORCES /5929/ F-16C FIGHTING FALCON 55 KL.', 'ARMED FORCES /5929/ F-16C FIGHTING FALCON 55 KL.', 100, 7.99, 'EUR', '5902251059293', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A301.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5929', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 7.99, 'RRP 7,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5940', 'ARMED FORCES /5940/ LOCKHEED MARTIN F-35A 47 KL.', 'ARMED FORCES /5940/ LOCKHEED MARTIN F-35A 47 KL.', 100, 7.99, 'EUR', '5902251059408', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A302.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5940', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 7.99, 'RRP 7,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5941', 'ARMED FORCES /5941/ F-16C FIGHTING FALCON 55 KL.', 'ARMED FORCES /5941/ F-16C FIGHTING FALCON 55 KL.', 100, 7.99, 'EUR', '5902251059415', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A303.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5941', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 7.99, 'RRP 7,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-5942', 'ARMED FORCES /5942/ CDU AIRCRAFTS ( 3X5926, 4X5927, 3X5928, 3X5929, 3X5940, 4X5941)', 'ARMED FORCES /5942/ CDU AIRCRAFTS ( 3X5926, 4X5927, 3X5928, 3X5929, 3X5940, 4X5941)', 100, 159.80, 'EUR', '5902251059422', 'COBI ARMED FORCES',
    'NEW', '/extracted_images/img_A304.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ARMED FORCES', 'COBI-5942', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 159.80, 'RRP 159,80 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20067', '3 PCS IMPERIUM ROMANUM /20067/ ROMANS FIG', '3 PCS IMPERIUM ROMANUM /20067/ ROMANS FIG', 100, 9.99, 'EUR', '5902251200671', 'COBI IMPERIUM ROMANUM',
    'NEW', '/extracted_images/img_A306.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20067', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20068', '173 PCS IMPERIUM ROMANUM /20068/ ROMAN ONAGER', '173 PCS IMPERIUM ROMANUM /20068/ ROMAN ONAGER', 100, 19.99, 'EUR', '5902251200688', 'COBI IMPERIUM ROMANUM',
    'NEW', '/extracted_images/img_A307.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20068', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20069', '93 PCS IMPERIUM ROMANUM /20069/ ROMAN CHARIOT', '93 PCS IMPERIUM ROMANUM /20069/ ROMAN CHARIOT', 100, 19.99, 'EUR', '5902251200695', 'COBI IMPERIUM ROMANUM',
    'NEW', '/extracted_images/img_A308.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20069', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20070', '583 PCS IMPERIUM ROMANUM /20070/ GLADIATOR SCHOO', '583 PCS IMPERIUM ROMANUM /20070/ GLADIATOR SCHOO', 100, 49.99, 'EUR', '5902251200701', 'COBI IMPERIUM ROMANUM',
    'NEW', '/extracted_images/img_A309.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20070', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20071', '1810 PCS IMPERIUM ROMANUM /20071/ ROMAN WARSHIP', '1810 PCS IMPERIUM ROMANUM /20071/ ROMAN WARSHIP', 100, 99.99, 'EUR', '5902251200718', 'COBI IMPERIUM ROMANUM',
    'NEW', '/extracted_images/img_A310.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20071', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 99.99, 'RRP 99,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20072', 'IMPERIUM ROMANUM /20072/ PRAETORIAN GUARD 47 PCS', 'IMPERIUM ROMANUM /20072/ PRAETORIAN GUARD 47 PCS', 100, 15.99, 'EUR', '5902251200725', 'COBI IMPERIUM ROMANUM',
    'NEW', '/extracted_images/img_A311.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20072', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 15.99, 'RRP 15,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20073', '45 PCS IMPERIUM ROMANUM /20073/ ROMANS AUXILIA', '45 PCS IMPERIUM ROMANUM /20073/ ROMANS AUXILIA', 100, 15.99, 'EUR', '5902251200732', 'COBI IMPERIUM ROMANUM',
    'NEW', NULL, NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20073', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 15.99, 'RRP 15,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20074', '38 PCS IMPERIUM ROMANUM /20074/ CELTIC WARRIORS', '38 PCS IMPERIUM ROMANUM /20074/ CELTIC WARRIORS', 100, 9.99, 'EUR', '5902251200749', 'COBI IMPERIUM ROMANUM',
    'NEW', '/extracted_images/img_A313.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20074', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20075', '45 PCS IMPERIUM ROMANUM /20075/ GERMANIC WARRIORS', '45 PCS IMPERIUM ROMANUM /20075/ GERMANIC WARRIORS', 100, 15.99, 'EUR', '5902251200756', 'COBI IMPERIUM ROMANUM',
    'NEW', '/extracted_images/img_A314.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20075', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 15.99, 'RRP 15,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20076', '628 PSC IMPERIUM ROMANUM /20076/ R.C. WATCHTOWER', '628 PSC IMPERIUM ROMANUM /20076/ R.C. WATCHTOWER', 100, 49.99, 'EUR', '5902251200763', 'COBI IMPERIUM ROMANUM',
    'NEW', '/extracted_images/img_A315.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20076', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20077', '591 PCS IMPERIUM ROMANUM /20077/ ROMAN CAMP-GATE', '591 PCS IMPERIUM ROMANUM /20077/ ROMAN CAMP-GATE', 100, 49.99, 'EUR', '5902251200770', 'COBI IMPERIUM ROMANUM',
    'NEW', '/extracted_images/img_A316.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20077', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20078', 'IMPERIUM ROMANUM /20078/ ROMAN CAMP-TENT 198 PCS.', 'IMPERIUM ROMANUM /20078/ ROMAN CAMP-TENT 198 PCS.', 100, 25.99, 'EUR', '5902251200787', 'COBI IMPERIUM ROMANUM',
    'NEW', '/extracted_images/img_A317.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20078', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20079', '113 PCS IMPERIUM ROMANUM /20079/ ROMAN SCORPIO', '113 PCS IMPERIUM ROMANUM /20079/ ROMAN SCORPIO', 100, 19.99, 'EUR', '5902251200794', 'COBI IMPERIUM ROMANUM',
    'NEW', '/extracted_images/img_A318.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'IMPERIUM ROMANUM', 'COBI-20079', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24335', '2269 PCS CARS /24335/ MASERATI MC20', '2269 PCS CARS /24335/ MASERATI MC20', 100, 59.99, 'EUR', '5902251243357', 'COBI CARS',
    'NEW', '/extracted_images/img_A320.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24335', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24337', '1900 PCS CARS /24337/ CITROEN TRACTION AVANT 11C', '1900 PCS CARS /24337/ CITROEN TRACTION AVANT 11C', 100, 79.99, 'EUR', '5902251243371', 'COBI CARS',
    'NEW', '/extracted_images/img_A321.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24337', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24339', '1905 PCS CARS /24339/ 1970 OPEL MANTA A', '1905 PCS CARS /24339/ 1970 OPEL MANTA A', 100, 79.99, 'EUR', '5902251243395', 'COBI CARS',
    'NEW', '/extracted_images/img_A322.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24339', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24340', '1669 PCS CARS /24340/ CITROEN 2CV CHARLESTON E.E', '1669 PCS CARS /24340/ CITROEN 2CV CHARLESTON E.E', 100, 79.99, 'EUR', '5902251243401', 'COBI CARS',
    'NEW', '/extracted_images/img_A323.jpg', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24340', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24341', '1465 PCS CARS /24341/ CITROEN 2CV CHARLESTON', '1465 PCS CARS /24341/ CITROEN 2CV CHARLESTON', 100, 69.99, 'EUR', '5902251243418', 'COBI CARS',
    'NEW', '/extracted_images/img_A324.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24341', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24343', '2405 PCS CARS /24343/ SKODA OCTAVIA IV RS', '2405 PCS CARS /24343/ SKODA OCTAVIA IV RS', 100, 59.99, 'EUR', '5902251243432', 'COBI CARS',
    'NEW', '/extracted_images/img_A325.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24343', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 59.99, 'RRP 59,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24345', '2195 PCS CARS /24345/ OPEL REKORD C COUPE', '2195 PCS CARS /24345/ OPEL REKORD C COUPE', 100, 79.99, 'EUR', '5902251243456', 'COBI CARS',
    'NEW', '/extracted_images/img_A326.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24345', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24346', '2275 PCS CARS /24346/ 1962 CITROEN DS 19 DECAPOT', '2275 PCS CARS /24346/ 1962 CITROEN DS 19 DECAPOT', 100, 89.99, 'EUR', '5902251243463', 'COBI CARS',
    'NEW', '/extracted_images/img_A327.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24346', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 89.99, 'RRP 89,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24347', '2230 PCS CARS /24347/ 1956 CITROEN DS 19', '2230 PCS CARS /24347/ 1956 CITROEN DS 19', 100, 79.99, 'EUR', '5902251243470', 'COBI CARS',
    'NEW', '/extracted_images/img_A328.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24347', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24349', '1938 PCS CARS /24349/ 1974 OPEL MANTA A GT/E', '1938 PCS CARS /24349/ 1974 OPEL MANTA A GT/E', 100, 79.99, 'EUR', '5902251243494', 'COBI CARS',
    'NEW', '/extracted_images/img_A329.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24349', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 79.99, 'RRP 79,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24350', '2467 PCS CARS /24350/ 1956 CITROEN DS 19 EX.ED.', '2467 PCS CARS /24350/ 1956 CITROEN DS 19 EX.ED.', 100, 89.99, 'EUR', '5902251243500', 'COBI CARS',
    'NEW', '/extracted_images/img_A330.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24350', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 89.99, 'RRP 89,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24351', '2312 PCS CARS /24351/ MASERATI MC20 CIELO EX.ED.', '2312 PCS CARS /24351/ MASERATI MC20 CIELO EX.ED.', 100, 129.99, 'EUR', '5902251243517', 'COBI CARS',
    'NEW', '/extracted_images/img_A331.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24351', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 129.99, 'RRP 129,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24352', '2115 PCS CARS /24352/ MASERATI MC 20 CIELO', '2115 PCS CARS /24352/ MASERATI MC 20 CIELO', 100, 116.99, 'EUR', '5902251243524', 'COBI CARS',
    'NEW', '/extracted_images/img_A332.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24352', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 116.99, 'RRP 116,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24353', '1223 PCS CARS /24353/ FIAT ABARTH 595 EX. EDIT.', '1223 PCS CARS /24353/ FIAT ABARTH 595 EX. EDIT.', 100, 89.99, 'EUR', '5902251243531', 'COBI CARS',
    'NEW', '/extracted_images/img_A333.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24353', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 89.99, 'RRP 89,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24354', '1091 PCS CARS /24354/ FIAT 500 ABARTH', '1091 PCS CARS /24354/ FIAT 500 ABARTH', 100, 69.99, 'EUR', '5902251243548', 'COBI CARS',
    'NEW', '/extracted_images/img_A334.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24354', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 69.99, 'RRP 69,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24356', '2294 PCS CARS /24356/ 1991 LANCIA DELTA HF INTG.', '2294 PCS CARS /24356/ 1991 LANCIA DELTA HF INTG.', 100, 139.99, 'EUR', '5902251243562', 'COBI CARS',
    'NEW', '/extracted_images/img_A335.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24356', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 139.99, 'RRP 139,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24357', '2068 PCS CARS /24357/ LANCIA DELTA HF INTEGRALE', '2068 PCS CARS /24357/ LANCIA DELTA HF INTEGRALE', 100, 129.99, 'EUR', '5902251243579', 'COBI CARS',
    'NEW', '/extracted_images/img_A336.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24357', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 129.99, 'RRP 129,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24358', 'VOLKSWAGEN /24358/ GOLF GTI (1976-83) 1743 EXECUTIVE EDITION', 'VOLKSWAGEN /24358/ GOLF GTI (1976-83) 1743 EXECUTIVE EDITION', 100, 129.99, 'EUR', '5902251243586', 'COBI CARS',
    'NEW', '/extracted_images/img_A337.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24358', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 129.99, 'RRP 129,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24359', 'VOLKSWAGEN /24359/ GOLF (1974-83) 1510 PCS', 'VOLKSWAGEN /24359/ GOLF (1974-83) 1510 PCS', 100, 119.99, 'EUR', '5902251243593', 'COBI CARS',
    'NEW', '/extracted_images/img_A338.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24359', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 119.99, 'RRP 119,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24361', '2775 PCS VOLKSWAGEN /24361/ TRANSPORTER T2A EXECUTIVE EDITION', '2775 PCS VOLKSWAGEN /24361/ TRANSPORTER T2A EXECUTIVE EDITION', 100, 179.99, 'EUR', '5902251243616', 'COBI CARS',
    'NEW', '/extracted_images/img_A339.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24361', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 179.99, 'RRP 179,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24362', 'VOLKSWAGEN /24362/ TRANSPORTER T2A BUS 2300 PCS', 'VOLKSWAGEN /24362/ TRANSPORTER T2A BUS 2300 PCS', 100, 159.99, 'EUR', '5902251243623', 'COBI CARS',
    'NEW', '/extracted_images/img_A340.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CARS', 'COBI-24362', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 159.99, 'RRP 159,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24508', '61 PCS YOUNGTIMER /24508/ LANCIA DELTA HF', '61 PCS YOUNGTIMER /24508/ LANCIA DELTA HF', 100, 16.99, 'EUR', '5902251245085', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A342.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24508', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24509', '63 PCS YOUNGTIMER /24509A/ LANCIA DELTA HF INTG.', '63 PCS YOUNGTIMER /24509A/ LANCIA DELTA HF INTG.', 100, 16.99, 'EUR', '5902251245092', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A343.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24509', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24510', '80 PCS YOUNGTIMER /24510/ CITROEN 2CV TYPE A', '80 PCS YOUNGTIMER /24510/ CITROEN 2CV TYPE A', 100, 14.99, 'EUR', '5902251245108', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A344.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24510', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24511', '82 PCS YOUNGTIMER /24511/ CITROEN 2CV TYPE AZ', '82 PCS YOUNGTIMER /24511/ CITROEN 2CV TYPE AZ', 100, 14.99, 'EUR', '5902251245115', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A345.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24511', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24512', '85 PCS YOUNGTIMER /24512/ CITROEN 2CV CHARLESTON', '85 PCS YOUNGTIMER /24512/ CITROEN 2CV CHARLESTON', 100, 14.99, 'EUR', '5902251245122', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A346.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24512', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24514', '70 PCS YOUNGTIMER /24514/ FIAT ABARTH', '70 PCS YOUNGTIMER /24514/ FIAT ABARTH', 100, 14.99, 'EUR', '5902251245146', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A347.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24514', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24515', '61 PCS YOUNGTIMER /24515A/ LANCIA DELTA HF INTG.', '61 PCS YOUNGTIMER /24515A/ LANCIA DELTA HF INTG.', 100, 16.99, 'EUR', '5902251245153', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A348.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24515', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24517', '111 PCS YOUNGTIMER /24517/ JEEP WILLYS CJ-2A GR', '111 PCS YOUNGTIMER /24517/ JEEP WILLYS CJ-2A GR', 100, 16.99, 'EUR', '5902251245177', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A349.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24517', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24518', '111 PCS YOUNGTIMER /24518/ JEEP WILLYS CJ-2A', '111 PCS YOUNGTIMER /24518/ JEEP WILLYS CJ-2A', 100, 16.99, 'EUR', '5902251245184', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A350.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24518', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24524', '70 PCS YOUNGTIMER /24524/ FIAT ABARTH 595', '70 PCS YOUNGTIMER /24524/ FIAT ABARTH 595', 100, 14.99, 'EUR', '5902251245245', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A351.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24524', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24554', '94 PCS YOUNGTIMER /24554/ MELEX 212 GOLF SET', '94 PCS YOUNGTIMER /24554/ MELEX 212 GOLF SET', 100, 6.99, 'EUR', '5902251245542', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A352.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24554', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 6.99, 'RRP 6,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24589', '106 PCS YOUNGTIMER /24589/ FSO POLONEZ 1.6 CARO', '106 PCS YOUNGTIMER /24589/ FSO POLONEZ 1.6 CARO', 100, 14.99, 'EUR', '5902251245894', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A353.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24589', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24595', '157 PCS YOUNGTIMER /24595/ BARKAS B1000 KRANKENW', '157 PCS YOUNGTIMER /24595/ BARKAS B1000 KRANKENW', 100, 19.99, 'EUR', '5902251245955', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A354.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24595', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24596', '157 PCS YOUNGTIMER /24596/ BARKAS B1000 POLIZEI', '157 PCS YOUNGTIMER /24596/ BARKAS B1000 POLIZEI', 100, 19.99, 'EUR', '5902251245962', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A355.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24596', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24600', '147 PCS YOUNGTIMER /24600/ BARKAS B1000', '147 PCS YOUNGTIMER /24600/ BARKAS B1000', 100, 19.99, 'EUR', '5902251246006', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A356.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24600', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24603', '90 PCS YOUNGTIMER /24603/ FSO 125P KOMBI', '90 PCS YOUNGTIMER /24603/ FSO 125P KOMBI', 100, 14.99, 'EUR', '5902251246037', 'COBI YOUNGTIMER',
    'NEW', '/extracted_images/img_A357.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'YOUNGTIMER', 'COBI-24603', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 14.99, 'RRP 14,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24616', '272 PCS VOLKSWAGEN /24616/ T2A CAMPER VAN', '272 PCS VOLKSWAGEN /24616/ T2A CAMPER VAN', 100, 39.99, 'EUR', '5902251246167', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A359.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24616', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24617', '292 PCS VOLKSWAGEN /24617/ T2A KOMBI', '292 PCS VOLKSWAGEN /24617/ T2A KOMBI', 100, 39.99, 'EUR', '5902251246174', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A360.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24617', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24618', 'VOLKSWAGEN /24618/ T2A PRITSCHENWAGEN 152 PCS', 'VOLKSWAGEN /24618/ T2A PRITSCHENWAGEN 152 PCS', 100, 25.99, 'EUR', '5902251246181', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A361.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24618', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24619', 'VOLKSWAGEN /24619/ T2B KRANKENWAGEN 172 PCS', 'VOLKSWAGEN /24619/ T2B KRANKENWAGEN 172 PCS', 100, 25.99, 'EUR', '5902251246198', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A362.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24619', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24621', '145 PCS VOLKSWAGEN /24621/ T2B BUS', '145 PCS VOLKSWAGEN /24621/ T2B BUS', 100, 25.99, 'EUR', '5902251246211', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A363.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24621', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24622', 'VOLKSWAGEN /24622/ T2B FEUERWEHR 172 PCS', 'VOLKSWAGEN /24622/ T2B FEUERWEHR 172 PCS', 100, 25.99, 'EUR', '5902251246228', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A364.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24622', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24634', '140 PCS VOLKSWAGEN /24634/ TRANSPORTER III 1979', '140 PCS VOLKSWAGEN /24634/ TRANSPORTER III 1979', 100, 25.99, 'EUR', '5902251246341', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A365.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24634', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24635', '240 PCS VOLKSWAGEN /24635/ T3 FEUERWEHR', '240 PCS VOLKSWAGEN /24635/ T3 FEUERWEHR', 100, 25.99, 'EUR', '5902251246358', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A366.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24635', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24636', 'VOLKSWAGEN /24636/ T3 KRANKENWAGEN 146 KL.', 'VOLKSWAGEN /24636/ T3 KRANKENWAGEN 146 KL.', 100, 25.99, 'EUR', '5902251246365', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A367.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24636', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24637', '146 PCS VOLKSWAGEN /24637/ T3 POLIZEI', '146 PCS VOLKSWAGEN /24637/ T3 POLIZEI', 100, 25.99, 'EUR', '5902251246372', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A368.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24637', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24638', '240 PCS VOLKSWAGEN /24638/ T3 CAMPER VAN', '240 PCS VOLKSWAGEN /24638/ T3 CAMPER VAN', 100, 29.99, 'EUR', '5902251246389', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A369.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24638', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 29.99, 'RRP 29,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24639', '221 PCS VOLKSWAGEN /24639/ WINTER ADVENT. W/VWT3', '221 PCS VOLKSWAGEN /24639/ WINTER ADVENT. W/VWT3', 100, 29.99, 'EUR', '5902251246396', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A370.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24639', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 29.99, 'RRP 29,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24641', '109 PCS VOLKSWAGEN /24641/ PASSAT B1 VARIANT', '109 PCS VOLKSWAGEN /24641/ PASSAT B1 VARIANT', 100, 16.99, 'EUR', '5902251246419', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A371.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24641', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24642', '77 PCS VOLKSWAGEN /24642/ GOLF (1974) POLIZEI', '77 PCS VOLKSWAGEN /24642/ GOLF (1974) POLIZEI', 100, 16.99, 'EUR', '5902251246426', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A372.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24642', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'JUNE  2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24643', '361 PCS VOLKSWAGEN /24643/ PASSAT B1 W/CARAVAN', '361 PCS VOLKSWAGEN /24643/ PASSAT B1 W/CARAVAN', 100, 39.99, 'EUR', '5902251246433', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A373.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24643', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24644', '107 PCS VOLKSWAGEN /24644/ PASSAT B1', '107 PCS VOLKSWAGEN /24644/ PASSAT B1', 100, 16.99, 'EUR', '5902251246440', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A374.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24644', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24645', '78 PCS VOLKSWAGEN /24645/ PASSAT B1 VARIANT POLIZEI', '78 PCS VOLKSWAGEN /24645/ PASSAT B1 VARIANT POLIZEI', 100, 16.99, 'EUR', '5902251246457', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A375.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24645', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24660', 'VOLKSWAGEN /24660/ GOLF I CABRIO 65 KL.', 'VOLKSWAGEN /24660/ GOLF I CABRIO 65 KL.', 100, 16.99, 'EUR', '5902251246600', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A376.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24660', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24661', 'VOLKSWAGEN /24661/ GOLF I GTI CABRIO 65 KL.', 'VOLKSWAGEN /24661/ GOLF I GTI CABRIO 65 KL.', 100, 16.99, 'EUR', '5902251246617', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A377.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24661', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24662', 'VOLKSWAGEN /24662/ GOLF GTI 68 KL.', 'VOLKSWAGEN /24662/ GOLF GTI 68 KL.', 100, 16.99, 'EUR', '5902251246624', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A378.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24662', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24663', 'VOLKSWAGEN /24663/ GOLF GTI 68 KL.', 'VOLKSWAGEN /24663/ GOLF GTI 68 KL.', 100, 16.99, 'EUR', '5902251246631', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A379.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24663', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24655', 'VOLKSWAGEN /24655/ VOLKSWAGEN GOLF CDU', 'VOLKSWAGEN /24655/ VOLKSWAGEN GOLF CDU', 100, 271.84, 'EUR', '5902251246556', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A380.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24655', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 271.84, 'RRP 271,84  EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24656', 'VOLKSWAGEN /24656/ VOLKSWAGEN T2A CDU', 'VOLKSWAGEN /24656/ VOLKSWAGEN T2A CDU', 100, 399.90, 'EUR', '5902251246563', 'COBI VOLKSWAGEN ',
    'NEW', '/extracted_images/img_A381.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'VOLKSWAGEN ', 'COBI-24656', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 399.90, 'RRP 399,90  EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24664', '88 PCS AUDI /24664/ QUATTRO RED', '88 PCS AUDI /24664/ QUATTRO RED', 100, 16.99, 'EUR', '5902251246648', 'COBI AUDI',
    'NEW', '/extracted_images/img_A383.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'AUDI', 'COBI-24664', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24665', '88 PCS AUDI /24665/ QUATTRO WHITE', '88 PCS AUDI /24665/ QUATTRO WHITE', 100, 16.99, 'EUR', '5902251246655', 'COBI AUDI',
    'NEW', '/extracted_images/img_A384.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'AUDI', 'COBI-24665', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24666', 'AUDI /24666/ QUATTRO GROUP 4 (1981) 165 KL.', 'AUDI /24666/ QUATTRO GROUP 4 (1981) 165 KL.', 100, 29.99, 'EUR', '5902251246662', 'COBI AUDI',
    'NEW', '/extracted_images/img_A385.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'AUDI', 'COBI-24666', NULL,
    NULL, NULL, NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 29.99, 'RRP 29,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24667', '148 PCS AUDI /24667/ SPORT QUATTRO S1 E2', '148 PCS AUDI /24667/ SPORT QUATTRO S1 E2', 100, 25.99, 'EUR', '5902251246679', 'COBI AUDI',
    'NEW', '/extracted_images/img_A386.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'AUDI', 'COBI-24667', NULL,
    NULL, NULL, NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', '12 JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24668', '230 PCS AUDI /24668/ SPORT QUATTRO S1 E2 RALLY', '230 PCS AUDI /24668/ SPORT QUATTRO S1 E2 RALLY', 100, 29.99, 'EUR', '5902251246686', 'COBI AUDI',
    'NEW', '/extracted_images/img_A387.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'AUDI', 'COBI-24668', NULL,
    NULL, NULL, NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 29.99, 'RRP 29,99 EUR', '12 JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24673', '78 PCS RENAULT /24673/ 5 E-TECH YELLOW', '78 PCS RENAULT /24673/ 5 E-TECH YELLOW', 100, 16.99, 'EUR', '5902251246730', 'COBI RENAULT',
    'NEW', '/extracted_images/img_A389.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RENAULT', 'COBI-24673', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'LIMITED QUANTITY , NEW PRODUCTION 28 AUGUST 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24674', '78 PCS RENAULT /24674/ 5 E-TECH GREEN', '78 PCS RENAULT /24674/ 5 E-TECH GREEN', 100, 16.99, 'EUR', '5902251246747', 'COBI RENAULT',
    'NEW', '/extracted_images/img_A390.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RENAULT', 'COBI-24674', NULL,
    NULL, NULL, NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'NEW PRODUCTION 28 AUGUST 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24675', '78 PCS RENAULT /24675/ 5 E-TECH WHITE', '78 PCS RENAULT /24675/ 5 E-TECH WHITE', 100, 16.99, 'EUR', '5902251246754', 'COBI RENAULT',
    'NEW', '/extracted_images/img_A391.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RENAULT', 'COBI-24675', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'LIMITED QUANTITY , NEW PRODUCTION 28 AUGUST 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24677', 'RENAULT /24677/1976 RENAULT 5 ALPINE POLICE ', 'RENAULT /24677/1976 RENAULT 5 ALPINE POLICE ', 100, 25.99, 'EUR', 'TBC', 'COBI RENAULT',
    'NEW', '/extracted_images/img_A392.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RENAULT', 'COBI-24677', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24678', 'RENAULT /24678/ 1981 RENAULT 5 ALPINE TURBO', 'RENAULT /24678/ 1981 RENAULT 5 ALPINE TURBO', 100, 16.99, 'EUR', 'TBC', 'COBI RENAULT',
    'NEW', '/extracted_images/img_A393.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RENAULT', 'COBI-24678', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24679', 'RENAULT /24679/ 1980 RENAULT 5 TURBO', 'RENAULT /24679/ 1980 RENAULT 5 TURBO', 100, 16.99, 'EUR', 'TBC', 'COBI RENAULT',
    'NEW', '/extracted_images/img_A394.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RENAULT', 'COBI-24679', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24680', 'RENAULT /24680/ 1980 RENAULT 5 TURBO', 'RENAULT /24680/ 1980 RENAULT 5 TURBO', 100, 16.99, 'EUR', 'TBC', 'COBI RENAULT',
    'NEW', '/extracted_images/img_A395.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RENAULT', 'COBI-24680', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'JULY 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24681', 'RENAULT /24681/ 1980 RENAULT 5 TURBO RALLY', 'RENAULT /24681/ 1980 RENAULT 5 TURBO RALLY', 100, 25.99, 'EUR', 'TBC', 'COBI RENAULT',
    'NEW', '/extracted_images/img_A396.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RENAULT', 'COBI-24681', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'JULY 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24626', 'CITROEN /24626/ TYPE H(1947-81) HOLIDAYS 282 PCS', 'CITROEN /24626/ TYPE H(1947-81) HOLIDAYS 282 PCS', 100, 39.99, 'EUR', '5902251246266', 'COBI CITROEN',
    'NEW', '/extracted_images/img_A398.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CITROEN', 'COBI-24626', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAIALBLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24627', 'CITROEN /24627/ TYPE H(1947-81) CAR TRANSP. 280K', 'CITROEN /24627/ TYPE H(1947-81) CAR TRANSP. 280K', 100, 39.99, 'EUR', '5902251246273', 'COBI CITROEN',
    'NEW', '/extracted_images/img_A399.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CITROEN', 'COBI-24627', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAIALBLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24628', '203 PCS CITROEN /24628/ TYPE H(1947-81) POMPIERS', '203 PCS CITROEN /24628/ TYPE H(1947-81) POMPIERS', 100, 25.99, 'EUR', '5902251246280', 'COBI CITROEN',
    'NEW', '/extracted_images/img_A400.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CITROEN', 'COBI-24628', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAIALBLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24630', 'CITROEN /24630/ TYPE H(1947-81) POLICE 180 PCS', 'CITROEN /24630/ TYPE H(1947-81) POLICE 180 PCS', 100, 25.99, 'EUR', '5902251246303', 'COBI CITROEN',
    'NEW', '/extracted_images/img_A401.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CITROEN', 'COBI-24630', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAIALBLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24631', 'CITROEN /24631/ TYPE H(1947-81) 200 KL.', 'CITROEN /24631/ TYPE H(1947-81) 200 KL.', 100, 25.99, 'EUR', '5902251246310', 'COBI CITROEN',
    'NEW', '/extracted_images/img_A402.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CITROEN', 'COBI-24631', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAIALBLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24632', '187 PCS CITROEN /24632/ TYPE H', '187 PCS CITROEN /24632/ TYPE H', 100, 25.99, 'EUR', '5902251246327', 'COBI CITROEN',
    'NEW', '/extracted_images/img_A403.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CITROEN', 'COBI-24632', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAIALBLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24633', 'CITROEN /24633/ TYPE H(1947-81) 390 PCS', 'CITROEN /24633/ TYPE H(1947-81) 390 PCS', 100, 49.99, 'EUR', '5902251246334', 'COBI CITROEN',
    'NEW', '/extracted_images/img_A404.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CITROEN', 'COBI-24633', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 49.99, 'RRP 49,99 EUR', 'AVAIALBLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24597', '138 PCS CARS /24597/ OPEL REKORD C SCHWARZE WITW', '138 PCS CARS /24597/ OPEL REKORD C SCHWARZE WITW', 100, 16.99, 'EUR', '5902251245979', 'COBI OPEL',
    'NEW', '/extracted_images/img_A406.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'OPEL', 'COBI-24597', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24598', '134 PCS CARS /24598/ OPEL REKORD C 1900L', '134 PCS CARS /24598/ OPEL REKORD C 1900L', 100, 16.99, 'EUR', '5902251245986', 'COBI OPEL',
    'NEW', '/extracted_images/img_A407.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'OPEL', 'COBI-24598', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24599', '140 PCS CARS /24599/ OPEL REKORD C 1700L CABRIO', '140 PCS CARS /24599/ OPEL REKORD C 1700L CABRIO', 100, 16.99, 'EUR', '5902251245993', 'COBI OPEL',
    'NEW', '/extracted_images/img_A408.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'OPEL', 'COBI-24599', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24504', '97 PCS MASERATI /24504/ GRANCABRIO', '97 PCS MASERATI /24504/ GRANCABRIO', 100, 16.99, 'EUR', '5902251245047', 'COBI MASERATI',
    'NEW', '/extracted_images/img_A410.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'MASERATI', 'COBI-24504', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAIALBLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24507', '108 PCS MASERATI /24507/ LEVANTE S', '108 PCS MASERATI /24507/ LEVANTE S', 100, 16.99, 'EUR', '5902251245078', 'COBI MASERATI',
    'NEW', '/extracted_images/img_A411.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'MASERATI', 'COBI-24507', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24569', '106 PCS MASERATI /24569/ LEVANTE GTS', '106 PCS MASERATI /24569/ LEVANTE GTS', 100, 16.99, 'EUR', '5902251245696', 'COBI MASERATI',
    'NEW', '/extracted_images/img_A412.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'MASERATI', 'COBI-24569', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24577', '97  PCS MASERATI /24577/ Maserati GranTurismo Trofeo      ', '97  PCS MASERATI /24577/ Maserati GranTurismo Trofeo      ', 100, 16.99, 'EUR', 'TBC', 'COBI MASERATI',
    'NEW', '/extracted_images/img_A413.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'MASERATI', 'COBI-24577', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', '19 JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24578', '98  PCS MASERATI /24578/ Maserati GranCabrio Trofeo       ', '98  PCS MASERATI /24578/ Maserati GranCabrio Trofeo       ', 100, 16.99, 'EUR', 'TBC', 'COBI MASERATI',
    'NEW', '/extracted_images/img_A414.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'MASERATI', 'COBI-24578', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', '19 JUNE 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24604', '90 PCS ALFA ROMEO /24604/ GIULIA QUADRIFOGLIO', '90 PCS ALFA ROMEO /24604/ GIULIA QUADRIFOGLIO', 100, 16.99, 'EUR', '5902251246044', 'COBI ALFA ROMEO',
    'NEW', '/extracted_images/img_A416.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ALFA ROMEO', 'COBI-24604', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24605', '90 PCS ALFA ROMEO /24605/ GIULIA QUADRIFOGLIO', '90 PCS ALFA ROMEO /24605/ GIULIA QUADRIFOGLIO', 100, 16.99, 'EUR', '5902251246051', 'COBI ALFA ROMEO',
    'NEW', '/extracted_images/img_A417.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ALFA ROMEO', 'COBI-24605', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24606', '93 PCS ALFA ROMEO /24606/ GIULIA QUADR. POLIZIA', '93 PCS ALFA ROMEO /24606/ GIULIA QUADR. POLIZIA', 100, 16.99, 'EUR', '5902251246068', 'COBI ALFA ROMEO',
    'NEW', '/extracted_images/img_A418.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ALFA ROMEO', 'COBI-24606', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24654', '99 PCS ALFA ROMEO /24654/ GULIA QUADR. CARABINIERI', '99 PCS ALFA ROMEO /24654/ GULIA QUADR. CARABINIERI', 100, 16.99, 'EUR', '5902251246549', 'COBI ALFA ROMEO',
    'NEW', '/extracted_images/img_A419.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ALFA ROMEO', 'COBI-24654', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24657', '97 PCS ALFA ROMEO /24657/ GULIA QUADR. GUARDIA', '97 PCS ALFA ROMEO /24657/ GULIA QUADR. GUARDIA', 100, 16.99, 'EUR', '5902251246570', 'COBI ALFA ROMEO',
    'NEW', '/extracted_images/img_A420.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ALFA ROMEO', 'COBI-24657', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24648', '67 PCS SUBARU /24648/ IMPREZA WRX', '67 PCS SUBARU /24648/ IMPREZA WRX', 100, 16.99, 'EUR', '5902251246488', 'COBI SUBARU',
    'NEW', '/extracted_images/img_A422.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'SUBARU', 'COBI-24648', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'NEW PRODUCTION 28 AUGUST 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24649', '65 PCS SUBARU /24649/ IMPREZA WRX STI', '65 PCS SUBARU /24649/ IMPREZA WRX STI', 100, 16.99, 'EUR', '5902251246495', 'COBI SUBARU',
    'NEW', '/extracted_images/img_A423.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'SUBARU', 'COBI-24649', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24650', '69 PCS SUBARU /24650/ IMPREZA WRC', '69 PCS SUBARU /24650/ IMPREZA WRC', 100, 19.99, 'EUR', '5902251246501', 'COBI SUBARU',
    'NEW', '/extracted_images/img_A424.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'SUBARU', 'COBI-24650', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24652', '212 PCS SUBARU /24652/ IMPREZA WRC 2004', '212 PCS SUBARU /24652/ IMPREZA WRC 2004', 100, 29.99, 'EUR', '5902251246525', 'COBI SUBARU',
    'NEW', '/extracted_images/img_A425.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'SUBARU', 'COBI-24652', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 29.99, 'RRP 29,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26627', '210 PCS BELL 407 - COAST GUARD      scale 1:48             ', '210 PCS BELL 407 - COAST GUARD      scale 1:48             ', 100, 25.99, 'EUR', '5902251266271', 'COBI BELL',
    'NEW', '/extracted_images/img_A427.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'BELL', 'COBI-26627', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26628', '217 PCS BELL  407 - POLICE                 scale 1:48          ', '217 PCS BELL  407 - POLICE                 scale 1:48          ', 100, 25.99, 'EUR', '5902251266288', 'COBI BELL',
    'NEW', '/extracted_images/img_A428.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'BELL', 'COBI-26628', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26629', '257 PCS BELL 429 - AIR AMBULANCE    scale 1:48            ', '257 PCS BELL 429 - AIR AMBULANCE    scale 1:48            ', 100, 29.99, 'EUR', '5902251266295', 'COBI BELL',
    'NEW', '/extracted_images/img_A429.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'BELL', 'COBI-26629', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 29.99, 'RRP 29,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26630', '266 PCS BELL 429 - POLICE                 scale 1:48           ', '266 PCS BELL 429 - POLICE                 scale 1:48           ', 100, 29.99, 'EUR', '5902251266301', 'COBI BELL',
    'NEW', '/extracted_images/img_A430.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'BELL', 'COBI-26630', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 29.99, 'RRP 29,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26624', '192 PCS  BEECHCRAFT/26624/ BEECHCRAFT T-6 TEXAN II', '192 PCS  BEECHCRAFT/26624/ BEECHCRAFT T-6 TEXAN II', 100, 25.99, 'EUR', '5902251266240', 'COBI BEECHCRAFT',
    'NEW', '/extracted_images/img_A432.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'BEECHCRAFT', 'COBI-26624', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26625', '192 PCS  BEECHCRAFT/26625/ BEECHCRAFT T-6 TEXAN II', '192 PCS  BEECHCRAFT/26625/ BEECHCRAFT T-6 TEXAN II', 100, 25.99, 'EUR', '5902251266257', 'COBI BEECHCRAFT',
    'NEW', '/extracted_images/img_A433.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'BEECHCRAFT', 'COBI-26625', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26626', '192 PCS  BEECHCRAFT/26626/ BEECHCRAFT T-6 TEXAN II ROYAL AIR', '192 PCS  BEECHCRAFT/26626/ BEECHCRAFT T-6 TEXAN II ROYAL AIR', 100, 25.99, 'EUR', '5902251266264', 'COBI BEECHCRAFT',
    'NEW', '/extracted_images/img_A434.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'BEECHCRAFT', 'COBI-26626', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26620', '160 PCS CYVIL AIRCRAFT /26620/ CESSNA172 SKYHAWK', '160 PCS CYVIL AIRCRAFT /26620/ CESSNA172 SKYHAWK', 100, 19.99, 'EUR', '5902251266202', 'COBI CESSNA',
    'NEW', '/extracted_images/img_A436.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CESSNA', 'COBI-26620', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'VERY LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26621', '160 PCS CYVIL AIRCRAFT /26621/ CESSNA 172 SKYHAW', '160 PCS CYVIL AIRCRAFT /26621/ CESSNA 172 SKYHAW', 100, 19.99, 'EUR', '5902251266219', 'COBI CESSNA',
    'NEW', '/extracted_images/img_A437.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CESSNA', 'COBI-26621', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-26623', 'SAMOLOTY CYWILNE /26623/ CESSNA 172 SKYHAWK 162K', 'SAMOLOTY CYWILNE /26623/ CESSNA 172 SKYHAWK 162K', 100, 19.99, 'EUR', '5902251266233', 'COBI CESSNA',
    'NEW', '/extracted_images/img_A438.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'CESSNA', 'COBI-26623', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 19.99, 'RRP 19,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24607', '183 PCS RAM /24607/ 1500', '183 PCS RAM /24607/ 1500', 100, 25.99, 'EUR', '5902251246075', 'COBI RAM',
    'NEW', '/extracted_images/img_A440.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RAM', 'COBI-24607', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24608', '203 PCS RAM /24608/ 1500 POLICE', '203 PCS RAM /24608/ 1500 POLICE', 100, 25.99, 'EUR', '5902251246082', 'COBI RAM',
    'NEW', '/extracted_images/img_A441.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RAM', 'COBI-24608', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24609', '304 PCS RAM /24609/ 3500 AMBULANCE', '304 PCS RAM /24609/ 3500 AMBULANCE', 100, 39.99, 'EUR', '5902251246099', 'COBI RAM',
    'NEW', '/extracted_images/img_A442.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RAM', 'COBI-24609', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24610', '187 PCS RAM /24610/ 2500', '187 PCS RAM /24610/ 2500', 100, 25.99, 'EUR', '5902251246105', 'COBI RAM',
    'NEW', '/extracted_images/img_A443.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RAM', 'COBI-24610', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'LIMITED QANTITY, NEW PRODUCTION OCTOBER 2026'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24611', 'RAM /24611/ 3500 WRECKER TOW TRUCK 290 PCS', 'RAM /24611/ 3500 WRECKER TOW TRUCK 290 PCS', 100, 39.99, 'EUR', '5902251246112', 'COBI RAM',
    'NEW', '/extracted_images/img_A444.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RAM', 'COBI-24611', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24612', 'RAM /24612/ 3500 FIRE TRUCK 350 PCS', 'RAM /24612/ 3500 FIRE TRUCK 350 PCS', 100, 39.99, 'EUR', '5902251246129', 'COBI RAM',
    'NEW', '/extracted_images/img_A445.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RAM', 'COBI-24612', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24658', '198 PCS RAM /24658/ 1500 HEMI SHERIFF', '198 PCS RAM /24658/ 1500 HEMI SHERIFF', 100, 25.99, 'EUR', '5902251246587', 'COBI RAM',
    'NEW', '/extracted_images/img_A446.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RAM', 'COBI-24658', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 25.99, 'RRP 25,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24659', '300 PCS RAM /24659/ 3500 DUMP TRUCK', '300 PCS RAM /24659/ 3500 DUMP TRUCK', 100, 39.99, 'EUR', '5902251246594', 'COBI RAM',
    'NEW', '/extracted_images/img_A447.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'RAM', 'COBI-24659', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-1684', '290 PCS ACTION TOWN /1684/ ALPINE F1 CAR', '290 PCS ACTION TOWN /1684/ ALPINE F1 CAR', 100, 24.99, 'EUR', '5902251016845', 'COBI ALPHINE F1',
    'NEW', '/extracted_images/img_A449.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ALPHINE F1', 'COBI-1684', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 24.99, 'RRP 24,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-1685', '477 PCS ACTION TOWN /1685/ ALPINE F1 PIT STOP', '477 PCS ACTION TOWN /1685/ ALPINE F1 PIT STOP', 100, 39.99, 'EUR', '5902251016852', 'COBI ALPHINE F1',
    'NEW', '/extracted_images/img_A450.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'ALPHINE F1', 'COBI-1685', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24575', '92 PCS SKODA /24575/ ENYAQ RS', '92 PCS SKODA /24575/ ENYAQ RS', 100, 16.99, 'EUR', '5902251245757', 'COBI SKODA',
    'NEW', '/extracted_images/img_A452.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'SKODA', 'COBI-24575', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'LIMITED QUANTITY'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24582', '70 PCS SKODA /24582/ SKODA SCALA 1.0 TSI', '70 PCS SKODA /24582/ SKODA SCALA 1.0 TSI', 100, 16.99, 'EUR', '5902251245825', 'COBI SKODA',
    'NEW', '/extracted_images/img_A453.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'SKODA', 'COBI-24582', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-24584', '105 PCS SKODA /24584/ SKODA KODIAQ VRS', '105 PCS SKODA /24584/ SKODA KODIAQ VRS', 100, 16.99, 'EUR', '5902251245849', 'COBI SKODA',
    'NEW', '/extracted_images/img_A454.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'SKODA', 'COBI-24584', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 16.99, 'RRP 16,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-1683', '347 PCS MANITOU /1683/ 280 TJ', '347 PCS MANITOU /1683/ 280 TJ', 100, 17.99, 'EUR', '5902251016838', 'COBI MACHINES',
    'NEW', '/extracted_images/img_A456.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'MACHINES', 'COBI-1683', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 17.99, 'RRP 17,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20006', '381 PCS NATIVITY SET /20006/ NATIVITY SCENE', '381 PCS NATIVITY SET /20006/ NATIVITY SCENE', 100, 39.99, 'EUR', '5902251200060', 'COBI NAIVITY SET',
    'NEW', '/extracted_images/img_A458.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'NAIVITY SET', 'COBI-20006', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 39.99, 'RRP 39,99EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20009', '51 PCS CHRISTMAS /20009/ HOLIDAY ORNAMENTS', '51 PCS CHRISTMAS /20009/ HOLIDAY ORNAMENTS', 100, 9.99, 'EUR', '5902251200091', 'COBI NATIVITY SET',
    'NEW', '/extracted_images/img_A459.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'NATIVITY SET', 'COBI-20009', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20011', '75 PCS CHRISTMAS /20011/ SANTA CLAUS', '75 PCS CHRISTMAS /20011/ SANTA CLAUS', 100, 9.99, 'EUR', '5902251200114', 'COBI NATIVITY SET',
    'NEW', '/extracted_images/img_A460.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'NATIVITY SET', 'COBI-20011', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20012', '59 PCS CHRISTMAS /20012/ SNOWMAN', '59 PCS CHRISTMAS /20012/ SNOWMAN', 100, 9.99, 'EUR', '5902251200121', 'COBI NATIVITY SET',
    'NEW', '/extracted_images/img_A461.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'NATIVITY SET', 'COBI-20012', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20013', '73 PCS CHRISTMAS /20013/ GINGERBREAD MAN', '73 PCS CHRISTMAS /20013/ GINGERBREAD MAN', 100, 9.99, 'EUR', '5902251200138', 'COBI NATIVITY SET',
    'NEW', '/extracted_images/img_A462.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'NATIVITY SET', 'COBI-20013', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20014', '67 PCS CHRISTMAS /20014/ REINDEER', '67 PCS CHRISTMAS /20014/ REINDEER', 100, 9.99, 'EUR', '5902251200145', 'COBI NATIVITY SET',
    'NEW', '/extracted_images/img_A463.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'NATIVITY SET', 'COBI-20014', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 9.99, 'RRP 9,99 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    'COBI-20020', 'CHRISTMAS /20020/ CDU 21 SETS ENGLISH', 'CHRISTMAS /20020/ CDU 21 SETS ENGLISH', 100, 209.79, 'EUR', '5902251200206', 'COBI NATIVITY SET',
    'NEW', '/extracted_images/img_A464.png', NULL, 'ACTIVE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    'NATIVITY SET', 'COBI-20020', NULL,
    NULL, 'BOX', NULL, NULL,
    NULL, NULL, NULL,
    NULL, NULL, 209.79, 'RRP 209,79 EUR', 'AVAILABLE'
) ON CONFLICT (sku) DO NOTHING;

-- Verify counts
SELECT 'product_total' as cnt, COUNT(*) as n FROM product;
SELECT 'product_cobi' as cnt, COUNT(*) as n FROM product WHERE brand_id = (SELECT id FROM brand WHERE name='COBI');

