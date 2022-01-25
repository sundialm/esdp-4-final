package com.example.demo.exceptions;

import lombok.Getter;
import lombok.Setter;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND)
@Getter @Setter
public class ResourceNotFoundException extends RuntimeException {

    private String resource;
    private Integer id;
    private String email;

    public ResourceNotFoundException(String resource, Integer id) {
        super();
        this.resource = resource;
        this.id = id;
    }

    public ResourceNotFoundException(String resource, String email) {
        super();
        this.resource = resource;
        this.email = email;
    }
}
