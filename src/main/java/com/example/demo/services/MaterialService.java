package com.example.demo.services;

import com.example.demo.dto.MaterialDTO;
import com.example.demo.entities.Material;
import com.example.demo.entities.Task;
import com.example.demo.exceptions.NotFoundException;
import com.example.demo.exceptions.ResourceNotFoundException;
import com.example.demo.repositories.MaterialsRepository;
import com.example.demo.repositories.TaskRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@AllArgsConstructor
public class MaterialService {

    private final MaterialsRepository repository;
    private final TaskRepository taskRepository;

    public List<Material> findAll(){
        return repository.findAll();
    }

    public MaterialDTO findOne(Integer id){
        Material material = repository.findById(id).orElseThrow(() -> new NotFoundException("Material", id));
        return MaterialDTO.from(material);
    }

    public Material getOne(Integer id){
        return repository.findById(id).orElseThrow(() -> new NotFoundException("Material", id));
    }

    public MaterialDTO add(MaterialDTO materialDTO){
        Material material = Material.builder()
                .name(materialDTO.getName())
                .qty(materialDTO.getQty())
                .measurement(materialDTO.getMeasurement())
                .parent(repository.findById(materialDTO.getParentId()!=null? materialDTO.getParentId() : 0).orElse(null))
                .build();
        repository.save(material);
        return MaterialDTO.from(material);
    }

    public MaterialDTO update(Integer id, MaterialDTO materialDTO){
        Material material = getOne(id);
        material.setName(materialDTO.getName());
        material.setQty(materialDTO.getQty());
        material.setMeasurement(materialDTO.getMeasurement());
        repository.save(material);
        return MaterialDTO.from(material);
    }

    public String delete(Integer id){
        Material material = getOne(id);
        for (Material m: material.getChild()){
            delete(m.getId());
            repository.delete(m);
        }
        repository.delete(material);
        return "Успешно";
    }

}
