import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;
import org.apache.poi.ss.util.*;
import java.io.*;
import java.nio.file.*;
import java.util.*;

public class ReadFullXlsx {
    public static void main(String[] args) throws Exception {
        String path = args[0];
        String outDir = (args.length > 1) ? args[1] : "doc/extracted_images";
        new File(outDir).mkdirs();

        try (FileInputStream fis = new FileInputStream(path);
             XSSFWorkbook wb = new XSSFWorkbook(fis)) {

            XSSFSheet sheet = wb.getSheetAt(0);
            Map<String, String> cellImageMap = new LinkedHashMap<>();
            Map<Integer, Map<Integer, String>> rowColImageMap = new HashMap<>();

            XSSFDrawing drawing = sheet.getDrawingPatriarch();
            int imageCounter = 0;
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
                        String fileName = "image_" + imageCounter + "." + ext;
                        Path filePath = Paths.get(outDir, fileName);
                        Files.write(filePath, pic.getPictureData().getData());
                        String cellRef = CellReference.convertNumToColString(col) + (row + 1);
                        cellImageMap.put(cellRef, outDir + "/" + fileName);
                        rowColImageMap.computeIfAbsent(row, r -> new HashMap<>()).put(col, outDir + "/" + fileName);
                    }
                }
            }

            // Print row summary: first 200 rows, non-empty, with which columns are filled
            int lastRow = sheet.getLastRowNum();
            int lastCol = 0;
            for (int r = 0; r <= lastRow; r++) {
                Row row = sheet.getRow(r);
                if (row != null) lastCol = Math.max(lastCol, row.getLastCellNum() - 1);
            }
            System.out.println("TOTAL rows (0-based lastRow): " + lastRow + " TOTAL cols: " + (lastCol + 1) + " TOTAL images: " + imageCounter);

            // Print every row 0..200 with all columns
            for (int r = 0; r <= Math.min(lastRow, 250); r++) {
                Row row = sheet.getRow(r);
                boolean hasAny = rowColImageMap.containsKey(r);
                if (!hasAny) {
                    if (row == null) continue;
                    for (int c = 0; c <= lastCol; c++) {
                        Cell cell = row.getCell(c);
                        if (cell != null && cell.getCellType() != CellType.BLANK) {
                            String s = toString(cell);
                            if (s != null && !s.trim().isEmpty() && !"<null>".equals(s)) { hasAny = true; break; }
                        }
                    }
                }
                if (!hasAny) continue;
                System.out.println("====== ROW " + r + " (Excel: " + (r+1) + ") ======");
                // Determine last non-empty col in this row
                int lastColRow = -1;
                if (row != null) lastColRow = row.getLastCellNum() - 1;
                if (rowColImageMap.containsKey(r)) {
                    for (int c : rowColImageMap.get(r).keySet()) if (c > lastColRow) lastColRow = c;
                }
                for (int c = 0; c <= Math.min(lastCol, lastColRow); c++) {
                    String value = "";
                    if (row != null) value = toString(row.getCell(c));
                    String img = "";
                    if (rowColImageMap.containsKey(r) && rowColImageMap.get(r).containsKey(c)) {
                        img = " (+IMG: " + rowColImageMap.get(r).get(c) + ")";
                    }
                    if ((value == null || "<null>".equals(value) || value.isEmpty()) && img.isEmpty()) continue;
                    String colLetter = CellReference.convertNumToColString(c);
                    System.out.println("  [" + c + "=" + colLetter + "] " + value + img);
                }
            }
        }
    }

    private static String toString(Cell cell) {
        if (cell == null) return "<null>";
        switch (cell.getCellType()) {
            case STRING:
                return "\"" + cell.getStringCellValue().replace("\n", "\\n").replace("\r", "") + "\"";
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) return cell.getDateCellValue().toString();
                double d = cell.getNumericCellValue();
                if (d == Math.floor(d)) return String.valueOf((long) d);
                return String.valueOf(d);
            case BOOLEAN: return String.valueOf(cell.getBooleanCellValue());
            case FORMULA:
                try { return "FORMULA:" + cell.getStringCellValue(); }
                catch (Exception e) { try { return "FORMULA#:" + cell.getNumericCellValue(); }
                    catch (Exception e2) { return "FORMULA?"; } }
            case BLANK: return "";
            default: return cell.toString();
        }
    }
}
