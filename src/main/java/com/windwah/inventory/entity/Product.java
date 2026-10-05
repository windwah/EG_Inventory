package com.windwah.inventory.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import org.hibernate.annotations.NaturalId;

import java.math.BigDecimal;
import java.time.Instant;

@Entity
@Table(name = "product", indexes = {
        @Index(name = "idx_product_sku", columnList = "sku", unique = true)
})
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NaturalId
    @NotBlank(message = "SKU must not be blank")
    @Size(max = 64, message = "SKU must not exceed 64 characters")
    @Column(nullable = false, unique = true, length = 64)
    private String sku;

    @NotBlank(message = "Title must not be blank")
    @Size(max = 512, message = "Title must not exceed 512 characters")
    @Column(nullable = false, length = 512)
    private String title;

    @Size(max = 4000, message = "Description must not exceed 4000 characters")
    @Column(length = 4000)
    private String description;

    @NotNull(message = "Quantity must not be null")
    @Min(value = 0, message = "Quantity must be >= 0")
    @Column(nullable = false)
    private Integer quantity;

    @NotNull(message = "Price must not be null")
    @DecimalMin(value = "0.00", inclusive = false, message = "Price must be > 0")
    @Digits(integer = 12, fraction = 2, message = "Price must have at most 12 integer digits and 2 fractional digits")
    @Column(nullable = false, precision = 14, scale = 2)
    private BigDecimal price;

    @Size(max = 8, message = "Currency must not exceed 8 characters")
    @Column(length = 8)
    private String currency;

    @Size(max = 32, message = "UPC must not exceed 32 characters")
    @Column(length = 32)
    private String upc;

    @Size(max = 32, message = "EAN must not exceed 32 characters")
    @Column(length = 32)
    private String ean;

    @Size(max = 64, message = "MPN must not exceed 64 characters")
    @Column(length = 64)
    private String mpn;

    @Size(max = 128, message = "Brand must not exceed 128 characters")
    @Column(length = 128)
    private String brand;

    @Size(max = 128, message = "Manufacturer must not exceed 128 characters")
    @Column(length = 128)
    private String manufacturer;

    @Size(max = 256, message = "Category must not exceed 256 characters")
    @Column(length = 256)
    private String category;

    @Enumerated(EnumType.STRING)
    @Column(length = 32)
    private Condition condition;

    @Column(name = "image_urls", length = 4000)
    @Size(max = 4000, message = "Image URLs must not exceed 4000 characters")
    private String imageUrls;

    @Digits(integer = 10, fraction = 3, message = "Weight must have at most 10 integer digits and 3 fractional digits")
    @Column(name = "weight_kg", precision = 13, scale = 3)
    private BigDecimal weightKg;

    @Size(max = 128, message = "Dimensions must not exceed 128 characters")
    @Column(length = 128)
    private String dimensions;

    @Enumerated(EnumType.STRING)
    @Column(name = "listing_status", length = 16)
    private ListingStatus listingStatus;

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
        if (this.listingStatus == null) {
            this.listingStatus = ListingStatus.ACTIVE;
        }
        if (this.condition == null) {
            this.condition = Condition.NEW;
        }
        if (this.currency == null || this.currency.isBlank()) {
            this.currency = "HKD";
        }
    }

    @PreUpdate
    protected void onPreUpdate() {
        this.updatedAt = Instant.now();
    }

    public Product() {
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getSku() { return sku; }
    public void setSku(String sku) { this.sku = sku; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public String getCurrency() { return currency; }
    public void setCurrency(String currency) { this.currency = currency; }

    public String getUpc() { return upc; }
    public void setUpc(String upc) { this.upc = upc; }

    public String getEan() { return ean; }
    public void setEan(String ean) { this.ean = ean; }

    public String getMpn() { return mpn; }
    public void setMpn(String mpn) { this.mpn = mpn; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public String getManufacturer() { return manufacturer; }
    public void setManufacturer(String manufacturer) { this.manufacturer = manufacturer; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public Condition getCondition() { return condition; }
    public void setCondition(Condition condition) { this.condition = condition; }

    public String getImageUrls() { return imageUrls; }
    public void setImageUrls(String imageUrls) { this.imageUrls = imageUrls; }

    public BigDecimal getWeightKg() { return weightKg; }
    public void setWeightKg(BigDecimal weightKg) { this.weightKg = weightKg; }

    public String getDimensions() { return dimensions; }
    public void setDimensions(String dimensions) { this.dimensions = dimensions; }

    public ListingStatus getListingStatus() { return listingStatus; }
    public void setListingStatus(ListingStatus listingStatus) { this.listingStatus = listingStatus; }

    public Instant getCreatedAt() { return createdAt; }
    public void setCreatedAt(Instant createdAt) { this.createdAt = createdAt; }

    public Instant getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Instant updatedAt) { this.updatedAt = updatedAt; }
}
