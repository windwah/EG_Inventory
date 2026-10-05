package com.windwah.inventory.controller.rest;

import com.windwah.inventory.entity.Manufacturer;
import com.windwah.inventory.service.ManufacturerService;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/manufacturers")
public class ManufacturerRestController {

    private final ManufacturerService manufacturerService;

    public ManufacturerRestController(ManufacturerService manufacturerService) {
        this.manufacturerService = manufacturerService;
    }

    @GetMapping
    public List<Map<String, Object>> list() {
        return manufacturerService.findAll().stream().map(this::toView).toList();
    }

    @GetMapping("/{id}")
    public Map<String, Object> get(@PathVariable Long id) {
        return toView(manufacturerService.getById(id));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Map<String, Object> create(@Valid @RequestBody ManufacturerPayload payload) {
        return toView(manufacturerService.create(
                payload.name,
                payload.contactPerson,
                payload.contactPhone,
                payload.contactEmail,
                payload.address,
                payload.country
        ));
    }

    @PutMapping("/{id}")
    public Map<String, Object> update(@PathVariable Long id,
                                      @Valid @RequestBody ManufacturerPayload payload) {
        return toView(manufacturerService.update(id,
                payload.name,
                payload.contactPerson,
                payload.contactPhone,
                payload.contactEmail,
                payload.address,
                payload.country));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        manufacturerService.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    private Map<String, Object> toView(Manufacturer m) {
        Map<String, Object> o = new LinkedHashMap<>();
        o.put("id", m.getId());
        o.put("name", m.getName());
        o.put("contactPerson", m.getContactPerson());
        o.put("contactPhone", m.getContactPhone());
        o.put("contactEmail", m.getContactEmail());
        o.put("address", m.getAddress());
        o.put("country", m.getCountry());
        o.put("createdAt", m.getCreatedAt() != null ? m.getCreatedAt().toString() : null);
        o.put("updatedAt", m.getUpdatedAt() != null ? m.getUpdatedAt().toString() : null);
        return o;
    }

    public static class ManufacturerPayload {
        @NotBlank(message = "Manufacturer name must not be blank")
        @Size(max = 128)
        public String name;

        @Size(max = 128)
        public String contactPerson;

        @Size(max = 64)
        public String contactPhone;

        @Email @Size(max = 128)
        public String contactEmail;

        @Size(max = 500)
        public String address;

        @Size(max = 64)
        public String country;
    }
}
