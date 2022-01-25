package com.example.demo.repositories;

import com.example.demo.entities.Material;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MaterialsRepository extends JpaRepository<Material, Long> {
    Material findByName(String name);
    List<Material> findByParentIsNull();
    List<Material> findByParentIsNotNull();
}
