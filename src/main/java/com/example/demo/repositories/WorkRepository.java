package com.example.demo.repositories;

import com.example.demo.entities.Work;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkRepository extends JpaRepository<Work, Long> {
    Work findByName (String name);
    List<Work> findByWorkParentIsNull();
    List<Work> findByWorkParentIsNotNull();

}
