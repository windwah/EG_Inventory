package com.windwah.inventory.controller.rest;

import com.windwah.inventory.entity.Product;
import com.windwah.inventory.integration.AmazonSpApiClient;
import com.windwah.inventory.integration.EbayApiClient;
import com.windwah.inventory.integration.SubmissionResult;
import com.windwah.inventory.service.ProductService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/submit")
public class SubmitRestController {

    private final ProductService productService;
    private final AmazonSpApiClient amazonClient;
    private final EbayApiClient ebayClient;

    public SubmitRestController(ProductService productService,
                                AmazonSpApiClient amazonClient,
                                EbayApiClient ebayClient) {
        this.productService = productService;
        this.amazonClient = amazonClient;
        this.ebayClient = ebayClient;
    }

    @PostMapping("/amazon")
    public ResponseEntity<SubmissionResult> submitAmazon(@RequestParam(required = false) List<Long> ids) {
        List<Product> products = productService.findAllByIdIn(ids);
        return ResponseEntity.ok(amazonClient.submitInventory(products));
    }

    @PostMapping("/ebay")
    public ResponseEntity<SubmissionResult> submitEbay(@RequestParam(required = false) List<Long> ids) {
        List<Product> products = productService.findAllByIdIn(ids);
        return ResponseEntity.ok(ebayClient.submitInventory(products));
    }
}
