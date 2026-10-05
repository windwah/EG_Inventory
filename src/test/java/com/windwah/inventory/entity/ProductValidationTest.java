package com.windwah.inventory.entity;

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.util.Set;
import java.util.stream.Collectors;

import static org.assertj.core.api.Assertions.assertThat;

class ProductValidationTest {

    private static Validator validator;

    @BeforeAll
    static void setUp() {
        try (ValidatorFactory factory = Validation.buildDefaultValidatorFactory()) {
            validator = factory.getValidator();
        }
    }

    @Test
    void rejectsBlankSku() {
        Product p = validProduct();
        p.setSku(" ");
        Set<String> msgs = messages(validator.validate(p));
        assertThat(msgs).anyMatch(m -> m.contains("SKU must not be blank"));
    }

    @Test
    void rejectsNegativePrice() {
        Product p = validProduct();
        p.setPrice(new BigDecimal("-0.01"));
        Set<String> msgs = messages(validator.validate(p));
        assertThat(msgs).anyMatch(m -> m.contains("Price must be > 0"));
    }

    @Test
    void rejectsNegativeQuantity() {
        Product p = validProduct();
        p.setQuantity(-1);
        Set<String> msgs = messages(validator.validate(p));
        assertThat(msgs).anyMatch(m -> m.contains("Quantity must be >= 0"));
    }

    @Test
    void acceptsValidProduct() {
        assertThat(validator.validate(validProduct())).isEmpty();
    }

    private static Product validProduct() {
        Product p = new Product();
        p.setSku("V-001");
        p.setTitle("Valid");
        p.setQuantity(0);
        p.setPrice(new BigDecimal("1.00"));
        return p;
    }

    private static Set<String> messages(Set<ConstraintViolation<Product>> vs) {
        return vs.stream().map(ConstraintViolation::getMessage).collect(Collectors.toSet());
    }
}
