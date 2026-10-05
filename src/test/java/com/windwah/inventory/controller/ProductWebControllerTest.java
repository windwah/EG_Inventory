package com.windwah.inventory.controller;

import com.windwah.inventory.repository.ProductRepository;
import com.windwah.inventory.service.ProductService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ProductWebControllerTest {

    @Autowired
    private MockMvc mvc;

    @Autowired
    @SuppressWarnings("unused")
    private ProductRepository repository;

    @Autowired
    @SuppressWarnings("unused")
    private ProductService productService;

    @Test
    void listPage_rendersSkuHeader() throws Exception {
        mvc.perform(get("/products"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString(">SKU</th>")));
    }

    @Test
    void newForm_rendersSkuField() throws Exception {
        mvc.perform(get("/products/new"))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("SKU *")));
    }
}
