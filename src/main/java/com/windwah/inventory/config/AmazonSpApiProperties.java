package com.windwah.inventory.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "amazon.sp-api")
public class AmazonSpApiProperties {

    private boolean enabled = false;
    private String endpoint = "https://sellingpartnerapi-na.amazon.com";
    private String clientId = "";
    private String clientSecret = "";
    private String refreshToken = "";
    private String feedType = "POST_INVENTORY_AVAILABILITY_DATA";

    public boolean isEnabled() { return enabled; }
    public void setEnabled(boolean enabled) { this.enabled = enabled; }

    public String getEndpoint() { return endpoint; }
    public void setEndpoint(String endpoint) { this.endpoint = endpoint; }

    public String getClientId() { return clientId; }
    public void setClientId(String clientId) { this.clientId = clientId; }

    public String getClientSecret() { return clientSecret; }
    public void setClientSecret(String clientSecret) { this.clientSecret = clientSecret; }

    public String getRefreshToken() { return refreshToken; }
    public void setRefreshToken(String refreshToken) { this.refreshToken = refreshToken; }

    public String getFeedType() { return feedType; }
    public void setFeedType(String feedType) { this.feedType = feedType; }
}
