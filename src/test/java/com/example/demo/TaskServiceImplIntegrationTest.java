package com.example.demo;

import com.example.demo.entities.Task;
import com.example.demo.repositories.TaskRepository;
import com.example.demo.services.TaskService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.util.List;

@SpringBootTest
@Slf4j
public class TaskServiceImplIntegrationTest {

    @Autowired
    private TaskRepository repository;

    @Autowired
    private TaskService service;

    @Test
    public void getOneTask_whenGetOneArea_thenStatus200() throws Exception{
        Task task = service.getOne(1L);
        Assertions.assertEquals(task.getId(), 1L);
        log.info("success");
    }

    @Test
    public void delete_Task_Test() {
        service.delete(1L);
        log.info("success");
    }

//    @Test
//    public void test1(){
//        List<Task> list = repository.findByParentsIsNull();
//        for (Task w: list) {
//            if (!w.getChildren().isEmpty()) {
//                for (Task task: w.getChildren()){
//                    log.debug("child: {}, parent: {}", task.getId(), w.getId());
//                }
//            }
//        }
//        log.debug("");
//        System.out.println(list);
//        log.debug("size: {}", list.size());
//    }

}
