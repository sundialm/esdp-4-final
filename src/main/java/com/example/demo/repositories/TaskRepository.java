package com.example.demo.repositories;


import com.example.demo.entities.Area;
import com.example.demo.entities.Material;
import com.example.demo.entities.Task;
import com.example.demo.entities.TaskStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.validation.constraints.NotBlank;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface TaskRepository extends JpaRepository<Task, Integer> {

    List<Task> findByParentsIsNull();
    List<Task> findAllByStartDateAfterAndOpened(LocalDate localDate,Boolean b);
    List<Task> findByStartDateOrFinishDateEquals(LocalDate date,LocalDate dateToday);
    List<Task> findByStatusAndStartDateOrFinishDate(TaskStatus status, LocalDate startDate, LocalDate finishDate);
    List<Task> findAllByOpened(Boolean b);
}