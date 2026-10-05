package com.windwah.inventory.controller;

import com.windwah.inventory.dto.ProductCreateRequest;
import com.windwah.inventory.dto.ProductUpdateRequest;
import com.windwah.inventory.entity.Product;
import com.windwah.inventory.exception.ResourceNotFoundException;
import com.windwah.inventory.service.ProductService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping
public class ProductWebController {

    private final ProductService productService;

    public ProductWebController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String home() {
        return "redirect:/products";
    }

    @GetMapping("/products")
    public String list(Model model) {
        model.addAttribute("products", productService.findAll());
        return "products/list";
    }

    @GetMapping("/products/new")
    public String newForm(Model model) {
        if (!model.containsAttribute("product")) {
            ProductCreateRequest empty = new ProductCreateRequest();
            empty.setQuantity(0);
            model.addAttribute("product", empty);
        }
        return "products/form";
    }

    @PostMapping("/products")
    public String create(@Valid @ModelAttribute("product") ProductCreateRequest request,
                         BindingResult binding,
                         RedirectAttributes ra) {
        if (binding.hasErrors()) {
            ra.addFlashAttribute("org.springframework.validation.BindingResult.product", binding);
            ra.addFlashAttribute("product", request);
            return "redirect:/products/new";
        }
        Product saved = productService.create(request);
        ra.addFlashAttribute("info", "Product created: " + saved.getSku());
        return "redirect:/products";
    }

    @GetMapping("/products/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        Product p = productService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product", id));
        if (!model.containsAttribute("product")) {
            ProductUpdateRequest req = new ProductUpdateRequest();
            req.setTitle(p.getTitle());
            req.setDescription(p.getDescription());
            req.setQuantity(p.getQuantity());
            req.setPrice(p.getPrice());
            req.setCurrency(p.getCurrency());
            req.setUpc(p.getUpc());
            req.setEan(p.getEan());
            req.setMpn(p.getMpn());
            req.setBrand(p.getBrand());
            req.setManufacturer(p.getManufacturer());
            req.setCategory(p.getCategory());
            req.setCondition(p.getCondition());
            req.setImageUrls(p.getImageUrls());
            req.setWeightKg(p.getWeightKg());
            req.setDimensions(p.getDimensions());
            req.setListingStatus(p.getListingStatus());
            model.addAttribute("product", req);
            model.addAttribute("sku", p.getSku());
            model.addAttribute("id", id);
        }
        return "products/form";
    }

    @PostMapping("/products/{id}/edit")
    public String update(@PathVariable Long id,
                         @Valid @ModelAttribute("product") ProductUpdateRequest request,
                         BindingResult binding,
                         RedirectAttributes ra) {
        if (binding.hasErrors()) {
            ra.addFlashAttribute("org.springframework.validation.BindingResult.product", binding);
            ra.addFlashAttribute("product", request);
            return "redirect:/products/" + id + "/edit";
        }
        Product updated = productService.update(id, request);
        ra.addFlashAttribute("info", "Product updated: " + updated.getSku());
        return "redirect:/products";
    }

    @PostMapping("/products/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes ra) {
        String sku = productService.findById(id).map(Product::getSku).orElse("#" + id);
        productService.deleteById(id);
        ra.addFlashAttribute("info", "Product deleted: " + sku);
        return "redirect:/products";
    }
}
