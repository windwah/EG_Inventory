package com.egate.inventory.config;

import com.egate.inventory.entity.Role;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Creates the first administrator account on startup, so a fresh deployment has a
 * way in before any user exists. Disabled by default; enable it and supply a
 * password (ideally through an environment variable) for the very first run.
 */
@ConfigurationProperties(prefix = "app.security.bootstrap")
public class SecurityBootstrapProperties {

    private boolean enabled = false;
    private String username = "admin";
    private String password = "";
    private String displayName = "E-Gate Administrator";
    private Role role = Role.ROLE_ADMIN;

    public boolean isEnabled() { return enabled; }
    public void setEnabled(boolean enabled) { this.enabled = enabled; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getDisplayName() { return displayName; }
    public void setDisplayName(String displayName) { this.displayName = displayName; }

    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }
}
