package com.example.demo.dto;

import com.example.demo.entities.*;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Data
@Builder(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class TaskDTO {

    private Long id;

    private String name;

    private String user;

    private Boolean milestone;

    private String brigade;

    private long delta;

    private String equipment;

    private int numberOfPeople;

    private String comment;

    private Boolean opened;

    private String defaultComment;

    private LocalDate startDate;

    private LocalDate finishDate;

    private TaskStatus status;

    private List<Material> taskMaterials;

    private List<Task> parents;

    private List<Task> children;

    private Area area;

    private Work work;

    public static TaskDTO from(Task task) {
        return TaskDTO.builder()
                .id(task.getId())
                .name(task.getName())
                .user(task.getUser())
                .brigade(task.getBrigade())
                .milestone(task.getMilestone())
                .brigade(task.getBrigade())
                .delta(task.getDelta())
                .equipment(task.getEquipment())
                .numberOfPeople(task.getNumberOfPeople())
                .comment(task.getComment())
                .opened(task.getOpened())
                .defaultComment(task.getDefault_comment())
                .startDate(task.getStartDate())
                .finishDate(task.getFinishDate())
                .status(task.getStatus())
                .parents(task.getParents())
                .children(task.getChildren())
                .taskMaterials(task.getTaskMaterials())
                .area(task.getArea())
                .work(task.getWork())
                .build();



    }
}
