package com.windwah.inventory.controller;

import com.windwah.inventory.export.AmazonExcelExporter;
import com.windwah.inventory.export.EbayExcelExporter;
import com.windwah.inventory.entity.Product;
import com.windwah.inventory.service.ProductService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/export")
public class ExportWebController {

    private final ProductService productService;
    private final AmazonExcelExporter amazonExporter;
    private final EbayExcelExporter ebayExporter;

    public ExportWebController(ProductService productService,
                               AmazonExcelExporter amazonExporter,
                               EbayExcelExporter ebayExporter) {
        this.productService = productService;
        this.amazonExporter = amazonExporter;
        this.ebayExporter = ebayExporter;
    }

    @GetMapping
    public String exportPage(Model model) {
        model.addAttribute("products", productService.findAll());
        return "export/page";
    }

    @GetMapping("/amazon")
    public ResponseEntity<byte[]> exportAmazon(@RequestParam(required = false) List<Long> ids) {
        List<Product> products = productService.findAllByIdIn(ids);
        byte[] bytes = amazonExporter.toBytes(products);
        String filename = "amazon-inventory-" + LocalDate.now() + ".xlsx";
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=\"" + filename + "\"; filename*=UTF-8''"
                                + URLEncoder.encode(filename, StandardCharsets.UTF_8))
                .contentType(MediaType.parseMediaType(
                        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .body(bytes);
    }

    @GetMapping("/ebay")
    public ResponseEntity<byte[]> exportEbay(@RequestParam(required = false) List<Long> ids) {
        List<Product> products = productService.findAllByIdIn(ids);
        byte[] bytes = ebayExporter.toBytes(products);
        String filename = "ebay-inventory-" + LocalDate.now() + ".xlsx";
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=\"" + filename + "\"; filename*=UTF-8''"
                                + URLEncoder.encode(filename, StandardCharsets.UTF_8))
                .contentType(MediaType.parseMediaType(
                        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .body(bytes);
    }
}
