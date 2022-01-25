package com.example.demo.entities;


import lombok.*;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Set;

@Data
@Table(name = "roles")
@Entity

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Role {

    @Column
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;


    @Size( max = 100)
    @NotBlank
    @Pattern(regexp = "^[^\\d\\s]+$", message = "Name should contain only letters")
    @Column(length = 128)
    private String name;


    @Size( max = 100)
    @NotBlank
    @Pattern(regexp = "^[^\\d\\s]+$", message = "Name should contain only letters")
    @Column(length = 128)
    private String description;

    @ManyToMany
    @JoinTable(
            name = "user_roles",
            joinColumns = @JoinColumn(name = "role_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id"))
    Set<User> userRoles;
}
