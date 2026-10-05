package com.windwah.inventory.service;

import com.windwah.inventory.dto.ProductCreateRequest;
import com.windwah.inventory.dto.ProductUpdateRequest;
import com.windwah.inventory.entity.Brand;
import com.windwah.inventory.entity.Manufacturer;
import com.windwah.inventory.entity.Product;
import com.windwah.inventory.exception.DuplicateSkuException;
import com.windwah.inventory.exception.ResourceNotFoundException;
import com.windwah.inventory.repository.BrandRepository;
import com.windwah.inventory.repository.ManufacturerRepository;
import com.windwah.inventory.repository.ProductRepository;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class ProductService {

    private final ProductRepository repository;
    private final BrandRepository brandRepository;
    private final ManufacturerRepository manufacturerRepository;

    public ProductService(ProductRepository repository,
                          BrandRepository brandRepository,
                          ManufacturerRepository manufacturerRepository) {
        this.repository = repository;
        this.brandRepository = brandRepository;
        this.manufacturerRepository = manufacturerRepository;
    }

    public List<Product> findAll() {
        return repository.findAllWithBrandAndManufacturer();
    }

    public Optional<Product> findById(Long id) {
        return repository.findByIdWithBrandAndManufacturer(id);
    }

    public Product getById(Long id) {
        return repository.findByIdWithBrandAndManufacturer(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product", id));
    }

    public Optional<Product> findBySku(String sku) {
        return repository.findBySkuWithBrandAndManufacturer(sku);
    }

    public List<Product> findAllByIdIn(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return repository.findAllWithBrandAndManufacturer();
        }
        return repository.findAllByIdWithBrandAndManufacturer(ids);
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
        product.setCategory(request.getCategory());
        product.setCondition(request.getCondition());
        product.setImageUrls(request.getImageUrls());
        product.setWeightKg(request.getWeightKg());
        product.setDimensions(request.getDimensions());
        product.setListingStatus(request.getListingStatus());

        product.setCollection(request.getCollection());
        product.setIndexCode(request.getIndexCode());
        product.setPurchasePrice(request.getPurchasePrice());
        product.setMasterCartonPcs(request.getMasterCartonPcs());
        product.setBoxType(request.getBoxType());
        product.setBoxGrossVolumeM3(request.getBoxGrossVolumeM3());
        product.setMasterCartonGrossVolumeM3(request.getMasterCartonGrossVolumeM3());
        product.setBoxGrossWeightKg(request.getBoxGrossWeightKg());
        product.setMasterCartonGrossWeightKg(request.getMasterCartonGrossWeightKg());
        product.setTotalMasterCartonVolumeM3(request.getTotalMasterCartonVolumeM3());
        product.setTotalMasterCartonWeightKg(request.getTotalMasterCartonWeightKg());
        product.setTotalMasterCartonQty(request.getTotalMasterCartonQty());
        product.setRrpEur(request.getRrpEur());
        product.setRrpText(request.getRrpText());
        product.setAvailability(request.getAvailability());

        applyBrand(product, request.getBrandId(), request.getBrand());
        applyManufacturer(product, request.getManufacturerId(), request.getManufacturer());

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
        existing.setCategory(request.getCategory());
        existing.setCondition(request.getCondition());
        existing.setImageUrls(request.getImageUrls());
        existing.setWeightKg(request.getWeightKg());
        existing.setDimensions(request.getDimensions());
        existing.setListingStatus(request.getListingStatus());

        existing.setCollection(request.getCollection());
        existing.setIndexCode(request.getIndexCode());
        existing.setPurchasePrice(request.getPurchasePrice());
        existing.setMasterCartonPcs(request.getMasterCartonPcs());
        existing.setBoxType(request.getBoxType());
        existing.setBoxGrossVolumeM3(request.getBoxGrossVolumeM3());
        existing.setMasterCartonGrossVolumeM3(request.getMasterCartonGrossVolumeM3());
        existing.setBoxGrossWeightKg(request.getBoxGrossWeightKg());
        existing.setMasterCartonGrossWeightKg(request.getMasterCartonGrossWeightKg());
        existing.setTotalMasterCartonVolumeM3(request.getTotalMasterCartonVolumeM3());
        existing.setTotalMasterCartonWeightKg(request.getTotalMasterCartonWeightKg());
        existing.setTotalMasterCartonQty(request.getTotalMasterCartonQty());
        existing.setRrpEur(request.getRrpEur());
        existing.setRrpText(request.getRrpText());
        existing.setAvailability(request.getAvailability());

        applyBrandUpdate(existing, request.getBrandId());
        applyManufacturerUpdate(existing, request.getManufacturerId());

        return repository.save(existing);
    }

    @Transactional
    public void deleteById(Long id) {
        if (!repository.existsById(id)) {
            throw new ResourceNotFoundException("Product", id);
        }
        repository.deleteById(id);
    }

    private void applyBrand(Product product, Long brandId, String brandName) {
        if (brandId != null) {
            Brand b = brandRepository.findById(brandId)
                    .orElseThrow(() -> new ResourceNotFoundException("Brand", brandId));
            product.setBrand(b);
            return;
        }
        if (StringUtils.hasText(brandName)) {
            String trimmed = brandName.trim();
            Brand existing = brandRepository.findByNameIgnoreCase(trimmed).orElse(null);
            if (existing == null) {
                existing = new Brand(trimmed);
                try {
                    existing = brandRepository.save(existing);
                } catch (DataIntegrityViolationException e) {
                    existing = brandRepository.findByNameIgnoreCase(trimmed)
                            .orElseThrow(() -> new DuplicateSkuException("Brand " + trimmed));
                }
            }
            product.setBrand(existing);
        }
    }

    private void applyManufacturer(Product product, Long manufacturerId, String manufacturerName) {
        if (manufacturerId != null) {
            Manufacturer m = manufacturerRepository.findById(manufacturerId)
                    .orElseThrow(() -> new ResourceNotFoundException("Manufacturer", manufacturerId));
            product.setManufacturer(m);
            return;
        }
        if (StringUtils.hasText(manufacturerName)) {
            String trimmed = manufacturerName.trim();
            Manufacturer existing = manufacturerRepository.findByNameIgnoreCase(trimmed).orElse(null);
            if (existing == null) {
                existing = new Manufacturer(trimmed);
                try {
                    existing = manufacturerRepository.save(existing);
                } catch (DataIntegrityViolationException e) {
                    existing = manufacturerRepository.findByNameIgnoreCase(trimmed)
                            .orElseThrow(() -> new DuplicateSkuException("Manufacturer " + trimmed));
                }
            }
            product.setManufacturer(existing);
        }
    }

    private void applyBrandUpdate(Product product, Long brandId) {
        if (brandId == null) {
            product.setBrand(null);
            return;
        }
        Brand b = brandRepository.findById(brandId)
                .orElseThrow(() -> new ResourceNotFoundException("Brand", brandId));
        product.setBrand(b);
    }

    private void applyManufacturerUpdate(Product product, Long manufacturerId) {
        if (manufacturerId == null) {
            product.setManufacturer(null);
            return;
        }
        Manufacturer m = manufacturerRepository.findById(manufacturerId)
                .orElseThrow(() -> new ResourceNotFoundException("Manufacturer", manufacturerId));
        product.setManufacturer(m);
    }
}
