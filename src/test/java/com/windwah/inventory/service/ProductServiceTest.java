package com.windwah.inventory.service;

import com.windwah.inventory.dto.ProductCreateRequest;
import com.windwah.inventory.entity.Product;
import com.windwah.inventory.exception.DuplicateSkuException;
import com.windwah.inventory.repository.ProductRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.math.BigDecimal;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

@SpringBootTest
@ActiveProfiles("test")
class ProductServiceTest {

    @Autowired
    private ProductService service;

    @Autowired
    private ProductRepository repository;

    @Test
    void create_persistsProduct() {
        ProductCreateRequest r = new ProductCreateRequest();
        r.setSku("SVC-001");
        r.setTitle("Service Widget");
        r.setQuantity(7);
        r.setPrice(new BigDecimal("12.50"));

        Product p = service.create(r);

        assertThat(p.getId()).isNotNull();
        assertThat(repository.count()).isGreaterThanOrEqualTo(1);
        assertThat(repository.findBySku("SVC-001")).isPresent();
    }

    @Test
    void create_duplicateSku_throwsReadableException() {
        ProductCreateRequest r1 = new ProductCreateRequest();
        r1.setSku("SVC-DUP");
        r1.setTitle("First");
        r1.setQuantity(1);
        r1.setPrice(new BigDecimal("1.00"));
        service.create(r1);

        ProductCreateRequest r2 = new ProductCreateRequest();
        r2.setSku("SVC-DUP");
        r2.setTitle("Second");
        r2.setQuantity(2);
        r2.setPrice(new BigDecimal("2.00"));

        assertThatThrownBy(() -> service.create(r2))
                .isInstanceOf(DuplicateSkuException.class)
                .hasMessageContaining("SKU already exists");
    }
}
