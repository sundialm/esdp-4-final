package com.example.demo.entities;

import lombok.*;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.List;
import java.util.Objects;

@Data
@Table(name = "materials")
@Entity

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Material {


    @Column
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Size( max = 100)
    @NotBlank
    @Pattern(regexp = "^[^\\d\\s]+$", message = "Name should contain only letters")
    @Column(length = 128)
    private String name;

    @Column
    @NotBlank
    private Long qty;


    @Size( max = 100)
    @NotBlank
    @Pattern(regexp = "^[^\\d\\s]+$", message = "Name should contain only letters")
    @Column(length = 128)
    private String measurement;

    @OneToMany(mappedBy= "parent",
            fetch = FetchType.EAGER)
    private List<Material> child;

    @ManyToOne(fetch = FetchType.LAZY)
    @Nullable
    private Material parent;

    @ManyToMany(mappedBy = "taskMaterials")
    private List<Task> tasks;

    @Override
    public String toString() {
        return "Material{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", qty=" + qty +
                ", measurement='" + measurement + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Material material = (Material) o;
        return id.equals(material.id) && name.equals(material.name) && qty.equals(material.qty) && measurement.equals(material.measurement);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, qty, measurement);
    }

}