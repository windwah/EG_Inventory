package com.windwah.inventory.controller.rest;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.startsWith;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ExportSubmitRestControllerTest {

    @Autowired
    private MockMvc mvc;

    @Test
    void amazonExport_returnsXlsxAttachment() throws Exception {
        mvc.perform(get("/api/export/amazon"))
                .andExpect(status().isOk())
                .andExpect(header().string("Content-Type",
                        startsWith("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")))
                .andExpect(header().string("Content-Disposition",
                        containsString("amazon-inventory")))
                .andExpect(mvcResult -> {
                    int len = mvcResult.getResponse().getContentAsByteArray().length;
                    if (len <= 0) {
                        throw new AssertionError("Expected non-empty export body, got length 0");
                    }
                    // .xlsx files all start with ZIP signature: 50 4B 03 04
                    byte[] bytes = mvcResult.getResponse().getContentAsByteArray();
                    if (bytes[0] != 0x50 || bytes[1] != 0x4B) {
                        throw new AssertionError("Body does not start with ZIP/xlsx magic bytes");
                    }
                });
    }

    @Test
    void ebayExport_returnsXlsxAttachment() throws Exception {
        mvc.perform(get("/api/export/ebay"))
                .andExpect(status().isOk())
                .andExpect(header().string("Content-Type",
                        startsWith("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")))
                .andExpect(mvcResult -> {
                    int len = mvcResult.getResponse().getContentAsByteArray().length;
                    if (len <= 0) {
                        throw new AssertionError("Expected non-empty export body, got length 0");
                    }
                    byte[] bytes = mvcResult.getResponse().getContentAsByteArray();
                    if (bytes[0] != 0x50 || bytes[1] != 0x4B) {
                        throw new AssertionError("Body does not start with ZIP/xlsx magic bytes");
                    }
                });
    }

    @Test
    void amazonSubmit_returnsStubResult() throws Exception {
        mvc.perform(post("/api/submit/amazon"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.mode").value("STUB"))
                .andExpect(jsonPath("$.marketplace").value("AMAZON"))
                .andExpect(jsonPath("$.skuList").isArray());
    }

    @Test
    void ebaySubmit_returnsStubResult() throws Exception {
        mvc.perform(post("/api/submit/ebay"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.mode").value("STUB"))
                .andExpect(jsonPath("$.marketplace").value("EBAY"))
                .andExpect(jsonPath("$.skuList").isArray());
    }
}
