package com.windwah.inventory.controller.rest;

import com.windwah.inventory.dto.ProductCreateRequest;
import com.windwah.inventory.dto.ProductUpdateRequest;
import com.windwah.inventory.entity.Product;
import com.windwah.inventory.service.ProductService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/products")
public class ProductRestController {

    private final ProductService productService;

    public ProductRestController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping
    public List<Map<String, Object>> list() {
        return productService.findAll().stream()
                .map(this::toView)
                .toList();
    }

    @GetMapping("/{id}")
    public Map<String, Object> get(@PathVariable Long id) {
        return toView(productService.getById(id));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Map<String, Object> create(@Valid @RequestBody ProductCreateRequest request) {
        return toView(productService.create(request));
    }

    @PutMapping("/{id}")
    public Map<String, Object> update(@PathVariable Long id,
                                      @Valid @RequestBody ProductUpdateRequest request) {
        return toView(productService.update(id, request));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        productService.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    private Map<String, Object> toView(Product p) {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("id", p.getId());
        m.put("sku", p.getSku());
        m.put("title", p.getTitle());
        m.put("description", p.getDescription());
        m.put("quantity", p.getQuantity());
        m.put("price", p.getPrice());
        m.put("currency", p.getCurrency());
        m.put("upc", p.getUpc());
        m.put("ean", p.getEan());
        m.put("mpn", p.getMpn());
        if (p.getBrand() != null) {
            m.put("brandId", p.getBrand().getId());
        } else {
            m.put("brandId", null);
        }
        m.put("brandName", p.getBrandName());
        if (p.getManufacturer() != null) {
            m.put("manufacturerId", p.getManufacturer().getId());
        } else {
            m.put("manufacturerId", null);
        }
        m.put("manufacturerName", p.getManufacturerName());
        m.put("category", p.getCategory());
        m.put("condition", p.getCondition() != null ? p.getCondition().name() : null);
        m.put("imageUrls", p.getImageUrls());
        m.put("weightKg", p.getWeightKg());
        m.put("dimensions", p.getDimensions());
        m.put("listingStatus", p.getListingStatus() != null ? p.getListingStatus().name() : null);

        m.put("collection", p.getCollection());
        m.put("indexCode", p.getIndexCode());
        m.put("purchasePrice", p.getPurchasePrice());
        m.put("masterCartonPcs", p.getMasterCartonPcs());
        m.put("boxType", p.getBoxType());
        m.put("boxGrossVolumeM3", p.getBoxGrossVolumeM3());
        m.put("masterCartonGrossVolumeM3", p.getMasterCartonGrossVolumeM3());
        m.put("boxGrossWeightKg", p.getBoxGrossWeightKg());
        m.put("masterCartonGrossWeightKg", p.getMasterCartonGrossWeightKg());
        m.put("totalMasterCartonVolumeM3", p.getTotalMasterCartonVolumeM3());
        m.put("totalMasterCartonWeightKg", p.getTotalMasterCartonWeightKg());
        m.put("totalMasterCartonQty", p.getTotalMasterCartonQty());
        m.put("rrpEur", p.getRrpEur());
        m.put("rrpText", p.getRrpText());
        m.put("availability", p.getAvailability());

        m.put("createdAt", p.getCreatedAt() != null ? p.getCreatedAt().toString() : null);
        m.put("updatedAt", p.getUpdatedAt() != null ? p.getUpdatedAt().toString() : null);
        return m;
    }
}
