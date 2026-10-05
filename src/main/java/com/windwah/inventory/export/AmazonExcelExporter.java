package com.windwah.inventory.export;

import com.windwah.inventory.config.AmazonExportProperties;
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
public class AmazonExcelExporter {

    public static final String[] HEADERS = {
            "SKU",
            "Product Name",
            "Manufacturer",
            "Brand",
            "UPC",
            "EAN",
            "Quantity",
            "Price",
            "Currency",
            "Condition",
            "Description",
            "Category",
            "Image URLs"
    };

    private final AmazonExportProperties properties;

    public AmazonExcelExporter(AmazonExportProperties properties) {
        this.properties = properties;
    }

    public byte[] toBytes(List<Product> products) {
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            write(products, baos);
            return baos.toByteArray();
        } catch (IOException e) {
            throw new IllegalStateException("Failed to write Amazon Excel export", e);
        }
    }

    public void write(List<Product> products, OutputStream out) throws IOException {
        try (SXSSFWorkbook workbook = new SXSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Amazon Inventory");
            Row headerRow = sheet.createRow(0);
            for (int i = 0; i < HEADERS.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(HEADERS[i]);
            }

            int rowIdx = 1;
            for (Product p : products) {
                Row row = sheet.createRow(rowIdx++);
                int col = 0;
                setText(row, col++, nullSafe(p.getSku()));
                setText(row, col++, nullSafe(p.getTitle()));
                setText(row, col++, nullSafe(p.getManufacturerName()));
                setText(row, col++, nullSafe(p.getBrandName()));
                setText(row, col++, nullSafe(p.getUpc()));
                setText(row, col++, nullSafe(p.getEan()));
                setInt(row, col++, p.getQuantity());
                setDecimal(row, col++, p.getPrice());
                setText(row, col++, currency(p.getCurrency()));
                setText(row, col++, conditionToAmazon(p.getCondition()));
                setText(row, col++, nullSafe(p.getDescription()));
                setText(row, col++, nullSafe(p.getCategory()));
                setText(row, col, nullSafe(p.getImageUrls()));
            }

            for (int i = 0; i < HEADERS.length; i++) {
                sheet.setColumnWidth(i, 18 * 256);
            }

            workbook.write(out);
            workbook.dispose();
        }
    }

    private String currency(String currency) {
        if (currency == null || currency.isBlank()) {
            return properties.getDefaultCurrency();
        }
        return currency;
    }

    static String conditionToAmazon(Condition c) {
        if (c == null) return "New";
        return switch (c) {
            case NEW -> "New";
            case USED_LIKE_NEW -> "Used - Like New";
            case USED_VERY_GOOD -> "Used - Very Good";
            case USED_GOOD -> "Used - Good";
            case ACCEPTABLE -> "Used - Acceptable";
        };
    }

    private static String nullSafe(String s) {
        return s == null ? "" : s;
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
