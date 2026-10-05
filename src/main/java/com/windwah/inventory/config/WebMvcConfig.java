package com.windwah.inventory.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Serve doc/extracted_images/*.png/jpg as static files under /extracted_images/**
        // (418 product images from E-Gate offer 06.2026.xlsx)
        Path extImagesDir = Paths.get("doc", "extracted_images").toAbsolutePath().normalize();
        registry.addResourceHandler("/extracted_images/**")
                .addResourceLocations("file:/" + extImagesDir.toString().replace("\\", "/") + "/");
    }
}
