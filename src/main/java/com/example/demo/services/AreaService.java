package com.example.demo.services;

import com.example.demo.dto.AreaDTO;
import com.example.demo.entities.Area;
import com.example.demo.exceptions.NotFoundException;
import com.example.demo.exceptions.ResourceNotFoundException;
import com.example.demo.repositories.AreaRepository;
import com.example.demo.repositories.TaskRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class AreaService {
    private final AreaRepository repository;
    private final TaskRepository taskRepository;


    public List<Area> findAll(){
        return repository.findAll();
    }

    public AreaDTO findOne(Integer id){
        Area area = repository.findById(id).orElseThrow(() -> new NotFoundException("Area", id));
        return AreaDTO.from(area);
    }

    public Area getOne(Integer id){
        return repository.findById(id).orElseThrow(() -> new NotFoundException("Area", id));
    }

    public AreaDTO add(AreaDTO areaDTO){
        Area area = Area.builder()
                .name(areaDTO.getName())
                .height(areaDTO.getHeight())
                // нужно чтобы он брал айди того парента куда он собирается добавить ??
                .parent(repository.findById(areaDTO.getParentId()).orElse(null))
                .build();
        repository.save(area);
        return AreaDTO.from(area);
    }

    public AreaDTO update(Integer id, AreaDTO areaDTO){

        Area area = getOne(id);
        area.setName(areaDTO.getName());
        area.setHeight(area.getHeight());
        repository.save(area);
        return AreaDTO.from(area);

    }

    public void delete(Integer id){
        Area area = getOne(id);
        for (Area a: area.getSubAreas()){
            delete(a.getId());
            repository.delete(a);
        }
        repository.delete(area);
    }

}