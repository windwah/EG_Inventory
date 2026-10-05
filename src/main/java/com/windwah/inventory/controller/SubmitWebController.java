package com.windwah.inventory.controller;

import com.windwah.inventory.entity.Product;
import com.windwah.inventory.integration.AmazonSpApiClient;
import com.windwah.inventory.integration.EbayApiClient;
import com.windwah.inventory.integration.SubmissionResult;
import com.windwah.inventory.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/submit")
public class SubmitWebController {

    private final ProductService productService;
    private final AmazonSpApiClient amazonClient;
    private final EbayApiClient ebayClient;

    public SubmitWebController(ProductService productService,
                               AmazonSpApiClient amazonClient,
                               EbayApiClient ebayClient) {
        this.productService = productService;
        this.amazonClient = amazonClient;
        this.ebayClient = ebayClient;
    }

    @PostMapping("/amazon")
    public String amazon(@RequestParam(required = false) List<Long> ids,
                         RedirectAttributes ra) {
        List<Product> products = productService.findAllByIdIn(ids);
        SubmissionResult result = amazonClient.submitInventory(products);
        ra.addFlashAttribute("result", result);
        ra.addFlashAttribute("info", "Amazon submission completed in " + result.getMode() + " mode.");
        return "redirect:/export";
    }

    @PostMapping("/ebay")
    public String ebay(@RequestParam(required = false) List<Long> ids,
                       RedirectAttributes ra) {
        List<Product> products = productService.findAllByIdIn(ids);
        SubmissionResult result = ebayClient.submitInventory(products);
        ra.addFlashAttribute("result", result);
        ra.addFlashAttribute("info", "eBay submission completed in " + result.getMode() + " mode.");
        return "redirect:/export";
    }
}
