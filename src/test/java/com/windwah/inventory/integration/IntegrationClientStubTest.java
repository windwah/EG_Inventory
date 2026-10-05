package com.windwah.inventory.integration;

import com.windwah.inventory.config.AmazonSpApiProperties;
import com.windwah.inventory.config.EbayApiProperties;
import com.windwah.inventory.entity.Product;
import org.junit.jupiter.api.Test;
import org.springframework.web.client.RestClient;

import java.math.BigDecimal;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

class IntegrationClientStubTest {

    @Test
    void amazonClient_withoutCredentials_runsStub() {
        AmazonSpApiProperties p = new AmazonSpApiProperties();
        p.setEnabled(false);
        AmazonSpApiClient client = new AmazonSpApiClient(p, RestClient.builder());

        SubmissionResult r = client.submitInventory(List.of(sample("A1"), sample("A2")));

        assertThat(r.getMode()).isEqualTo(SubmissionResult.Mode.STUB);
        assertThat(r.getSkuList()).containsExactlyInAnyOrder("A1", "A2");
        assertThat(r.getMarketplace()).isEqualTo("AMAZON");
    }

    @Test
    void ebayClient_withoutCredentials_runsStub() {
        EbayApiProperties p = new EbayApiProperties();
        p.setEnabled(false);
        EbayApiClient client = new EbayApiClient(p, RestClient.builder());

        SubmissionResult r = client.submitInventory(List.of(sample("E1"), sample("E2")));

        assertThat(r.getMode()).isEqualTo(SubmissionResult.Mode.STUB);
        assertThat(r.getSkuList()).containsExactlyInAnyOrder("E1", "E2");
        assertThat(r.getMarketplace()).isEqualTo("EBAY");
    }

    private static Product sample(String sku) {
        Product p = new Product();
        p.setSku(sku);
        p.setTitle("Sample " + sku);
        p.setQuantity(1);
        p.setPrice(BigDecimal.TEN);
        return p;
    }
}
