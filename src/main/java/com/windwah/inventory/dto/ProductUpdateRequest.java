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

    @Size(max = 128)
    private String collection;

    @Size(max = 128)
    private String indexCode;

    @Digits(integer = 12, fraction = 2)
    private BigDecimal purchasePrice;

    private Integer masterCartonPcs;

    @Size(max = 32)
    private String boxType;

    @Digits(integer = 10, fraction = 6)
    private BigDecimal boxGrossVolumeM3;

    @Digits(integer = 10, fraction = 6)
    private BigDecimal masterCartonGrossVolumeM3;

    @Digits(integer = 10, fraction = 6)
    private BigDecimal boxGrossWeightKg;

    @Digits(integer = 10, fraction = 6)
    private BigDecimal masterCartonGrossWeightKg;

    @Digits(integer = 10, fraction = 6)
    private BigDecimal totalMasterCartonVolumeM3;

    @Digits(integer = 10, fraction = 6)
    private BigDecimal totalMasterCartonWeightKg;

    private Integer totalMasterCartonQty;

    @Digits(integer = 12, fraction = 2)
    private BigDecimal rrpEur;

    @Size(max = 128)
    private String rrpText;

    @Size(max = 128)
    private String availability;

    @Size(max = 32)
    private String upc;

    @Size(max = 32)
    private String ean;

    @Size(max = 64)
    private String mpn;

    private Long brandId;

    private Long manufacturerId;

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

    public String getCollection() { return collection; }
    public void setCollection(String collection) { this.collection = collection; }

    public String getIndexCode() { return indexCode; }
    public void setIndexCode(String indexCode) { this.indexCode = indexCode; }

    public BigDecimal getPurchasePrice() { return purchasePrice; }
    public void setPurchasePrice(BigDecimal purchasePrice) { this.purchasePrice = purchasePrice; }

    public Integer getMasterCartonPcs() { return masterCartonPcs; }
    public void setMasterCartonPcs(Integer masterCartonPcs) { this.masterCartonPcs = masterCartonPcs; }

    public String getBoxType() { return boxType; }
    public void setBoxType(String boxType) { this.boxType = boxType; }

    public BigDecimal getBoxGrossVolumeM3() { return boxGrossVolumeM3; }
    public void setBoxGrossVolumeM3(BigDecimal boxGrossVolumeM3) { this.boxGrossVolumeM3 = boxGrossVolumeM3; }

    public BigDecimal getMasterCartonGrossVolumeM3() { return masterCartonGrossVolumeM3; }
    public void setMasterCartonGrossVolumeM3(BigDecimal masterCartonGrossVolumeM3) { this.masterCartonGrossVolumeM3 = masterCartonGrossVolumeM3; }

    public BigDecimal getBoxGrossWeightKg() { return boxGrossWeightKg; }
    public void setBoxGrossWeightKg(BigDecimal boxGrossWeightKg) { this.boxGrossWeightKg = boxGrossWeightKg; }

    public BigDecimal getMasterCartonGrossWeightKg() { return masterCartonGrossWeightKg; }
    public void setMasterCartonGrossWeightKg(BigDecimal masterCartonGrossWeightKg) { this.masterCartonGrossWeightKg = masterCartonGrossWeightKg; }

    public BigDecimal getTotalMasterCartonVolumeM3() { return totalMasterCartonVolumeM3; }
    public void setTotalMasterCartonVolumeM3(BigDecimal totalMasterCartonVolumeM3) { this.totalMasterCartonVolumeM3 = totalMasterCartonVolumeM3; }

    public BigDecimal getTotalMasterCartonWeightKg() { return totalMasterCartonWeightKg; }
    public void setTotalMasterCartonWeightKg(BigDecimal totalMasterCartonWeightKg) { this.totalMasterCartonWeightKg = totalMasterCartonWeightKg; }

    public Integer getTotalMasterCartonQty() { return totalMasterCartonQty; }
    public void setTotalMasterCartonQty(Integer totalMasterCartonQty) { this.totalMasterCartonQty = totalMasterCartonQty; }

    public BigDecimal getRrpEur() { return rrpEur; }
    public void setRrpEur(BigDecimal rrpEur) { this.rrpEur = rrpEur; }

    public String getRrpText() { return rrpText; }
    public void setRrpText(String rrpText) { this.rrpText = rrpText; }

    public String getAvailability() { return availability; }
    public void setAvailability(String availability) { this.availability = availability; }

    public String getUpc() { return upc; }
    public void setUpc(String upc) { this.upc = upc; }

    public String getEan() { return ean; }
    public void setEan(String ean) { this.ean = ean; }

    public String getMpn() { return mpn; }
    public void setMpn(String mpn) { this.mpn = mpn; }

    public Long getBrandId() { return brandId; }
    public void setBrandId(Long brandId) { this.brandId = brandId; }

    public Long getManufacturerId() { return manufacturerId; }
    public void setManufacturerId(Long manufacturerId) { this.manufacturerId = manufacturerId; }

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
