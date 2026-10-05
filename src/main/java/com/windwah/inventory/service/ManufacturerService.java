package com.windwah.inventory.service;

import com.windwah.inventory.entity.Manufacturer;
import com.windwah.inventory.exception.DuplicateManufacturerNameException;
import com.windwah.inventory.exception.ResourceNotFoundException;
import com.windwah.inventory.repository.ManufacturerRepository;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class ManufacturerService {

    private final ManufacturerRepository repository;

    public ManufacturerService(ManufacturerRepository repository) {
        this.repository = repository;
    }

    public List<Manufacturer> findAll() {
        return repository.findAll();
    }

    public Optional<Manufacturer> findById(Long id) {
        return repository.findById(id);
    }

    public Manufacturer getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Manufacturer", id));
    }

    public Optional<Manufacturer> findByName(String name) {
        return repository.findByNameIgnoreCase(name);
    }

    @Transactional
    public Manufacturer create(String name, String contactPerson, String contactPhone,
                               String contactEmail, String address, String country) {
        if (repository.existsByNameIgnoreCase(name)) {
            throw new DuplicateManufacturerNameException(name);
        }
        Manufacturer m = new Manufacturer();
        m.setName(name.trim());
        m.setContactPerson(contactPerson);
        m.setContactPhone(contactPhone);
        m.setContactEmail(contactEmail);
        m.setAddress(address);
        m.setCountry(country);
        try {
            return repository.save(m);
        } catch (DataIntegrityViolationException e) {
            throw new DuplicateManufacturerNameException(name);
        }
    }

    @Transactional
    public Manufacturer update(Long id, String name, String contactPerson, String contactPhone,
                               String contactEmail, String address, String country) {
        Manufacturer existing = getById(id);
        String trimmed = name.trim();
        if (!trimmed.equalsIgnoreCase(existing.getName()) && repository.existsByNameIgnoreCase(trimmed)) {
            throw new DuplicateManufacturerNameException(trimmed);
        }
        existing.setName(trimmed);
        existing.setContactPerson(contactPerson);
        existing.setContactPhone(contactPhone);
        existing.setContactEmail(contactEmail);
        existing.setAddress(address);
        existing.setCountry(country);
        try {
            return repository.save(existing);
        } catch (DataIntegrityViolationException e) {
            throw new DuplicateManufacturerNameException(trimmed);
        }
    }

    @Transactional
    public void deleteById(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Manufacturer", id);
        }
        repository.deleteById(id);
    }
}
