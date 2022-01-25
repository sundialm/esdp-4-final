package com.example.demo.controllers;

import com.example.demo.dto.AreaDTO;
import com.example.demo.dto.MaterialDTO;
import com.example.demo.dto.TaskDTO;
import com.example.demo.dto.WorkDTO;
import com.example.demo.entities.Task;
import com.example.demo.entities.TaskStatus;
import com.example.demo.repositories.AreaRepository;
import com.example.demo.repositories.MaterialsRepository;
import com.example.demo.repositories.TaskRepository;
import com.example.demo.repositories.WorkRepository;
import com.example.demo.services.AreaService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.stream.Collectors;

@Controller
@AllArgsConstructor
public class MainController {


    private WorkRepository wRep;
    private AreaRepository aRep;
    private MaterialsRepository mRep;
    private TaskRepository tRep;

    @GetMapping("")
    public String index() {

        return "main";
    }

    @GetMapping("/login")
    public String login(){
        return "main";
    }

    @GetMapping("/projectStructure")
    public String projectStructure(Model model,
                                   Principal principal) {


        var areaDTOList = aRep.findByParentIsNull().stream().map(AreaDTO::from).collect(Collectors.toList());
        var materialDTOList = mRep.findByParentIsNull().stream().map(MaterialDTO::from).collect(Collectors.toList());
        var workDTOList = wRep.findByWorkParentIsNull().stream().map(WorkDTO::from).collect(Collectors.toList());

        model.addAttribute("works", workDTOList);
        model.addAttribute("materials",materialDTOList);
        model.addAttribute("areas", areaDTOList);
        model.addAttribute("username", principal.getName());
        return "projectStructure";
    }


    @GetMapping("/diagram")
    public String getDiagramPage(Model model,
                                 Principal principal){
        var areaDTOList = aRep.findByParentIsNotNull().stream().map(AreaDTO::from).collect(Collectors.toList());
        var materialDTOList = mRep.findByParentIsNotNull().stream().map(MaterialDTO::from).collect(Collectors.toList());
        var workDTOList = wRep.findByWorkParentIsNotNull().stream().map(WorkDTO::from).collect(Collectors.toList());
        var listOfAllTasks =tRep.findAllByOpened(false)
                .stream().map(TaskDTO::from).collect(Collectors.toList());
        model.addAttribute("tasks", listOfAllTasks);
        model.addAttribute("works", workDTOList);
        model.addAttribute("materials",materialDTOList);
        model.addAttribute("areas", areaDTOList);
        model.addAttribute("username", principal.getName());
        return "diagram_page";
    }

    @GetMapping("/plan")
    public String getProductionPlan(Model model, Principal principal){
        LocalDate today= LocalDate.now();

        var listFull= tRep.findAllByStartDateAfterAndOpened(today,true).stream().map(TaskDTO::from).collect(Collectors.toList());
        var list = tRep.findByStartDateOrFinishDateEquals(today,today).stream().map(TaskDTO::from).collect(Collectors.toList());
        var listOutdone= tRep.findByStatusAndStartDateOrFinishDate(TaskStatus.DONE_PREMATURELY,today,today).stream().map(TaskDTO::from).collect(Collectors.toList());

        model.addAttribute("tasks",list);
        model.addAttribute("username", principal.getName());
        model.addAttribute("today", today);
        model.addAttribute("outdone",listOutdone);
        model.addAttribute("fullTask", listFull);

        return "production_plan";
    }

    @GetMapping("/analytic")
    public String analytic(Principal principal, Model model){

        var listOfAllTasks =tRep.findAllByOpened(false)
                .stream().map(TaskDTO::from).collect(Collectors.toList());
        model.addAttribute("tasks", listOfAllTasks);
        model.addAttribute("username",principal.getName());
        return "analytic";
    }

}
