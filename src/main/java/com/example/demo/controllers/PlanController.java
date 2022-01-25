package com.example.demo.controllers;


import com.example.demo.dto.TaskDTO;
import com.example.demo.entities.Task;
import com.example.demo.entities.TaskStatus;
import com.example.demo.repositories.TaskRepository;
import com.example.demo.services.TaskService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.stream.Collectors;

@Controller
@AllArgsConstructor
public class PlanController {
    private TaskRepository tRep;
    private TaskService tServ;


    @PostMapping("/updateTask/{id}")
    public String updateTask(@PathVariable Integer id,
                             @RequestParam String today,
                             @RequestParam(required = false) String comment,
                             @RequestParam(required = false) String default_comment,
                             @RequestParam String status,
                             @RequestParam(required = false) String date,
                             @RequestParam(required = false) Integer checkbox){
        Task t=tRep.findById(id).orElse(null);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        if(date!=null&&!date.isBlank()) {
            LocalDate finishDate= LocalDate.parse(date,formatter);
            t.setFinishDate(finishDate);
        }
        else
        t.setFinishDate(LocalDate.parse(today,formatter));
        Integer difference = Math.toIntExact(Duration.between(t.getFinishDate().atStartOfDay(), t.getStartDate().atStartOfDay()).toDays());
        t.setDelta(t.getDelta()+difference);
        t.setStatus(TaskStatus.valueOf(status));
        if(comment!=null&&default_comment!=null){
            t.setComment(comment);
            t.setDefault_comment(default_comment);
        }
        t.setOpened(false);
        t.setStatus(TaskStatus.DONE);
        if(checkbox!=null){
        if (checkbox==1)
        t.setStatus(TaskStatus.DONE_LATE);
        if (checkbox==2) {
                 t.setStatus(TaskStatus.LATE_WITH_SHIFT);
                 tServ.cascadeChangeDelta(difference,t);
                 tRep.save(t);
        return "redirect:/plan";
                }}
        tRep.save(t);
        return "redirect:/plan";
    }

    @GetMapping("/dateChange")
    public String changeDate(String date, String date_default, Model model, Principal principal){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalDate localDate=null;
        if (!(date.isBlank()))
            localDate=LocalDate.parse(date,formatter);
        else
            localDate=LocalDate.parse(date_default,formatter);

        var list = tRep.findByStartDateOrFinishDateEquals(localDate,localDate).stream().map(TaskDTO::from).collect(Collectors.toList());
        var listOutdone= tRep.findByStatusAndStartDateOrFinishDate(TaskStatus.DONE_PREMATURELY,localDate,localDate).stream().map(TaskDTO::from).collect(Collectors.toList());
        var listFull= tRep.findAllByStartDateAfterAndOpened(localDate,false).stream().map(TaskDTO::from).collect(Collectors.toList());

        model.addAttribute("tasks",list);
        model.addAttribute("username", principal.getName());
        model.addAttribute("today", localDate);
        model.addAttribute("outdone",listOutdone);
        model.addAttribute("fullTask", listFull);

        return "production_plan";

    }

    @GetMapping("/reopenTask/{id}")
    public String reopen(@PathVariable Integer id){
        Task t=tRep.findById(id).orElse(null);
        Integer difference = Math.toIntExact(Duration.between(t.getFinishDate().atStartOfDay(), t.getStartDate().atStartOfDay()).toDays());
        if(t.getStatus()==TaskStatus.LATE_WITH_SHIFT){
            tServ.cascadeReverseDelta(difference,t);
        }
        t.setDelta(t.getDelta()-difference);
        t.setOpened(true);
        t.setFinishDate(null);
        t.setStatus(TaskStatus.IN_PROGRESS);
        t.setDefault_comment(null);
        if(Duration.between(t.getStartDate().atStartOfDay(),LocalDate.now().atStartOfDay()).toDays()<0)
            t.setStatus(TaskStatus.DONE_LATE);
        tRep.save(t);
        return "redirect:/plan";}


    @PostMapping("/addOutdone")
    public String addOutdone(@RequestParam String selected_tasks){
        tServ.addOutdone(selected_tasks);

        return  "redirect:/plan";
    }
}
