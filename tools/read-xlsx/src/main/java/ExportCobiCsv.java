import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;
import org.apache.poi.ss.util.*;
import java.io.*;
import java.nio.file.*;
import java.util.*;

public class ExportCobiCsv {
    public static void main(String[] args) throws Exception {
        String path = args[0];
        String outDir = (args.length > 1) ? args[1] : "doc/extracted_images";
        new File(outDir).mkdirs();

        try (FileInputStream fis = new FileInputStream(path);
             XSSFWorkbook wb = new XSSFWorkbook(fis)) {

            XSSFSheet sheet = wb.getSheetAt(0);
            Map<Integer, Map<Integer, String>> rowColImageMap = new HashMap<>();
            int imageCounter = 0;

            XSSFDrawing drawing = sheet.getDrawingPatriarch();
            if (drawing != null) {
                for (XSSFShape shape : drawing.getShapes()) {
                    if (shape instanceof XSSFPicture) {
                        XSSFPicture pic = (XSSFPicture) shape;
                        XSSFClientAnchor anchor = (XSSFClientAnchor) pic.getAnchor();
                        int col = anchor.getCol1();
                        int row = anchor.getRow1();
                        imageCounter++;
                        String ext = "png";
                        int picType = pic.getPictureData().getPictureType();
                        if (picType == Workbook.PICTURE_TYPE_JPEG) ext = "jpg";
                        // Save with cell reference for deterministic naming:
                        String ref = CellReference.convertNumToColString(col) + (row + 1);
                        String fileName = "img_" + ref + "." + ext;
                        Path filePath = Paths.get(outDir, fileName);
                        Files.write(filePath, pic.getPictureData().getData());
                        rowColImageMap.computeIfAbsent(row, r -> new HashMap<>()).put(col, outDir + "/" + fileName);
                    }
                }
            }

            // Print CSV of product data: all rows starting from header row 9 (0-based), skip section headers, include image path col0
            PrintWriter csv = new PrintWriter(new OutputStreamWriter(Files.newOutputStream(Paths.get(outDir, "cobi_products.csv")), "UTF-8"));
            csv.println("image,collection,index_code,description,barcode,purchase_price_eur,currency,master_carton_pcs,box_type,box_gross_volume_m3,master_carton_gross_volume_m3,box_gross_weight_kg,master_carton_gross_weight_kg,total_mcv_m3,total_mcw_kg,total_mc_qty,rrp_text,availability,excel_row_0based");

            int lastRow = sheet.getLastRowNum();
            int dataRows = 0;
            for (int r = 10; r <= lastRow; r++) { // skip header (r=9)
                Row row = sheet.getRow(r);
                // Column B = collection, Column C = index_code
                String index = "", collection = "";
                if (row != null) {
                    collection = toString(row.getCell(1));
                    index = toString(row.getCell(2));
                }
                // If no index AND no image in col A, likely a section header row -> skip
                String imgPath = (rowColImageMap.containsKey(r) && rowColImageMap.get(r).containsKey(0)) ?
                        rowColImageMap.get(r).get(0) : "";
                if ((index == null || index.trim().isEmpty() || "<null>".equals(index) || index.trim().startsWith("\"\"")) && imgPath.isEmpty()) continue;

                String desc = row != null ? toString(row.getCell(3)) : "";
                String barcode = row != null ? toString(row.getCell(4)) : "";
                String purchase = row != null ? toNum(row.getCell(5)) : "";
                String currency = row != null ? toString(row.getCell(6)) : "";
                String mcPcs = row != null ? toNum(row.getCell(8)) : "";
                String boxType = row != null ? toString(row.getCell(9)) : "";
                String bv = row != null ? toNum(row.getCell(10)) : "";
                String mcv = row != null ? toNum(row.getCell(11)) : "";
                String bw = row != null ? toNum(row.getCell(12)) : "";
                String mcw = row != null ? toNum(row.getCell(13)) : "";
                String tVol = row != null ? toNum(row.getCell(14)) : "";
                String tWt = row != null ? toNum(row.getCell(15)) : "";
                String tQty = row != null ? toNum(row.getCell(16)) : "";
                String rrp = row != null ? toString(row.getCell(17)) : "";
                String avail = row != null ? toString(row.getCell(18)) : "";

                csv.println(csvq(imgPath) + "," + csvq(collection) + "," + csvq(index) + ","
                        + csvq(desc) + "," + csvq(barcode) + "," + csvq(purchase) + "," + csvq(currency)
                        + "," + csvq(mcPcs) + "," + csvq(boxType) + "," + csvq(bv) + "," + csvq(mcv)
                        + "," + csvq(bw) + "," + csvq(mcw) + "," + csvq(tVol) + "," + csvq(tWt) + ","
                        + csvq(tQty) + "," + csvq(rrp) + "," + csvq(avail) + "," + r);
                dataRows++;
            }
            csv.close();
            System.out.println("CSV rows written: " + dataRows + " to " + outDir + "/cobi_products.csv");
        }
    }
    static String csvq(String s) {
        if (s == null) return "";
        if (s.startsWith("\"") && s.endsWith("\"") && s.length() > 1) {
            s = s.substring(1, s.length() - 1);
        }
        if (s.contains(",") || s.contains("\"") || s.contains("\n") || s.contains("\r")) {
            s = "\"" + s.replace("\"", "\"\"") + "\"";
        }
        return s;
    }
    static String toNum(Cell cell) {
        if (cell == null) return "";
        CellType t = cell.getCellType();
        if (t == CellType.FORMULA) {
            try { return String.valueOf(cell.getNumericCellValue()); }
            catch (Exception e) {
                String s = toString(cell);
                return s.replaceAll("[^0-9,.\\-]", "");
            }
        }
        if (t == CellType.NUMERIC) return String.valueOf(cell.getNumericCellValue());
        if (t == CellType.STRING) {
            String s = cell.getStringCellValue().trim();
            if (s.isEmpty()) return "";
            // replace comma decimal with dot
            s = s.replace(",", ".");
            return s;
        }
        return "";
    }
    static String toString(Cell cell) {
        if (cell == null) return "";
        switch (cell.getCellType()) {
            case STRING: return cell.getStringCellValue().replace("\n", "\\n").replace("\r", "");
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) return cell.getDateCellValue().toString();
                double d = cell.getNumericCellValue();
                if (d == Math.floor(d)) return String.valueOf((long) d);
                return String.valueOf(d);
            case BOOLEAN: return String.valueOf(cell.getBooleanCellValue());
            case FORMULA:
                try { return cell.getStringCellValue(); }
                catch (Exception e) { try { return String.valueOf(cell.getNumericCellValue()); }
                    catch (Exception e2) { return ""; } }
            case BLANK: return "";
            default: return "";
        }
    }
}
