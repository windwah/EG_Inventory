package com.windwah.inventory.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

import java.time.Instant;

@Entity
@Table(name = "brand", indexes = {
        @Index(name = "idx_brand_name", columnList = "name", unique = true)
})
public class Brand {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Brand name must not be blank")
    @Size(max = 128, message = "Brand name must not exceed 128 characters")
    @Column(nullable = false, unique = true, length = 128)
    private String name;

    @Size(max = 255, message = "Brand Registry URL must not exceed 255 characters")
    @Column(name = "amazon_brand_store_url", length = 255)
    private String amazonBrandStoreUrl;

    @Size(max = 2048, message = "Brand logo URL must not exceed 2048 characters")
    @Column(name = "logo_url", length = 2048)
    private String logoUrl;

    @Size(max = 2000, message = "Brand description must not exceed 2000 characters")
    @Column(name = "description", length = 2000)
    private String description;

    @Column(name = "created_at", updatable = false)
    private Instant createdAt;

    @Column(name = "updated_at")
    private Instant updatedAt;

    @PrePersist
    protected void onPrePersist() {
        Instant now = Instant.now();
        if (this.createdAt == null) {
            this.createdAt = now;
        }
        this.updatedAt = now;
    }

    @PreUpdate
    protected void onPreUpdate() {
        this.updatedAt = Instant.now();
    }

    public Brand() {
    }

    public Brand(String name) {
        this.name = name;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getAmazonBrandStoreUrl() { return amazonBrandStoreUrl; }
    public void setAmazonBrandStoreUrl(String amazonBrandStoreUrl) { this.amazonBrandStoreUrl = amazonBrandStoreUrl; }

    public String getLogoUrl() { return logoUrl; }
    public void setLogoUrl(String logoUrl) { this.logoUrl = logoUrl; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Instant getCreatedAt() { return createdAt; }
    public void setCreatedAt(Instant createdAt) { this.createdAt = createdAt; }

    public Instant getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Instant updatedAt) { this.updatedAt = updatedAt; }
}
