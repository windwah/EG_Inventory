package com.windwah.inventory.config;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Profile;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Set;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
@Profile("!test")
public class SpaForwardFilter extends OncePerRequestFilter {

    private static final Set<String> STATIC_EXTENSIONS = Set.of(
            ".js", ".css", ".png", ".jpg", ".jpeg", ".gif", ".svg",
            ".ico", ".woff", ".woff2", ".ttf", ".eot", ".map",
            ".webp", ".bmp", ".pdf"
    );

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain)
            throws ServletException, IOException {

        String method = request.getMethod();
        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String path = uri.startsWith(contextPath) ? uri.substring(contextPath.length()) : uri;

        if (!"GET".equalsIgnoreCase(method)) {
            filterChain.doFilter(request, response);
            return;
        }

        if (path.startsWith("/api/") || path.equals("/api")) {
            filterChain.doFilter(request, response);
            return;
        }

        if (path.startsWith("/extracted_images/")) {
            filterChain.doFilter(request, response);
            return;
        }

        int lastSlash = path.lastIndexOf('/');
        String lastSegment = lastSlash >= 0 ? path.substring(lastSlash) : path;
        int dotIdx = lastSegment.lastIndexOf('.');
        if (dotIdx >= 0) {
            String ext = lastSegment.substring(dotIdx).toLowerCase();
            if (STATIC_EXTENSIONS.contains(ext)) {
                filterChain.doFilter(request, response);
                return;
            }
        }

        request.getRequestDispatcher("/index.html").forward(request, response);
    }
}
