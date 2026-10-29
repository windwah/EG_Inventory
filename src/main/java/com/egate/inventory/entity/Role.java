package com.egate.inventory.entity;

/**
 * Application access levels, from highest to lowest privilege.
 */
public enum Role {

    /** Full control: deletes records and submits inventory to marketplaces. */
    ROLE_ADMIN("Administrator"),

    /** Maintains product / brand / manufacturer data and may export. */
    ROLE_EDITOR("Editor"),

    /** Read-only access: may view lists and download export files. */
    ROLE_VIEWER("Viewer");

    private final String label;

    Role(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}
