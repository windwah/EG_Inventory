package com.egate.inventory.exception;

public class DuplicateManufacturerNameException extends RuntimeException {
    public DuplicateManufacturerNameException(String name) {
        super("Manufacturer name already exists: " + name);
    }
}
