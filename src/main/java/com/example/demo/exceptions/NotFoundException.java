package com.example.demo.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code = HttpStatus.NOT_FOUND)
public class NotFoundException extends RuntimeException{

    private String resource;
    private long id;
    private String email;

    public NotFoundException(String resource, Long id) {
        super();
        this.resource = resource;
        this.id = id;
    }

    public NotFoundException(String resource, String email) {
        super();
        this.resource = resource;
        this.email = email;
    }

}
