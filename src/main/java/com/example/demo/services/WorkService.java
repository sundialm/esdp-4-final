package com.example.demo.services;

import com.example.demo.dto.WorkDTO;
import com.example.demo.entities.Work;
import com.example.demo.exceptions.NotFoundException;
import com.example.demo.repositories.TaskRepository;
import com.example.demo.repositories.WorkRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class WorkService {
    private final WorkRepository repository;
    private final TaskRepository taskRepository;


    public List<Work> findAll(){
        return repository.findAll();
    }

    public WorkDTO findOne(Integer id){
        Work work = repository.findById(id).orElseThrow(() -> new NotFoundException("Area", id));
        return WorkDTO.from(work);
    }

    public Work getOne(Integer id){
        return repository.findById(id).orElseThrow(() -> new NotFoundException("Area", id));
    }

    public WorkDTO add(WorkDTO workDTO){
        Work work = Work.builder()
                .name(workDTO.getName())
                // нужно чтобы он брал айди того парента куда он собирается добавить ??
                .workParent(repository.findById(workDTO.getParentId()).orElse(null))
                .build();
        repository.save(work);
        return WorkDTO.from(work);
    }

    public WorkDTO update(Integer id, WorkDTO workDTO){

        Work work = getOne(id);
        work.setName(workDTO.getName());
        repository.save(work);
        return WorkDTO.from(work);

    }

    public void delete(Integer id){
        Work work =getOne(id);
        for (Work w: work.getWorkChild()){
            delete(w.getId());
            repository.delete(w);
        }
        repository.delete(work);
    }

}
