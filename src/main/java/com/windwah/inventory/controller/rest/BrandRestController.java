package com.windwah.inventory.controller.rest;

import com.windwah.inventory.entity.Brand;
import com.windwah.inventory.service.BrandService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/brands")
public class BrandRestController {

    private final BrandService brandService;

    public BrandRestController(BrandService brandService) {
        this.brandService = brandService;
    }

    @GetMapping
    public List<Map<String, Object>> list() {
        return brandService.findAll().stream().map(this::toView).toList();
    }

    @GetMapping("/{id}")
    public Map<String, Object> get(@PathVariable Long id) {
        return toView(brandService.getById(id));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Map<String, Object> create(@Valid @RequestBody BrandPayload payload) {
        return toView(brandService.create(
                payload.name,
                payload.amazonBrandStoreUrl,
                payload.logoUrl,
                payload.description
        ));
    }

    @PutMapping("/{id}")
    public Map<String, Object> update(@PathVariable Long id,
                                      @Valid @RequestBody BrandPayload payload) {
        return toView(brandService.update(id,
                payload.name,
                payload.amazonBrandStoreUrl,
                payload.logoUrl,
                payload.description));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        brandService.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    private Map<String, Object> toView(Brand b) {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("id", b.getId());
        m.put("name", b.getName());
        m.put("amazonBrandStoreUrl", b.getAmazonBrandStoreUrl());
        m.put("logoUrl", b.getLogoUrl());
        m.put("description", b.getDescription());
        m.put("createdAt", b.getCreatedAt() != null ? b.getCreatedAt().toString() : null);
        m.put("updatedAt", b.getUpdatedAt() != null ? b.getUpdatedAt().toString() : null);
        return m;
    }

    public static class BrandPayload {
        @NotBlank(message = "Brand name must not be blank")
        @Size(max = 128, message = "Brand name must not exceed 128 characters")
        public String name;

        @Size(max = 255)
        public String amazonBrandStoreUrl;

        @Size(max = 2048)
        public String logoUrl;

        @Size(max = 2000)
        public String description;
    }
}
