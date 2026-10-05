package com.windwah.inventory.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "ebay.export")
public class EbayExportProperties {

    private String defaultAction = "Add";
    private String itemLocation = "Hong Kong";
    private String postalCode = "";
    private String country = "HK";
    private String shippingProfile = "Standard Shipping";
    private String defaultCategoryId = "";

    public String getDefaultAction() { return defaultAction; }
    public void setDefaultAction(String defaultAction) { this.defaultAction = defaultAction; }

    public String getItemLocation() { return itemLocation; }
    public void setItemLocation(String itemLocation) { this.itemLocation = itemLocation; }

    public String getPostalCode() { return postalCode; }
    public void setPostalCode(String postalCode) { this.postalCode = postalCode; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public String getShippingProfile() { return shippingProfile; }
    public void setShippingProfile(String shippingProfile) { this.shippingProfile = shippingProfile; }

    public String getDefaultCategoryId() { return defaultCategoryId; }
    public void setDefaultCategoryId(String defaultCategoryId) { this.defaultCategoryId = defaultCategoryId; }
}
