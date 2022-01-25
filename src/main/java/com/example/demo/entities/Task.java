package com.example.demo.entities;


import lombok.*;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.*;

@Getter
@Setter
@Table(name = "tasks")
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Task {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Email
    @NotBlank
    @Column(length = 100)
    private String name;

    @NotBlank
    @Column
    private LocalDate finishDate;

    @NotBlank
    @Column
    private LocalDate startDate;

    @ColumnDefault("none")
    @NotBlank
    @Column(length = 100, columnDefinition="COLUMN_TYPE")
    private String user;

    @ColumnDefault("none")
    @NotBlank
    @Column(length = 100, columnDefinition="COLUMN_TYPE")
    private String brigade;

    @ColumnDefault("none")
    @NotBlank
    @Column(length = 100, columnDefinition="COLUMN_TYPE")
    private String equipment;

    @NotBlank
    @Size(max=5, min=1)
    private Integer numberOfPeople;

    @Column
    private long delta;

    @Enumerated(EnumType.ORDINAL)
    private TaskStatus status = TaskStatus.IN_PROGRESS;

    @Column
    private Boolean milestone;

    @Column
    private String comment;

    @Column
    private Boolean opened;

    @Column
    private String default_comment;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "task_materials",
            joinColumns = @JoinColumn(name = "task_id"),
            inverseJoinColumns = @JoinColumn(name = "materials_id"))
    private List<Material> taskMaterials;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "tasks_parents",
            joinColumns = @JoinColumn(name = "children_id"),
            inverseJoinColumns = @JoinColumn(name ="parent_id" ))
    private List<Task> parents;

    @ManyToMany(mappedBy="parents", fetch = FetchType.EAGER)
    private List<Task> children;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "area_id")
    private Area area;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "work_id")
    private Work work;



    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Task task = (Task) o;
        return Objects.equals(id, task.id) && Objects.equals(name, task.name) && Objects.equals(finishDate, task.finishDate)  && Objects.equals(user, task.user) && Objects.equals(brigade, task.brigade) && Objects.equals(equipment, task.equipment) && Objects.equals(taskMaterials, task.taskMaterials) && Objects.equals(parents, task.parents) && Objects.equals(children, task.children) && Objects.equals(area, task.area) && Objects.equals(work, task.work) && Objects.equals(status, task.status);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, finishDate,  user, brigade, equipment, taskMaterials, parents, children, area, work);
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", finishDate=" + finishDate +
                ", user='" + user + '\'' +
                ", brigade='" + brigade + '\'' +
                ", equipment='" + equipment + '\'' +
                ", numberOfPeople=" + numberOfPeople +
                ", status=" + status +
                ", area=" + area +
                ", work=" + work +
                '}';
    }
}
