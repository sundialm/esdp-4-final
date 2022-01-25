package com.example.demo.entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;

@Data
@Table(name = "areas")
@Entity
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Area {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank
    @Column(length = 128)
    private String name;

    @NotBlank
    @Size(min =10, max = 100)
    @Column(length = 128)
    private String height;


    @OneToMany(mappedBy= "parent",
    fetch = FetchType.EAGER)
    private List<Area> subAreas;

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    private Area parent;

    @OneToMany(mappedBy = "area")
    List<Task> tasks;

    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", height='" + height + '\'' +
                ", parent=" + (parent != null ? parent.getId() : null) +
//                ", tasks=" + tasks +
                '}';
    }
}