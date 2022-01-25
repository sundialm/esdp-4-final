package com.example.demo.controllers;

import com.example.demo.services.TaskService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@AllArgsConstructor
public class DiagramController {

    TaskService tServ;

    @PostMapping("/addTask")
    public String addTask(@RequestParam() Boolean taskType, @RequestParam String name
            , @RequestParam String date, @RequestParam String materials
            , @RequestParam Integer area, @RequestParam Integer work, @RequestParam String parents
            , @RequestParam String user, @RequestParam String brigade, @RequestParam String equipment, @RequestParam Integer numberOfPeople
    ){

        tServ.addTask( name, user, taskType
                , brigade, equipment, area
                , work, materials, parents, date, numberOfPeople
        );

        return "redirect:/diagram";
    }

}
