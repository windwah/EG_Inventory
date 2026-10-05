package com.windwah.inventory.controller;

import com.windwah.inventory.entity.Brand;
import com.windwah.inventory.exception.DuplicateBrandNameException;
import com.windwah.inventory.exception.ResourceNotFoundException;
import com.windwah.inventory.service.BrandService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/brands")
public class BrandWebController {

    private final BrandService brandService;

    public BrandWebController(BrandService brandService) {
        this.brandService = brandService;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("brands", brandService.findAll());
        return "brands/list";
    }

    @GetMapping("/new")
    public String newForm(Model model) {
        if (!model.containsAttribute("form")) {
            model.addAttribute("form", new BrandForm());
        }
        return "brands/form";
    }

    @PostMapping
    public String create(@Valid @ModelAttribute("form") BrandForm form,
                         BindingResult binding,
                         RedirectAttributes ra) {
        if (binding.hasErrors()) {
            ra.addFlashAttribute("org.springframework.validation.BindingResult.form", binding);
            ra.addFlashAttribute("form", form);
            return "redirect:/brands/new";
        }
        try {
            Brand saved = brandService.create(
                    form.getName(),
                    form.getAmazonBrandStoreUrl(),
                    form.getLogoUrl(),
                    form.getDescription()
            );
            ra.addFlashAttribute("info", "Brand created: " + saved.getName());
            return "redirect:/brands";
        } catch (DuplicateBrandNameException ex) {
            binding.rejectValue("name", "duplicate", ex.getMessage());
            ra.addFlashAttribute("org.springframework.validation.BindingResult.form", binding);
            ra.addFlashAttribute("form", form);
            return "redirect:/brands/new";
        }
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        Brand b = brandService.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Brand", id));
        if (!model.containsAttribute("form")) {
            BrandForm f = new BrandForm();
            f.setName(b.getName());
            f.setAmazonBrandStoreUrl(b.getAmazonBrandStoreUrl());
            f.setLogoUrl(b.getLogoUrl());
            f.setDescription(b.getDescription());
            model.addAttribute("form", f);
            model.addAttribute("id", id);
        }
        return "brands/form";
    }

    @PostMapping("/{id}/edit")
    public String update(@PathVariable Long id,
                       @Valid @ModelAttribute("form") BrandForm form,
                       BindingResult binding,
                       RedirectAttributes ra) {
        if (binding.hasErrors()) {
            ra.addFlashAttribute("org.springframework.validation.BindingResult.form", binding);
            ra.addFlashAttribute("form", form);
            return "redirect:/brands/" + id + "/edit";
        }
        try {
            Brand saved = brandService.update(id,
                    form.getName(),
                    form.getAmazonBrandStoreUrl(),
                    form.getLogoUrl(),
                    form.getDescription());
            ra.addFlashAttribute("info", "Brand updated: " + saved.getName());
            return "redirect:/brands";
        } catch (DuplicateBrandNameException ex) {
            binding.rejectValue("name", "duplicate", ex.getMessage());
            ra.addFlashAttribute("org.springframework.validation.BindingResult.form", binding);
            ra.addFlashAttribute("form", form);
            return "redirect:/brands/" + id + "/edit";
        }
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id, RedirectAttributes ra) {
        String name = brandService.findById(id).map(Brand::getName).orElse("#" + id);
        brandService.deleteById(id);
        ra.addFlashAttribute("info", "Brand deleted: " + name);
        return "redirect:/brands";
    }

    public static class BrandForm {
        @NotBlank(message = "Brand name must not be blank")
        @Size(max = 128, message = "Brand name must not exceed 128 characters")
        private String name;

        @Size(max = 255, message = "Amazon Brand Store URL must not exceed 255 characters")
        private String amazonBrandStoreUrl;

        @Size(max = 2048, message = "Logo URL must not exceed 2048 characters")
        private String logoUrl;

        @Size(max = 2000, message = "Description must not exceed 2000 characters")
        private String description;

        public String getName() { return name; }
        public void setName(String name) { this.name = name; }

        public String getAmazonBrandStoreUrl() { return amazonBrandStoreUrl; }
        public void setAmazonBrandStoreUrl(String amazonBrandStoreUrl) { this.amazonBrandStoreUrl = amazonBrandStoreUrl; }

        public String getLogoUrl() { return logoUrl; }
        public void setLogoUrl(String logoUrl) { this.logoUrl = logoUrl; }

        public String getDescription() { return description; }
        public void setDescription(String description) { this.description = description; }
    }
}
