package com.windwah.inventory.export;

import com.windwah.inventory.config.EbayExportProperties;
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

class EbayExcelExporterTest {

    private final EbayExcelExporter exporter = new EbayExcelExporter(new EbayExportProperties());

    @Test
    void headerRow_matchesRequiredColumns() throws IOException {
        byte[] bytes = exporter.toBytes(List.of());
        try (Workbook wb = new XSSFWorkbook(new ByteArrayInputStream(bytes))) {
            Sheet sheet = wb.getSheetAt(0);
            Row header = sheet.getRow(0);
            for (int i = 0; i < EbayExcelExporter.HEADERS.length; i++) {
                assertThat(header.getCell(i).getStringCellValue())
                        .isEqualTo(EbayExcelExporter.HEADERS[i]);
            }
        }
    }

    @Test
    void twoProducts_producesTwoDataRowsAndDefaultAction() throws IOException {
        Product a = build("E-SKU-1", "Title 1", 1, new BigDecimal("99.99"), Condition.NEW);
        Product b = build("E-SKU-2", "Title 2", 5, new BigDecimal("15.00"), Condition.USED_VERY_GOOD);

        byte[] bytes = exporter.toBytes(List.of(a, b));
        try (Workbook wb = new XSSFWorkbook(new ByteArrayInputStream(bytes))) {
            Sheet sheet = wb.getSheetAt(0);
            assertThat(sheet.getLastRowNum()).isEqualTo(2);

            Row r1 = sheet.getRow(1);
            assertThat(r1.getCell(0).getStringCellValue()).isEqualTo("Add");
            assertThat(r1.getCell(1).getStringCellValue()).isEqualTo("E-SKU-1");
            assertThat(r1.getCell(4).getNumericCellValue()).isCloseTo(99.99, org.assertj.core.data.Offset.offset(0.001));
            assertThat(r1.getCell(6).getStringCellValue()).isEqualTo("1000");

            Row r2 = sheet.getRow(2);
            assertThat(r2.getCell(1).getStringCellValue()).isEqualTo("E-SKU-2");
            assertThat((int) r2.getCell(5).getNumericCellValue()).isEqualTo(5);
            assertThat(r2.getCell(6).getStringCellValue()).isEqualTo("4000");
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
