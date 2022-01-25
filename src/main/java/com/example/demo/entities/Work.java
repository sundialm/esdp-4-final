package com.example.demo.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;


@Getter
@Setter
@Table(name = "works")
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Work {


    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(length = 128)
    private String name;

    @OneToMany(mappedBy="workParent", fetch = FetchType.EAGER)
    private List<Work> workChild;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY,cascade = CascadeType.PERSIST)
    private Work workParent;

    @JsonIgnore
    @OneToMany(mappedBy = "work")
    List<Task> tasks;

    @Override
    public String toString() {
        return "Work{" +
                "id=" + id +
                ", name='" + name + '\'' +
//                ", subWork=" + workChild +

                '}';
    }

}
