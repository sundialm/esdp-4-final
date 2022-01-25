package com.example.demo.controllers;



import com.example.demo.dto.AreaDTO;
import com.example.demo.services.AreaService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.stream.Collectors;


@Controller
@AllArgsConstructor
public class AreaController {

    private final AreaService areaService;


    @PostMapping("/addArea")
    public String add(Model model, @Valid AreaDTO form, BindingResult validationResult, RedirectAttributes attributes) {

        attributes.addFlashAttribute("area_form", form);

        if (validationResult.hasFieldErrors()) {
            attributes.addFlashAttribute("errors", validationResult.getFieldErrors());
            return "redirect:/projectStructure";
        }
        else{
            areaService.add(form); }
        return "redirect:/projectStructure";
    }


    @PostMapping("/updateArea/{id}")
    public String update(Model model, @Valid AreaDTO form, @PathVariable Integer id, BindingResult validationResult, RedirectAttributes attributes) {

        attributes.addFlashAttribute("area_form", form);

        if (validationResult.hasFieldErrors()) {
            attributes.addFlashAttribute("errors", validationResult.getFieldErrors());
            return "redirect:/projectStructure";
        }
        else{
            areaService.update(id,form);
        }
        return "redirect:/projectStructure";
    }


    @GetMapping("/deleteArea/{id}")
    public String delete( @PathVariable Integer id){
        areaService.delete(id);

        return "redirect:/projectStructure";
    }
}
