package com.windwah.inventory.exception;

public class DuplicateBrandNameException extends RuntimeException {
    public DuplicateBrandNameException(String name) {
        super("Brand name already exists: " + name);
    }
}
