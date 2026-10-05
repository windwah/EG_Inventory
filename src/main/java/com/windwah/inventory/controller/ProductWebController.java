package com.windwah.inventory.controller;

import com.windwah.inventory.dto.ProductCreateRequest;
import com.windwah.inventory.dto.ProductUpdateRequest;
import com.windwah.inventory.entity.Brand;
import com.windwah.inventory.entity.Manufacturer;
import com.windwah.inventory.entity.Product;
import com.windwah.inventory.exception.ResourceNotFoundException;
import com.windwah.inventory.service.BrandService;
import com.windwah.inventory.service.ManufacturerService;
import com.windwah.inventory.service.ProductService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping
public class ProductWebController {

    private final ProductService productService;
    private final BrandService brandService;
    private final ManufacturerService manufacturerService;

    public ProductWebController(ProductService productService,
                                BrandService brandService,
                                ManufacturerService manufacturerService) {
        this.productService = productService;
        this.brandService = brandService;
        this.manufacturerService = manufacturerService;
    }

    @GetMapping("/")
    public String home() {
        return "redirect:/products";
    }

    @GetMapping("/products")
    public String list(Model model) {
        List<Product> products = productService.findAll();
        model.addAttribute("products", products);
        return "products/list";
    }

    @GetMapping("/products/new")
    public String newForm(Model model) {
        addBrandAndManufacturerOptions(model);
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
        Product saved;
        try {
            saved = productService.create(request);
        } catch (RuntimeException ex) {
            ra.addFlashAttribute("error", ex.getMessage());
            ra.addFlashAttribute("org.springframework.validation.BindingResult.product", binding);
            ra.addFlashAttribute("product", request);
            return "redirect:/products/new";
        }
        ra.addFlashAttribute("info", "Product created: " + saved.getSku());
        return "redirect:/products";
    }

    @GetMapping("/products/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        addBrandAndManufacturerOptions(model);
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
            req.setBrandId(p.getBrand() != null ? p.getBrand().getId() : null);
            req.setManufacturerId(p.getManufacturer() != null ? p.getManufacturer().getId() : null);
            req.setCategory(p.getCategory());
            req.setCondition(p.getCondition());
            req.setImageUrls(p.getImageUrls());
            req.setWeightKg(p.getWeightKg());
            req.setDimensions(p.getDimensions());
            req.setListingStatus(p.getListingStatus());
            req.setCollection(p.getCollection());
            req.setIndexCode(p.getIndexCode());
            req.setPurchasePrice(p.getPurchasePrice());
            req.setMasterCartonPcs(p.getMasterCartonPcs());
            req.setBoxType(p.getBoxType());
            req.setBoxGrossVolumeM3(p.getBoxGrossVolumeM3());
            req.setMasterCartonGrossVolumeM3(p.getMasterCartonGrossVolumeM3());
            req.setBoxGrossWeightKg(p.getBoxGrossWeightKg());
            req.setMasterCartonGrossWeightKg(p.getMasterCartonGrossWeightKg());
            req.setTotalMasterCartonVolumeM3(p.getTotalMasterCartonVolumeM3());
            req.setTotalMasterCartonWeightKg(p.getTotalMasterCartonWeightKg());
            req.setTotalMasterCartonQty(p.getTotalMasterCartonQty());
            req.setRrpEur(p.getRrpEur());
            req.setRrpText(p.getRrpText());
            req.setAvailability(p.getAvailability());
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
        Product updated;
        try {
            updated = productService.update(id, request);
        } catch (RuntimeException ex) {
            ra.addFlashAttribute("error", ex.getMessage());
            ra.addFlashAttribute("org.springframework.validation.BindingResult.product", binding);
            ra.addFlashAttribute("product", request);
            return "redirect:/products/" + id + "/edit";
        }
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

    private void addBrandAndManufacturerOptions(Model model) {
        List<Brand> brands = brandService.findAll();
        List<Manufacturer> manufacturers = manufacturerService.findAll();
        model.addAttribute("brands", brands);
        model.addAttribute("manufacturers", manufacturers);
    }
}
