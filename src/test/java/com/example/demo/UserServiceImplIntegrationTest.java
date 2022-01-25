package com.example.demo;

import com.example.demo.repositories.UserRepository;
import com.example.demo.services.UserService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
@Slf4j
public class UserServiceImplIntegrationTest {

    @Autowired
    private UserRepository repository;

    @Autowired
    private UserService service;

    @Test
    public void test1(){

    }
}
