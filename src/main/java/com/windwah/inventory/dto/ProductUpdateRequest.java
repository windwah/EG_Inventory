package com.windwah.inventory.dto;

import com.windwah.inventory.entity.Condition;
import com.windwah.inventory.entity.ListingStatus;
import jakarta.validation.constraints.*;

import java.math.BigDecimal;

public class ProductUpdateRequest {

    @NotBlank(message = "Title must not be blank")
    @Size(max = 512)
    private String title;

    @Size(max = 4000)
    private String description;

    @NotNull(message = "Quantity must not be null")
    @Min(value = 0, message = "Quantity must be >= 0")
    private Integer quantity;

    @NotNull(message = "Price must not be null")
    @DecimalMin(value = "0.00", inclusive = false, message = "Price must be > 0")
    @Digits(integer = 12, fraction = 2)
    private BigDecimal price;

    @Size(max = 8)
    private String currency;

    @Size(max = 32)
    private String upc;

    @Size(max = 32)
    private String ean;

    @Size(max = 64)
    private String mpn;

    @Size(max = 128)
    private String brand;

    @Size(max = 128)
    private String manufacturer;

    @Size(max = 256)
    private String category;

    private Condition condition;

    @Size(max = 4000)
    private String imageUrls;

    @Digits(integer = 10, fraction = 3)
    private BigDecimal weightKg;

    @Size(max = 128)
    private String dimensions;

    private ListingStatus listingStatus;

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
}
