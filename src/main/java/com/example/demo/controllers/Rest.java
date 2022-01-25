package com.example.demo.controllers;

import com.example.demo.entities.Work;
import com.example.demo.repositories.WorkRepository;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@CrossOrigin
public class Rest {

    private final WorkRepository repository;

    @GetMapping("/api/getWorks")
    public List<Work> getAll(){
        return repository.findByWorkParentIsNull();
    }


//    @PostMapping("/add/area")
//    public  addArea(){
//        return repository.findByWorkParentIsNull();
//    }

}
