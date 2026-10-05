package com.windwah.inventory.repository;

import com.windwah.inventory.entity.Product;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.ActiveProfiles;

import java.math.BigDecimal;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest
@ActiveProfiles("test")
class ProductRepositoryTest {

    @Autowired
    private TestEntityManager em;

    @Autowired
    private ProductRepository repository;

    @Test
    void findBySku_returnsPersistedProduct() {
        Product p = new Product();
        p.setSku("SKU-001");
        p.setTitle("Widget A");
        p.setQuantity(5);
        p.setPrice(new BigDecimal("9.99"));
        p = em.persistFlushFind(p);

        Optional<Product> result = repository.findBySku("SKU-001");

        assertThat(result).isPresent();
        assertThat(result.get().getTitle()).isEqualTo("Widget A");
        assertThat(result.get().getId()).isNotNull();
    }

    @Test
    void existsBySku_returnsTrueForPersisted() {
        Product p = new Product();
        p.setSku("SKU-002");
        p.setTitle("Widget B");
        p.setQuantity(2);
        p.setPrice(new BigDecimal("19.99"));
        em.persistAndFlush(p);

        assertThat(repository.existsBySku("SKU-002")).isTrue();
        assertThat(repository.existsBySku("SKU-NOPE")).isFalse();
    }
}
