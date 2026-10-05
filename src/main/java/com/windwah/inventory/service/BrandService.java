package com.windwah.inventory.service;

import com.windwah.inventory.entity.Brand;
import com.windwah.inventory.exception.DuplicateBrandNameException;
import com.windwah.inventory.exception.ResourceNotFoundException;
import com.windwah.inventory.repository.BrandRepository;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class BrandService {

    private final BrandRepository repository;

    public BrandService(BrandRepository repository) {
        this.repository = repository;
    }

    public List<Brand> findAll() {
        return repository.findAll();
    }

    public Optional<Brand> findById(Long id) {
        return repository.findById(id);
    }

    public Brand getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Brand", id));
    }

    public Optional<Brand> findByName(String name) {
        return repository.findByNameIgnoreCase(name);
    }

    @Transactional
    public Brand create(String name, String amazonBrandStoreUrl, String logoUrl, String description) {
        if (repository.existsByNameIgnoreCase(name)) {
            throw new DuplicateBrandNameException(name);
        }
        Brand b = new Brand();
        b.setName(name.trim());
        b.setAmazonBrandStoreUrl(amazonBrandStoreUrl);
        b.setLogoUrl(logoUrl);
        b.setDescription(description);
        try {
            return repository.save(b);
        } catch (DataIntegrityViolationException e) {
            throw new DuplicateBrandNameException(name);
        }
    }

    @Transactional
    public Brand update(Long id, String name, String amazonBrandStoreUrl, String logoUrl, String description) {
        Brand existing = getById(id);
        String trimmed = name.trim();
        if (!trimmed.equalsIgnoreCase(existing.getName()) && repository.existsByNameIgnoreCase(trimmed)) {
            throw new DuplicateBrandNameException(trimmed);
        }
        existing.setName(trimmed);
        existing.setAmazonBrandStoreUrl(amazonBrandStoreUrl);
        existing.setLogoUrl(logoUrl);
        existing.setDescription(description);
        try {
            return repository.save(existing);
        } catch (DataIntegrityViolationException e) {
            throw new DuplicateBrandNameException(trimmed);
        }
    }

    @Transactional
    public void deleteById(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Brand", id);
        }
        repository.deleteById(id);
    }
}
