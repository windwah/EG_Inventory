package com.windwah.inventory.config;

import com.windwah.inventory.exception.DuplicateSkuException;
import com.windwah.inventory.exception.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import java.time.Instant;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(ResourceNotFoundException.class)
    public ResponseEntity<Map<String, Object>> handleNotFound(ResourceNotFoundException ex, WebRequest request) {
        Map<String, Object> body = errorBody(HttpStatus.NOT_FOUND, ex.getMessage(), request);
        body.put("resource", ex.getResource());
        body.put("identifier", ex.getIdentifier());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(body);
    }

    @ExceptionHandler(DuplicateSkuException.class)
    public ResponseEntity<Map<String, Object>> handleDuplicateSku(DuplicateSkuException ex, WebRequest request) {
        Map<String, Object> body = errorBody(HttpStatus.BAD_REQUEST, ex.getMessage(), request);
        body.put("sku", ex.getSku());
        body.put("fieldErrors", List.of(fieldError("sku", ex.getSku(), "SKU already exists")));
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(body);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<Map<String, Object>> handleValidation(MethodArgumentNotValidException ex, WebRequest request) {
        List<Map<String, Object>> fieldErrors = ex.getBindingResult().getFieldErrors().stream()
                .map(this::fieldError)
                .collect(Collectors.toList());
        Map<String, Object> body = errorBody(HttpStatus.BAD_REQUEST, "Validation failed", request);
        body.put("fieldErrors", fieldErrors);
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(body);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<Map<String, Object>> handleGeneric(Exception ex, WebRequest request) {
        Map<String, Object> body = errorBody(HttpStatus.INTERNAL_SERVER_ERROR, ex.getMessage(), request);
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(body);
    }

    private Map<String, Object> errorBody(HttpStatus status, String message, WebRequest request) {
        Map<String, Object> body = new LinkedHashMap<>();
        body.put("timestamp", Instant.now().toString());
        body.put("status", status.value());
        body.put("error", status.getReasonPhrase());
        body.put("message", message);
        body.put("path", request.getDescription(false).replace("uri=", ""));
        return body;
    }

    private Map<String, Object> fieldError(FieldError fe) {
        return fieldError(fe.getField(), fe.getRejectedValue(), fe.getDefaultMessage());
    }

    private Map<String, Object> fieldError(String field, Object rejectedValue, String message) {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("field", field);
        m.put("rejectedValue", rejectedValue);
        m.put("message", message);
        return m;
    }
}
