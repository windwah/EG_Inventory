package com.windwah.inventory.integration;

import com.windwah.inventory.config.AmazonSpApiProperties;
import com.windwah.inventory.entity.Product;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestClient;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AmazonSpApiClient {

    private static final Logger log = LoggerFactory.getLogger(AmazonSpApiClient.class);

    private final AmazonSpApiProperties props;
    private final RestClient restClient;

    public AmazonSpApiClient(AmazonSpApiProperties props,
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

        if (!props.isEnabled() || !StringUtils.hasText(props.getRefreshToken())
                || !StringUtils.hasText(props.getClientId())
                || !StringUtils.hasText(props.getClientSecret())) {
            log.info("Amazon SP-API: running in STUB mode ({} SKU(s), feedType={})",
                    skus.size(), props.getFeedType());
            return new SubmissionResult(
                    SubmissionResult.Mode.STUB,
                    "AMAZON",
                    skus,
                    "Amazon SP-API not fully configured. Populate amazon.sp-api.* and set enabled=true to enable live submission."
            );
        }

        Object payload = buildFeedPayload(products);
        try {
            String response = restClient.post()
                    .uri("/feeds/2021-06-30/feeds")
                    .body(payload)
                    .retrieve()
                    .body(String.class);
            log.info("Amazon SP-API submission OK, response = {}", response);
            return new SubmissionResult(
                    SubmissionResult.Mode.LIVE,
                    "AMAZON",
                    skus,
                    "Submitted to SP-API Feeds endpoint; feedType=" + props.getFeedType()
            );
        } catch (Exception e) {
            log.error("Amazon SP-API submission failed: {}", e.getMessage(), e);
            return new SubmissionResult(
                    SubmissionResult.Mode.LIVE,
                    "AMAZON",
                    skus,
                    "Submission failed: " + e.getMessage()
            );
        }
    }

    private Object buildFeedPayload(List<Product> products) {
        return new AmazonFeedRequest(props.getFeedType(), products);
    }

    public record AmazonFeedRequest(String feedType, List<Product> products) { }
}
