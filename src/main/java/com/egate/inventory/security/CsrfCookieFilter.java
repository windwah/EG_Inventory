package com.egate.inventory.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.web.csrf.CsrfTokenRepository;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

/**
 * Forces the deferred CSRF token to be resolved on every request so that the
 * XSRF-TOKEN cookie is always written. The React SPA (axios) reads that cookie and
 * echoes it back in the X-XSRF-TOKEN header, as expected by
 * {@link SpaCsrfTokenRequestHandler}.
 *
 * <p>Not a {@code @Component} on purpose: it must only run inside the Spring Security
 * filter chain, not as a globally registered servlet filter.</p>
 */
class CsrfCookieFilter extends OncePerRequestFilter {

    private final CsrfTokenRepository csrfTokenRepository;

    CsrfCookieFilter(CsrfTokenRepository csrfTokenRepository) {
        this.csrfTokenRepository = csrfTokenRepository;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        csrfTokenRepository.loadDeferredToken(request, response).get();
        filterChain.doFilter(request, response);
    }
}
