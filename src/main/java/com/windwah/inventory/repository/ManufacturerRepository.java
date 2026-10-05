package com.windwah.inventory.repository;

import com.windwah.inventory.entity.Manufacturer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ManufacturerRepository extends JpaRepository<Manufacturer, Long> {
    Optional<Manufacturer> findByNameIgnoreCase(String name);
    boolean existsByNameIgnoreCase(String name);
}
