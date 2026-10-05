$csvPath = Resolve-Path "doc\extracted_images\cobi_products.csv"
$outSqlPath = "supabase\migrations\20261005_02_insert_cobi_products.sql"
$rows = Import-Csv -Path $csvPath -Encoding UTF8
Write-Host "Rows from CSV: $($rows.Count)"

# Build the SQL
$sql = New-Object System.Text.StringBuilder
[void]$sql.AppendLine("SET client_encoding = 'UTF8';")

# Create brand & manufacturer if not present, resolve their IDs
[void]$sql.AppendLine(@"
-- Ensure COBI brand / COBI FACTORY S.A. manufacturer exist
INSERT INTO brand (name, created_at, updated_at) VALUES ('COBI', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (name) DO NOTHING;
INSERT INTO manufacturer (name, created_at, updated_at) VALUES ('COBI FACTORY S.A', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT (name) DO NOTHING;
"@)
[void]$sql.AppendLine()

$idx = 0
$dupSkus = 0
foreach ($r in $rows) {
    $idx++
    $indexCode = $r.index_code
    $sku = $indexCode   # use INDEX column as SKU
    $title = $r.description
    if (-not $title -or $title.Length -eq 0) { $title = "COBI Item $indexCode" }
    $ean = $r.barcode
    $collection = $r.collection

    # Decimal fields - strict numeric validation
    function N($s) {
        if ($null -eq $s -or $s -eq '') { return $null }
        $s2 = ($s -replace ',', '.').Trim()
        [double]$d = 0
        if ([double]::TryParse($s2, [Globalization.CultureInfo]::InvariantCulture, [ref]$d)) {
            if ($d -eq 0) { return $null }
            return $d.ToString("0.000000", [Globalization.CultureInfo]::InvariantCulture)
        }
        return $null
    }
    function I($s) {
        if ($null -eq $s -or $s -eq '') { return $null }
        $s2 = ($s -replace ',', '.').Trim()
        [double]$d = 0
        if ([double]::TryParse($s2, [Globalization.CultureInfo]::InvariantCulture, [ref]$d)) {
            $i = [int][Math]::Round($d)
            if ($i -eq 0) { return $null }
            return $i
        }
        return $null
    }

    $purchase = N $r.purchase_price_eur
    $masterCartonPcs = I $r.master_carton_pcs
    $boxType = $r.box_type
    $boxVol = N $r.box_gross_volume_m3
    $mcVol = N $r.master_carton_gross_volume_m3
    $boxWt = N $r.box_gross_weight_kg
    $mcWt = N $r.master_carton_gross_weight_kg
    $tVol = N $r.total_mcv_m3
    $tWt = N $r.total_mcw_kg
    $tQty = I $r.total_mc_qty
    $rrpText = $r.rrp_text
    # Parse rrp: "RRP 149,99 EUR" -> 149.99
    [double]$rrpEurVal = 0
    if ($rrpText -match '([0-9]+[.,]?[0-9]*)') {
        $numStr = $Matches[1] -replace ',', '.'
        $rrpEurVal = [double]$numStr
    }
    $rrpEur = if ($rrpEurVal -gt 0) { $rrpEurVal.ToString("0.00", [Globalization.CultureInfo]::InvariantCulture) } else { $null }
    $availability = $r.availability

    # image path in csv looks like "..\..\doc\extracted_images/img_A12.png" -> extract just filename part
    $imageUrls = ""
    if ($r.image -match '(img_[A-Za-z0-9]+\.[a-z0-9]+)') {
        $imageUrls = "/extracted_images/" + $Matches[1]
    }

    # Default price (if purchase price is known, use it as price; otherwise use rrp)
    $price = if ($purchase) { $purchase } elseif ($rrpEur) { $rrpEur } else { "0.01" }
    $currency = "EUR"
    $quantity = 100
    $listingStatus = "ACTIVE"
    $condition = "NEW"
    $weightKg = $mcWt
    $dimensions = $null
    $category = "COBI $collection"

    # Escape single quotes for SQL
    function Q([string]$s) {
        if ($null -eq $s -or $s.Length -eq 0) { return "NULL" }
        return "`'" + ($s -replace "'", "''") + "`'"
    }
    function QN($s) {
        if ($null -eq $s -or $s -eq "") { return "NULL" }
        return $s.ToString()
    }
    function QI($s) {
        if ($null -eq $s) { return "NULL" }
        return [int]$s
    }

    [void]$sql.AppendLine(@"
INSERT INTO product (
    sku, title, description, quantity, price, currency, ean, category,
    condition, image_urls, weight_kg, listing_status, created_at, updated_at,
    brand_id, manufacturer_id, collection, index_code, purchase_price,
    master_carton_pcs, box_type, box_gross_volume_m3, master_carton_gross_volume_m3,
    box_gross_weight_kg, master_carton_gross_weight_kg, total_master_carton_volume_m3,
    total_master_carton_weight_kg, total_master_carton_qty, rrp_eur, rrp_text, availability
) VALUES (
    $(Q $sku), $(Q $title), $(Q $r.description), $quantity, $(QN $price), $(Q $currency), $(Q $ean), $(Q $category),
    $(Q $condition), $(Q $imageUrls), $(QN $weightKg), $(Q $listingStatus), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP,
    (SELECT id FROM brand WHERE name = 'COBI'),
    (SELECT id FROM manufacturer WHERE name = 'COBI FACTORY S.A'),
    $(Q $collection), $(Q $indexCode), $(QN $purchase),
    $(QI $masterCartonPcs), $(Q $boxType), $(QN $boxVol), $(QN $mcVol),
    $(QN $boxWt), $(QN $mcWt), $(QN $tVol),
    $(QN $tWt), $(QI $tQty), $(QN $rrpEur), $(Q $rrpText), $(Q $availability)
) ON CONFLICT (sku) DO NOTHING;
"@)
}

[void]$sql.AppendLine()
[void]$sql.AppendLine(@"
-- Verify counts
SELECT 'product_total' as cnt, COUNT(*) as n FROM product;
SELECT 'product_cobi' as cnt, COUNT(*) as n FROM product WHERE brand_id = (SELECT id FROM brand WHERE name='COBI');
"@)

Set-Content -Path $outSqlPath -Value $sql.ToString() -Encoding UTF8
Write-Host "Wrote SQL: $outSqlPath  (rows generated: $idx)"
