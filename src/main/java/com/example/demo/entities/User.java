package com.example.demo.entities;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


@Data
@Table(name = "users")
@Entity

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class User {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @Email
    @NotBlank
    @Column(length = 128)
    private String email;

    @NotBlank
    @Size(min =10, max = 100)
    @Column(length = 128)
    private String password;


    @Size( max = 100)
    @NotBlank
    @Pattern(regexp = "^[^\\d\\s]+$", message = "Name should contain only letters")
    @Column(length = 128)
    private String firstName;



    @Size( max = 100)
    @NotBlank
    @Pattern(regexp = "^[^\\d\\s]+$", message = "Name should contain only letters")
    @Column(length = 128)
    private String surName;



    @Size( max = 100)
    @NotBlank
    @Column(length = 128)
    private String username;


//    @ManyToMany(mappedBy = "userRoles")
//    List<Role> roles;

}
