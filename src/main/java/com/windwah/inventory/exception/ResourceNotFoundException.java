package com.windwah.inventory.exception;

public class ResourceNotFoundException extends RuntimeException {

    private final String resource;
    private final String identifier;

    public ResourceNotFoundException(String resource, String identifier) {
        super(resource + " not found: " + identifier);
        this.resource = resource;
        this.identifier = identifier;
    }

    public ResourceNotFoundException(String resource, Long identifier) {
        this(resource, String.valueOf(identifier));
    }

    public String getResource() { return resource; }
    public String getIdentifier() { return identifier; }
}
