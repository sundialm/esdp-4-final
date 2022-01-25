package com.example.demo.controllers;



import com.example.demo.services.UserService;
import com.example.demo.registrationForms.UserRegistrationForm;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;




@Controller
@RequestMapping
@AllArgsConstructor
public class UserController {
    UserService userService;

    @PostMapping("/register")
    public String registerUser(@Valid UserRegistrationForm form,
                               BindingResult validationResult,
                               RedirectAttributes attributes){

        attributes.addFlashAttribute("dto", form);

        if(validationResult.hasFieldErrors()){

            attributes.addFlashAttribute("errors", validationResult.getFieldErrors());

            return "redirect:/register";
        }
        userService.createUser(form);
        return "redirect:/";
    }


    @GetMapping("/register")
    public String registerUser(Model model){
        if(!model.containsAttribute("dto"))
            model.addAttribute("dto", new UserRegistrationForm());
        return "register";
    }
}


