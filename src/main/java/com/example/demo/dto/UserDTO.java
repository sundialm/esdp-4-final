package com.example.demo.dto;

import com.example.demo.entities.User;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


@Data
@Builder(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class UserDTO {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;


    @Email
    @NotBlank
    private String email;


    @NotBlank
    @Size(min =10, max = 100)
    private String password;


    @Size( max = 100)
    @NotBlank
    @Pattern(regexp = "^[^\\d\\s]+$", message = "Name should contain only letters")
    private String firstName;


    @Size( max = 100)
    @NotBlank
    @Pattern(regexp = "^[^\\d\\s]+$", message = "Name should contain only letters")
    private String surName;


    @Size( max = 100)
    @NotBlank
    private String username;



    public static UserDTO from(User u){
        return builder()
                .id(u.getId())
                .email(u.getEmail())
                .firstName(u.getFirstName())
                .surName(u.getSurName())
                .username(u.getUsername())
                .password(u.getPassword())
                .build();
    }


}

