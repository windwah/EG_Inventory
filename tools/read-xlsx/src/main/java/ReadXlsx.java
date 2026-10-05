import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;
import org.apache.poi.ss.util.*;

import java.io.*;
import java.nio.file.*;
import java.util.*;

public class ReadXlsx {
    public static void main(String[] args) throws Exception {
        String path = args[0];
        String outDir = (args.length > 1) ? args[1] : "doc/extracted_images";
        new File(outDir).mkdirs();

        try (FileInputStream fis = new FileInputStream(path);
             XSSFWorkbook wb = new XSSFWorkbook(fis)) {

            XSSFSheet sheet = wb.getSheetAt(0);
            int imageCounter = 0;
            Map<String, String> cellImageMap = new LinkedHashMap<>();

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
                        String fileName = "image_" + imageCounter + "." + ext;
                        Path filePath = Paths.get(outDir, fileName);
                        Files.write(filePath, pic.getPictureData().getData());
                        String cellRef = CellReference.convertNumToColString(col) + (row + 1);
                        cellImageMap.put(cellRef, outDir + "/" + fileName);
                        System.out.println("IMG cell=" + cellRef + " -> " + filePath.toAbsolutePath());
                    }
                }
            }

            int lastRow = sheet.getLastRowNum();
            int lastCol = 0;
            for (int r = 0; r <= lastRow; r++) {
                Row row = sheet.getRow(r);
                if (row != null) lastCol = Math.max(lastCol, row.getLastCellNum() - 1);
            }

            System.out.println("HEADER row 0 (col count=" + (lastCol + 1) + "):");
            Row headerRow = sheet.getRow(0);
            if (headerRow != null) {
                for (int c = 0; c <= lastCol; c++) {
                    Cell cell = headerRow.getCell(c);
                    String ref = CellReference.convertNumToColString(c) + "1";
                    String img = cellImageMap.containsKey(ref) ? "  (+IMG: "+cellImageMap.get(ref)+")" : "";
                    System.out.println("  [col " + c + "=" + CellReference.convertNumToColString(c) + "] " + toString(cell) + img);
                }
            }

            int rowLimit = Math.min(lastRow, 20);
            System.out.println("FIRST DATA ROWS (1 to " + rowLimit + "):");
            for (int r = 1; r <= rowLimit; r++) {
                Row row = sheet.getRow(r);
                if (row == null) { System.out.println("row " + r + ": <empty>"); continue; }
                System.out.println("-- row " + r + " --");
                for (int c = 0; c <= lastCol; c++) {
                    Cell cell = row.getCell(c);
                    String ref = CellReference.convertNumToColString(c) + (r + 1);
                    String value = toString(cell);
                    String img = cellImageMap.containsKey(ref) ? "  (+IMG: "+cellImageMap.get(ref)+")" : "";
                    System.out.println("  [col " + c + "=" + CellReference.convertNumToColString(c) + "] " + value + img);
                }
            }
            System.out.println("TOTAL rows in sheet (including header): " + (lastRow + 1));
            System.out.println("TOTAL images extracted: " + imageCounter);
        }
    }

    private static String toString(Cell cell) {
        if (cell == null) return "<null>";
        switch (cell.getCellType()) {
            case STRING:
                return "\"" + cell.getStringCellValue().replace("\n", "\\n") + "\"";
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
