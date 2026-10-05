package com.windwah.inventory.controller.rest;

import com.windwah.inventory.dto.ProductCreateRequest;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.math.BigDecimal;

import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ProductRestControllerTest {

    @Autowired
    private MockMvc mvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    void list_returnsJsonArray() throws Exception {
        mvc.perform(get("/api/products"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").isArray());
    }

    @Test
    void create_withInvalidPayload_returnsFieldErrors() throws Exception {
        ProductCreateRequest req = new ProductCreateRequest();
        req.setSku("");
        req.setTitle("X");
        req.setQuantity(-1);
        req.setPrice(new BigDecimal("-0.5"));

        mvc.perform(post("/api/products")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(req)))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.fieldErrors").isArray())
                .andExpect(jsonPath("$.fieldErrors.length()", greaterThanOrEqualTo(2)));
    }

    @Test
    void create_validPayload_thenGetById_succeeds() throws Exception {
        ProductCreateRequest req = new ProductCreateRequest();
        req.setSku("API-001");
        req.setTitle("REST Widget");
        req.setQuantity(11);
        req.setPrice(new BigDecimal("3.50"));

        String location = mvc.perform(post("/api/products")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(req)))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.id").isNumber())
                .andExpect(jsonPath("$.sku").value("API-001"))
                .andReturn()
                .getResponse()
                .getContentAsString();

        Long id = objectMapper.readTree(location).get("id").asLong();

        mvc.perform(get("/api/products/" + id))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.quantity").value(11));

        mvc.perform(delete("/api/products/" + id))
                .andExpect(status().isNoContent());
    }
}
