package com.windwah.inventory.repository;

import com.windwah.inventory.entity.Product;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    @EntityGraph(attributePaths = {"brand", "manufacturer"})
    @Query("SELECT p FROM Product p ORDER BY p.sku")
    List<Product> findAllWithBrandAndManufacturer();

    @EntityGraph(attributePaths = {"brand", "manufacturer"})
    @Query("SELECT p FROM Product p WHERE p.id = :id")
    Optional<Product> findByIdWithBrandAndManufacturer(Long id);

    @EntityGraph(attributePaths = {"brand", "manufacturer"})
    @Query("SELECT p FROM Product p WHERE p.sku = :sku")
    Optional<Product> findBySkuWithBrandAndManufacturer(String sku);

    @EntityGraph(attributePaths = {"brand", "manufacturer"})
    @Query("SELECT p FROM Product p WHERE p.id IN :ids ORDER BY p.sku")
    List<Product> findAllByIdWithBrandAndManufacturer(List<Long> ids);

    Optional<Product> findBySku(String sku);

    boolean existsBySku(String sku);
}
