package com.windwah.inventory.export;

import com.windwah.inventory.config.EbayExportProperties;
import com.windwah.inventory.entity.Condition;
import com.windwah.inventory.entity.Product;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.util.List;

@Service
public class EbayExcelExporter {

    public static final String[] HEADERS = {
            "Action",
            "SKU",
            "Title",
            "Description",
            "Start Price",
            "Quantity",
            "Condition ID",
            "Brand",
            "MPN",
            "UPC",
            "Primary Category ID",
            "Picture URLs",
            "Item Location",
            "Postal Code",
            "Country",
            "Shipping Profile"
    };

    private final EbayExportProperties properties;

    public EbayExcelExporter(EbayExportProperties properties) {
        this.properties = properties;
    }

    public byte[] toBytes(List<Product> products) {
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            write(products, baos);
            return baos.toByteArray();
        } catch (IOException e) {
            throw new IllegalStateException("Failed to write eBay Excel export", e);
        }
    }

    public void write(List<Product> products, OutputStream out) throws IOException {
        try (SXSSFWorkbook workbook = new SXSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("eBay Inventory");
            Row headerRow = sheet.createRow(0);
            for (int i = 0; i < HEADERS.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(HEADERS[i]);
            }

            int rowIdx = 1;
            for (Product p : products) {
                Row row = sheet.createRow(rowIdx++);
                int col = 0;
                setText(row, col++, defaultEmpty(properties.getDefaultAction(), "Add"));
                setText(row, col++, nullSafe(p.getSku()));
                setText(row, col++, nullSafe(p.getTitle()));
                setText(row, col++, nullSafe(p.getDescription()));
                setDecimal(row, col++, p.getPrice());
                setInt(row, col++, p.getQuantity());
                setText(row, col++, conditionToEbayId(p.getCondition()));
                setText(row, col++, nullSafe(p.getBrand()));
                setText(row, col++, nullSafe(p.getMpn()));
                setText(row, col++, nullSafe(p.getUpc()));
                setText(row, col++, defaultEmpty(properties.getDefaultCategoryId(), ""));
                setText(row, col++, nullSafe(p.getImageUrls()));
                setText(row, col++, defaultEmpty(properties.getItemLocation(), ""));
                setText(row, col++, defaultEmpty(properties.getPostalCode(), ""));
                setText(row, col++, defaultEmpty(properties.getCountry(), ""));
                setText(row, col, defaultEmpty(properties.getShippingProfile(), ""));
            }

            for (int i = 0; i < HEADERS.length; i++) {
                sheet.setColumnWidth(i, 18 * 256);
            }

            workbook.write(out);
            workbook.dispose();
        }
    }

    static String conditionToEbayId(Condition c) {
        if (c == null) return "1000";
        return switch (c) {
            case NEW -> "1000";
            case USED_LIKE_NEW -> "3000";
            case USED_VERY_GOOD -> "4000";
            case USED_GOOD -> "5000";
            case ACCEPTABLE -> "6000";
        };
    }

    private static String nullSafe(String s) {
        return s == null ? "" : s;
    }

    private static String defaultEmpty(String s, String fallback) {
        if (s == null || s.isBlank()) return fallback;
        return s;
    }

    private static void setText(Row row, int col, String value) {
        Cell cell = row.createCell(col);
        cell.setCellValue(value);
    }

    private static void setInt(Row row, int col, Integer value) {
        Cell cell = row.createCell(col);
        cell.setCellValue(value == null ? 0 : value);
    }

    private static void setDecimal(Row row, int col, BigDecimal value) {
        Cell cell = row.createCell(col);
        cell.setCellValue(value == null ? 0.0 : value.doubleValue());
    }
}
