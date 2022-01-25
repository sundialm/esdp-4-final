package com.example.demo.services;




import com.example.demo.dto.UserDTO;

import com.example.demo.entities.User;


import com.example.demo.exceptions.UserExistsException;

import com.example.demo.repositories.UserRepository;
import com.example.demo.registrationForms.UserRegistrationForm;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UserService {


    private final UserRepository uRep;
    PasswordEncoder encoder;


    public User createUser(UserRegistrationForm urf){
        if(uRep.existsByEmail(urf.getEmail())){
            throw new UserExistsException();
        }

        String username= String.format("%s.%s@%s", urf.getFirstName(),urf.getSurName().charAt(0),urf.getFirmName());

        User user = User.builder()
                .firstName(urf.getFirstName())
                .surName(urf.getSurName())
                .username(username)
                .email(urf.getEmail())
                .password(encoder.encode(urf.getPassword()))
                .build();

        uRep.save(user);
        return user;
    }

    public List<UserDTO> getUsers(){
        return uRep.findAll().stream().map(UserDTO::from).collect(Collectors.toList());
    }



    public Page<UserDTO> getUsers(Pageable pageable) {
        return uRep.findAll(pageable)
                .map(UserDTO::from);
    }

    public Page<UserDTO> getUser(String email, Pageable pageable){
        return uRep.findByEmail(email,pageable)
                .map(UserDTO::from);

    }
}
