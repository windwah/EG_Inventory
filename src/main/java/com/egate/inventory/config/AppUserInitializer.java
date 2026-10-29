package com.egate.inventory.config;

import com.egate.inventory.entity.AppUser;
import com.egate.inventory.repository.AppUserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

/**
 * Seeds the initial administrator account described by
 * {@link SecurityBootstrapProperties}. Runs only when bootstrap is enabled and the
 * username does not already exist, so restarts never overwrite a changed password.
 */
@Component
@Profile("!test")
public class AppUserInitializer implements ApplicationRunner {

    private static final Logger log = LoggerFactory.getLogger(AppUserInitializer.class);

    private final SecurityBootstrapProperties properties;
    private final AppUserRepository appUserRepository;
    private final PasswordEncoder passwordEncoder;

    public AppUserInitializer(SecurityBootstrapProperties properties,
                              AppUserRepository appUserRepository,
                              PasswordEncoder passwordEncoder) {
        this.properties = properties;
        this.appUserRepository = appUserRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(ApplicationArguments args) {
        if (!properties.isEnabled()) {
            return;
        }

        String username = properties.getUsername();
        if (username == null || username.isBlank()) {
            log.warn("app.security.bootstrap.enabled=true but no username is configured; "
                    + "no administrator account was created.");
            return;
        }

        if (appUserRepository.existsByUsernameIgnoreCase(username)) {
            log.info("Bootstrap user '{}' already exists; skipping creation.", username);
            return;
        }

        String password = properties.getPassword();
        if (password == null || password.isBlank()) {
            log.warn("app.security.bootstrap.enabled=true but no password is configured. Set "
                    + "APP_BOOTSTRAP_PASSWORD (or app.security.bootstrap.password) and restart to "
                    + "create the '{}' account.", username);
            return;
        }

        AppUser user = new AppUser();
        user.setUsername(username.trim());
        user.setPasswordHash(passwordEncoder.encode(password));
        user.setDisplayName(properties.getDisplayName());
        user.setRole(properties.getRole());
        user.setEnabled(true);
        appUserRepository.save(user);

        log.info("Created bootstrap {} account '{}'. Change the password after the first login.",
                properties.getRole(), username);
    }
}
