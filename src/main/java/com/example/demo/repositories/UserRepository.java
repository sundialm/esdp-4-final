package com.example.demo.repositories;


import com.example.demo.entities.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Integer> {
    boolean existsByEmail(String email);
    Page<User> findByEmail(String email, Pageable pageable);
    Optional<User> findByEmail(String email);
    User findUserByEmail(String email);



}
