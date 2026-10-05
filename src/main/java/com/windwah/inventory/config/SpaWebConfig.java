package com.windwah.inventory.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SpaWebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:5173")
                .allowedMethods("*")
                .allowedHeaders("*")
                .allowCredentials(false)
                .maxAge(3600);
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/{seg1:[\\w\\-]+}")
                .setViewName("forward:/index.html");
        registry.addViewController("/{seg1:[\\w\\-]+}/{seg2:[\\w\\-]+}")
                .setViewName("forward:/index.html");
        registry.addViewController("/{seg1:[\\w\\-]+}/{seg2:[\\w\\-]+}/{seg3:[\\w\\-]+}")
                .setViewName("forward:/index.html");
    }
}
