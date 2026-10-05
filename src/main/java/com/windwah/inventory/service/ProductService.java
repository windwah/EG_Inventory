package com.windwah.inventory.service;

import com.windwah.inventory.dto.ProductCreateRequest;
import com.windwah.inventory.dto.ProductUpdateRequest;
import com.windwah.inventory.entity.Product;
import com.windwah.inventory.exception.DuplicateSkuException;
import com.windwah.inventory.exception.ResourceNotFoundException;
import com.windwah.inventory.repository.ProductRepository;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class ProductService {

    private final ProductRepository repository;

    public ProductService(ProductRepository repository) {
        this.repository = repository;
    }

    public List<Product> findAll() {
        return repository.findAll();
    }

    public Optional<Product> findById(Long id) {
        return repository.findById(id);
    }

    public Product getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product", id));
    }

    public Optional<Product> findBySku(String sku) {
        return repository.findBySku(sku);
    }

    public List<Product> findAllByIdIn(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return repository.findAll();
        }
        return repository.findAllById(ids);
    }

    @Transactional
    public Product create(ProductCreateRequest request) {
        if (repository.existsBySku(request.getSku())) {
            throw new DuplicateSkuException(request.getSku());
        }
        Product product = new Product();
        product.setSku(request.getSku());
        product.setTitle(request.getTitle());
        product.setDescription(request.getDescription());
        product.setQuantity(request.getQuantity());
        product.setPrice(request.getPrice());
        product.setCurrency(request.getCurrency());
        product.setUpc(request.getUpc());
        product.setEan(request.getEan());
        product.setMpn(request.getMpn());
        product.setBrand(request.getBrand());
        product.setManufacturer(request.getManufacturer());
        product.setCategory(request.getCategory());
        product.setCondition(request.getCondition());
        product.setImageUrls(request.getImageUrls());
        product.setWeightKg(request.getWeightKg());
        product.setDimensions(request.getDimensions());
        product.setListingStatus(request.getListingStatus());
        try {
            return repository.save(product);
        } catch (DataIntegrityViolationException e) {
            throw new DuplicateSkuException(request.getSku());
        }
    }

    @Transactional
    public Product update(Long id, ProductUpdateRequest request) {
        Product existing = getById(id);
        existing.setTitle(request.getTitle());
        existing.setDescription(request.getDescription());
        existing.setQuantity(request.getQuantity());
        existing.setPrice(request.getPrice());
        existing.setCurrency(request.getCurrency());
        existing.setUpc(request.getUpc());
        existing.setEan(request.getEan());
        existing.setMpn(request.getMpn());
        existing.setBrand(request.getBrand());
        existing.setManufacturer(request.getManufacturer());
        existing.setCategory(request.getCategory());
        existing.setCondition(request.getCondition());
        existing.setImageUrls(request.getImageUrls());
        existing.setWeightKg(request.getWeightKg());
        existing.setDimensions(request.getDimensions());
        existing.setListingStatus(request.getListingStatus());
        return repository.save(existing);
    }

    @Transactional
    public void deleteById(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Product", id);
        }
        repository.deleteById(id);
    }
}
