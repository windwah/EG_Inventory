package com.egate.inventory.controller.rest;

import com.egate.inventory.entity.AppUser;
import com.egate.inventory.entity.Role;
import com.egate.inventory.repository.AppUserRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.SecurityContextRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Session based login for the React SPA.
 *
 * <p>{@code POST /api/auth/login} authenticates a database user and stores the
 * {@link SecurityContext} in the HTTP session, {@code GET /api/auth/me} reports the
 * current principal, and {@code POST /api/auth/logout} is handled by Spring Security
 * (see {@code SecurityConfig}).
 */
@RestController
@RequestMapping("/api/auth")
public class AuthRestController {

    private final AuthenticationManager authenticationManager;
    private final SecurityContextRepository securityContextRepository;
    private final AppUserRepository appUserRepository;

    public AuthRestController(AuthenticationManager authenticationManager,
                              SecurityContextRepository securityContextRepository,
                              AppUserRepository appUserRepository) {
        this.authenticationManager = authenticationManager;
        this.securityContextRepository = securityContextRepository;
        this.appUserRepository = appUserRepository;
    }

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> login(@Valid @RequestBody LoginPayload payload,
                                                     HttpServletRequest request,
                                                     HttpServletResponse response) {
        try {
            Authentication authentication = authenticationManager.authenticate(
                    UsernamePasswordAuthenticationToken.unauthenticated(payload.username, payload.password));

            SecurityContext context = SecurityContextHolder.createEmptyContext();
            context.setAuthentication(authentication);
            SecurityContextHolder.setContext(context);
            securityContextRepository.saveContext(context, request, response);

            return ResponseEntity.ok(toView(authentication));
        } catch (BadCredentialsException ex) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(message("Invalid username or password."));
        } catch (AuthenticationException ex) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(message("Login failed: " + ex.getMessage()));
        }
    }

    @GetMapping("/me")
    public ResponseEntity<Map<String, Object>> me(Authentication authentication) {
        if (authentication == null
                || !authentication.isAuthenticated()
                || authentication instanceof AnonymousAuthenticationToken) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(message("Not authenticated."));
        }
        return ResponseEntity.ok(toView(authentication));
    }

    private Map<String, Object> toView(Authentication authentication) {
        String username = authentication.getName();
        AppUser user = appUserRepository.findByUsernameIgnoreCase(username).orElse(null);

        String role = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .filter(authority -> authority.startsWith("ROLE_"))
                .findFirst()
                .orElseGet(() -> user != null && user.getRole() != null ? user.getRole().name() : null);

        String displayName = user != null && user.getDisplayName() != null && !user.getDisplayName().isBlank()
                ? user.getDisplayName()
                : username;

        Map<String, Object> m = new LinkedHashMap<>();
        m.put("username", username);
        m.put("displayName", displayName);
        m.put("role", role);
        m.put("roleLabel", labelFor(role));
        m.put("authenticated", true);
        return m;
    }

    private String labelFor(String role) {
        if (role == null) {
            return null;
        }
        for (Role candidate : Role.values()) {
            if (candidate.name().equals(role)) {
                return candidate.getLabel();
            }
        }
        return role;
    }

    private Map<String, Object> message(String text) {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("message", text);
        return m;
    }

    public static class LoginPayload {
        @NotBlank(message = "Username must not be blank")
        @Size(max = 64, message = "Username must not exceed 64 characters")
        public String username;

        @NotBlank(message = "Password must not be blank")
        @Size(max = 128, message = "Password must not exceed 128 characters")
        public String password;
    }
}
