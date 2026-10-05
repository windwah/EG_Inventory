package com.windwah.inventory.export;

import com.windwah.inventory.config.AmazonExportProperties;
import com.windwah.inventory.entity.Condition;
import com.windwah.inventory.entity.Product;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.jupiter.api.Test;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

class AmazonExcelExporterTest {

    private final AmazonExcelExporter exporter = new AmazonExcelExporter(new AmazonExportProperties());

    @Test
    void headerRow_matchesRequiredColumns() throws IOException {
        byte[] bytes = exporter.toBytes(List.of());
        try (Workbook wb = new XSSFWorkbook(new ByteArrayInputStream(bytes))) {
            Sheet sheet = wb.getSheetAt(0);
            Row header = sheet.getRow(0);
            for (int i = 0; i < AmazonExcelExporter.HEADERS.length; i++) {
                assertThat(header.getCell(i).getStringCellValue())
                        .isEqualTo(AmazonExcelExporter.HEADERS[i]);
            }
        }
    }

    @Test
    void twoProducts_producesTwoDataRowsWithCorrectValues() throws IOException {
        Product a = build("SKU-A", "Product A", 3, new BigDecimal("5.99"), Condition.NEW);
        Product b = build("SKU-B", "Product B", 10, new BigDecimal("20.00"), Condition.USED_LIKE_NEW);

        byte[] bytes = exporter.toBytes(List.of(a, b));
        try (Workbook wb = new XSSFWorkbook(new ByteArrayInputStream(bytes))) {
            Sheet sheet = wb.getSheetAt(0);
            assertThat(sheet.getLastRowNum()).isEqualTo(2);

            Row r1 = sheet.getRow(1);
            assertThat(r1.getCell(0).getStringCellValue()).isEqualTo("SKU-A");
            assertThat((int) r1.getCell(6).getNumericCellValue()).isEqualTo(3);

            Row r2 = sheet.getRow(2);
            assertThat(r2.getCell(0).getStringCellValue()).isEqualTo("SKU-B");
            assertThat((int) r2.getCell(6).getNumericCellValue()).isEqualTo(10);
            assertThat(r2.getCell(9).getStringCellValue()).isEqualTo("Used - Like New");
        }
    }

    private static Product build(String sku, String title, int qty, BigDecimal price, Condition c) {
        Product p = new Product();
        p.setSku(sku);
        p.setTitle(title);
        p.setQuantity(qty);
        p.setPrice(price);
        p.setCondition(c);
        return p;
    }
}
