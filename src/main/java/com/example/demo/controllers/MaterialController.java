package com.example.demo.controllers;

import com.example.demo.dto.MaterialDTO;
import com.example.demo.entities.Material;
import com.example.demo.entities.Task;
import com.example.demo.repositories.MaterialsRepository;
import com.example.demo.services.MaterialService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;


@Controller
@RequiredArgsConstructor
public class MaterialController {

    private final MaterialService service;
    private final MaterialsRepository mRep;

    @GetMapping("/{id}")
    public String findOne(@PathVariable Integer id, Model model){
        model.addAttribute("material", service.findOne(id));
        return "redirect:/projectStructure";
    }

    @PostMapping("/updateMaterial/{id}")
    public String update(@PathVariable Integer id, MaterialDTO materialDTO){
        service.update(id, materialDTO);
        return "redirect:/projectStructure";
    }



    @PostMapping("/addMaterial")
    public String add(Model model, @Valid MaterialDTO form, BindingResult validationResult, RedirectAttributes attributes) {

        attributes.addFlashAttribute("material_form", form);

        if (validationResult.hasFieldErrors()) {
            attributes.addFlashAttribute("errors", validationResult.getFieldErrors());
            var materialDTOList = service.findAll().stream().map(MaterialDTO::from).collect(Collectors.toList());
            model.addAttribute("materials", materialDTOList);
            return "redirect:/projectStructure";
        } else{ service.add(form); }
        return "redirect:/projectStructure";
    }


    @ExceptionHandler(BindException.class)
    private ResponseEntity<Object> handleBindExceptionResponseEntity(BindException ex) {
        var apiFieldErrors = ex.getFieldErrors()
                .stream()
                .map(fe -> String.format("%s -> %s", fe.getField(), fe.getDefaultMessage()))
                .collect(toList());
        return ResponseEntity.unprocessableEntity()
                .body(apiFieldErrors);
    }


    @GetMapping("/deleteMaterial/{id}")
    public String delete(@PathVariable Integer id, Model model){

        Material material = mRep.findById(id).orElse(null);
        List<Task> tasks=material.getTasks();
        if(tasks.size()==0){
            model.addAttribute("issue", true);
            return "redirect:/projectStructure";
        }
        else{
            model.addAttribute("issue", false);
            service.delete(id);
            }
            return "redirect:/projectStructure";
    }
}

