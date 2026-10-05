$out = Get-Content tools\read-xlsx\read_output.txt
# Find the data header row (row with columns "Photo", "No.", "Symbol", "Code", "EAN", "Barcode", "Name", "Description", "Item No.", "Qty/pc", "Qty/ctn", "N.W.", "G.W.", "CTN Size", "Price EUR", "Currency", "Value", "Unit", "MSRP" ...)
Write-Host "Searching for column header rows..."
$lastRow = 0
for ($i = 0; $i -lt $out.Count; $i++) {
    $line = $out[$i]
    if ($line -match '^-- row (\d+) --') { $lastRow = [int]$Matches[1] ; continue }
    # Look for lines that have EAN or Barcode or MSRP or Photo (header cell)
    if ($line -match 'EAN|BARCODE|Barcode|MSRP|MSRP|Photo|Symbol|\bNo\.\b|Item\s+No\.') {
        Write-Host "row=$lastRow line=$line"
    }
}
Write-Host "Now printing rows 8..30"
# Reset lastRow then print rows 8..30 with all cells
$lastRow = -1
$printStart = 8
$printEnd = 40
for ($i = 0; $i -lt $out.Count; $i++) {
    $line = $out[$i]
    if ($line -match '^-- row (\d+) --') {
        $lastRow = [int]$Matches[1]
    }
    if ($lastRow -ge $printStart -and $lastRow -le $printEnd) {
        Write-Host $line
    }
}
