package com.windwah.inventory.integration;

import com.windwah.inventory.config.EbayApiProperties;
import com.windwah.inventory.entity.Product;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestClient;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EbayApiClient {

    private static final Logger log = LoggerFactory.getLogger(EbayApiClient.class);

    private final EbayApiProperties props;
    private final RestClient restClient;

    public EbayApiClient(EbayApiProperties props,
                         RestClient.Builder restClientBuilder) {
        this.props = props;
        this.restClient = restClientBuilder
                .baseUrl(props.getEndpoint() == null ? "" : props.getEndpoint())
                .build();
    }

    public SubmissionResult submitInventory(List<Product> products) {
        List<String> skus = products.stream()
                .map(Product::getSku)
                .collect(Collectors.toList());

        if (!props.isEnabled() || !StringUtils.hasText(props.getAccessToken())) {
            log.info("eBay API: running in STUB mode ({} SKU(s), env={})",
                    skus.size(), props.getEnvironment());
            return new SubmissionResult(
                    SubmissionResult.Mode.STUB,
                    "EBAY",
                    skus,
                    "eBay API not fully configured. Populate ebay.api.* and set enabled=true to enable live submission."
            );
        }

        try {
            String token = "Bearer " + props.getAccessToken();
            StringBuilder aggregate = new StringBuilder();
            for (Product p : products) {
                Object body = buildInventoryItem(p);
                String resp = restClient.put()
                        .uri("/sell/inventory/v1_beta/inventory_item/" + p.getSku())
                        .header("Authorization", token)
                        .header("Content-Type", "application/json")
                        .body(body)
                        .retrieve()
                        .body(String.class);
                aggregate.append(p.getSku()).append(':').append(resp).append(' ');
            }
            log.info("eBay API submission OK: {}", aggregate);
            return new SubmissionResult(
                    SubmissionResult.Mode.LIVE,
                    "EBAY",
                    skus,
                    "Submitted to eBay Inventory API: " + aggregate
            );
        } catch (Exception e) {
            log.error("eBay API submission failed: {}", e.getMessage(), e);
            return new SubmissionResult(
                    SubmissionResult.Mode.LIVE,
                    "EBAY",
                    skus,
                    "Submission failed: " + e.getMessage()
            );
        }
    }

    private Object buildInventoryItem(Product p) {
        return new EbayInventoryItem(
                p.getSku(),
                p.getTitle(),
                p.getDescription(),
                String.valueOf(p.getCondition() != null ? p.getCondition().ordinal() : 0),
                p.getQuantity() == null ? 0 : p.getQuantity(),
                p.getPrice() == null ? null : new Money("USD", p.getPrice().doubleValue())
        );
    }

    public record Money(String currency, double value) { }
    public record EbayInventoryItem(String sku, String title, String description,
                                     String condition, int quantity, Money price) { }
}
