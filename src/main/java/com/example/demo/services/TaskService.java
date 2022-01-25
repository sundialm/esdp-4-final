package com.example.demo.services;

import com.example.demo.dto.TaskDTO;
import com.example.demo.entities.Material;
import com.example.demo.entities.Task;
import com.example.demo.entities.TaskStatus;
import com.example.demo.entities.Work;
import com.example.demo.exceptions.ResourceNotFoundException;
import com.example.demo.repositories.AreaRepository;
import com.example.demo.repositories.MaterialsRepository;
import com.example.demo.repositories.TaskRepository;
import com.example.demo.repositories.WorkRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class TaskService {
    private List<Task> checkList=new ArrayList<>();
    private final TaskRepository repository;
    private final AreaRepository aRep;
    private final WorkRepository wRep;
    private final MaterialsRepository mRep;
    public List<Task> findAll(){
        return repository.findAll();
    }

    public TaskDTO findOne(Long id){
        Task task = repository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Задача", id));
        return TaskDTO.from(task);
    }

    public Task getOne(Long id){
        return repository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Задача не найдена:  ", id));
    }

    public void cascadeChangeDelta(long l,Task t){
        List<Task> children=t.getChildren();
        children.removeAll(checkList);
        for (int i = 0; i < children.size(); i++) {
            children.get(i).setDelta(children.get(i).getDelta()+l);
            repository.save(children.get(i));
            for (int j = 0; j < children.size(); j++) {
                checkList.add(children.get(j));
            }
            if (children.get(i).getChildren()!=null){
                cascadeChangeDelta(l,children.get(i));

            }
        }
        checkList=new ArrayList<>();
    }

    public void addTask( String name, String user, Boolean taskType
            , String brigade, String equipment, Long area
            , Long work, String materials, String tasks, String date, Integer num
    ){
        Task t= new Task();
        t.setName(name);
        t.setUser(user);
        t.setMilestone(taskType);
        t.setBrigade(brigade);
        t.setDelta(0L);
        t.setEquipment(equipment);
        t.setDefault_comment(null);
        t.setComment(null);
        t.setOpened(true);
        t.setStatus(TaskStatus.IN_PROGRESS);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate= LocalDate.parse(date,formatter);

        t.setStartDate(startDate);
        t.setFinishDate(null);
        t.setArea(aRep.getById(area));
        t.setWork(wRep.getById(work));

        List<Material> materialList= new ArrayList<>();
        String[] strings=materials.split(",");
        for (int i = 0; i < strings.length; i++) {
            Material m= mRep.getById( Long.parseLong(strings[i]));
            materialList.add(m);
        }
        t.setTaskMaterials(materialList);
        List<Task> taskList =new ArrayList<>();
        strings=tasks.split(",");
        for (int i = 0; i < strings.length; i++) {
            Task task= repository.getById( Long.parseLong(strings[i]));
            taskList.add(task);
        }

        t.setParents(taskList);
        t.setNumberOfPeople(num);

        repository.save(t);


    }

    public void cascadeReverseDelta(long l,Task t){
        List<Task> children=t.getChildren();
        children.removeAll(checkList);
        for (int i = 0; i < children.size(); i++) {
            children.get(i).setDelta(children.get(i).getDelta()-l);
            repository.save(children.get(i));
            for (int j = 0; j < children.size(); j++) {
                checkList.add(children.get(j));
            }
            if (children.get(i).getChildren()!=null){
                cascadeReverseDelta(l,children.get(i));

            }
        }
        checkList=new ArrayList<>();
    }

    public void addOutdone(String string){
        String str[] = string.split(",");
        List<String> al = Arrays.asList(str);
        List<Long> idList= new ArrayList<>();
        for (int i = 0; i <al.size() ; i++) {
            idList.add(Long.parseLong(al.get(i)));
        }
        for (int i = 0; i < idList.size(); i++) {
            Task t=repository.findById(idList.get(i)).orElse(null);
            t.setStatus(TaskStatus.DONE_PREMATURELY);
            t.setFinishDate(LocalDate.now());
            t.setOpened(false);
            long difference = Duration.between(t.getFinishDate().atStartOfDay(), t.getStartDate().atStartOfDay()).toDays();
            cascadeChangeDelta(difference,t);
            repository.save(t);
        }


    }

    public TaskDTO add(TaskDTO taskDTO){
        Task task = Task.builder()
                .name(taskDTO.getName())
                .finishDate(taskDTO.getFinishDate())
                .user(taskDTO.getUser())
                .brigade(taskDTO.getBrigade())
                .equipment(taskDTO.getEquipment())
                .taskMaterials(taskDTO.getTaskMaterials())
                .area(taskDTO.getArea())
                .work(taskDTO.getWork())
                .build();
        repository.save(task);
        return TaskDTO.from(task);
    }



//    public TaskDTO update(Long id, TaskDTO taskDTO){
//        Task task = getOne(id);
//        task.setName(taskDTO.getName());
//        task.setType(task.getType());
//        task.setUser(task.getUser());
//        task.setArea(task.getArea());
//        task.setWork(task.getWork());
//        task.setStartDate(taskDTO.getStartDate());
//        repository.save(task);
//        return TaskDTO.from(task);
//    }

    public String delete(Long id){
        Task task = getOne(id);
//        for (Task t: taskRepository.findByTaskMaterialsContains(material)) {
//            t.getTaskMaterials().remove(material);
//            taskRepository.save(t);
//        }
//        material = getOne(id);
        repository.delete(task);
        return "Успешно";
    }

}
