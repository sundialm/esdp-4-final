package com.example.demo.controllers;

import com.example.demo.dto.WorkDTO;
import com.example.demo.services.WorkService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;


@Controller
@AllArgsConstructor
public class WorkController {

    private final WorkService workService;


    @PostMapping("/addWork")
    public String add(Model model, @Valid WorkDTO form, BindingResult validationResult, RedirectAttributes attributes) {

        attributes.addFlashAttribute("work_form", form);

        if (validationResult.hasFieldErrors()) {
            attributes.addFlashAttribute("errors", validationResult.getFieldErrors());
            return "redirect:/projectStructure";
        }
        else{
            workService.add(form); }
        return "redirect:/projectStructure";
    }


    @PostMapping("/updateWork/{id}")
    public String update(Model model, @Valid WorkDTO form, @PathVariable Long id, BindingResult validationResult, RedirectAttributes attributes) {

        attributes.addFlashAttribute("work_form", form);

        if (validationResult.hasFieldErrors()) {
            attributes.addFlashAttribute("errors", validationResult.getFieldErrors());
            return "redirect:/projectStructure";
        }
        else{
            workService.update(id,form);
        }
        return "redirect:/projectStructure";
    }


    @GetMapping("/deleteWork/{id}")
    public String delete( @PathVariable Long id){
        workService.delete(id);

        return "redirect:/projectStructure";
    }

}

