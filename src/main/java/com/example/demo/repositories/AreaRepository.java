package com.example.demo.repositories;


import com.example.demo.entities.Area;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AreaRepository extends JpaRepository<Area, Long> {
    Area getByIdOrIdIsNull(Long id);
    List<Area> findByParentIsNotNull();
    List<Area> findByParentIsNull();
}