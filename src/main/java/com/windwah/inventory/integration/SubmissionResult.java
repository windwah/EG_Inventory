package com.windwah.inventory.integration;

import java.util.ArrayList;
import java.util.List;

public class SubmissionResult {

    public enum Mode { STUB, LIVE }

    private Mode mode;
    private String marketplace;
    private List<String> skuList = new ArrayList<>();
    private String message;

    public SubmissionResult() {
    }

    public SubmissionResult(Mode mode, String marketplace, List<String> skuList, String message) {
        this.mode = mode;
        this.marketplace = marketplace;
        this.skuList = skuList == null ? new ArrayList<>() : new ArrayList<>(skuList);
        this.message = message;
    }

    public Mode getMode() { return mode; }
    public void setMode(Mode mode) { this.mode = mode; }

    public String getMarketplace() { return marketplace; }
    public void setMarketplace(String marketplace) { this.marketplace = marketplace; }

    public List<String> getSkuList() { return skuList; }
    public void setSkuList(List<String> skuList) { this.skuList = skuList; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
}
