package com.windwah.inventory.controller.rest;

import com.windwah.inventory.export.AmazonExcelExporter;
import com.windwah.inventory.export.EbayExcelExporter;
import com.windwah.inventory.entity.Product;
import com.windwah.inventory.service.ProductService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/export")
public class ExportRestController {

    private static final String XLSX_MEDIA_TYPE =
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

    private final ProductService productService;
    private final AmazonExcelExporter amazonExporter;
    private final EbayExcelExporter ebayExporter;

    public ExportRestController(ProductService productService,
                                AmazonExcelExporter amazonExporter,
                                EbayExcelExporter ebayExporter) {
        this.productService = productService;
        this.amazonExporter = amazonExporter;
        this.ebayExporter = ebayExporter;
    }

    @GetMapping("/amazon")
    public ResponseEntity<byte[]> amazon(@RequestParam(required = false) List<Long> ids) {
        List<Product> products = productService.findAllByIdIn(ids);
        byte[] bytes = amazonExporter.toBytes(products);
        String filename = "amazon-inventory-" + LocalDate.now() + ".xlsx";
        return xlsx(bytes, filename);
    }

    @GetMapping("/ebay")
    public ResponseEntity<byte[]> ebay(@RequestParam(required = false) List<Long> ids) {
        List<Product> products = productService.findAllByIdIn(ids);
        byte[] bytes = ebayExporter.toBytes(products);
        String filename = "ebay-inventory-" + LocalDate.now() + ".xlsx";
        return xlsx(bytes, filename);
    }

    private ResponseEntity<byte[]> xlsx(byte[] bytes, String filename) {
        String encoded = URLEncoder.encode(filename, StandardCharsets.UTF_8);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=\"" + filename + "\"; filename*=UTF-8''" + encoded)
                .contentType(MediaType.parseMediaType(XLSX_MEDIA_TYPE))
                .contentLength(bytes.length)
                .body(bytes);
    }
}
