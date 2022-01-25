//package com.example.demo;
//
//import com.example.demo.dto.AreaDTO;
//import com.example.demo.dto.WorkDTO;
//import com.example.demo.entities.Area;
//import com.example.demo.entities.Work;
//import com.example.demo.repositories.WorkRepository;
//import com.example.demo.services.WorkService;
//import lombok.extern.slf4j.Slf4j;
//import org.junit.jupiter.api.Assertions;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import java.util.List;
//import java.util.Optional;
//
//@SpringBootTest
//@Slf4j
//public class WorkServiceImplIntegrationTest {
//
//    @Autowired
//    private WorkRepository repository;
//
//    @Autowired
//    private WorkService service;
//
//    @Test
//    public void getOneWork_whenGetOneArea_thenStatus200() throws Exception{
//        Work work = service.getOne(1L);
//        Assertions.assertEquals(work.getId(), 12L);
//        log.info("success");
//    }
//
//    @Test
//    public void update_Work_Test(){
//        WorkDTO response = service.update( 2L, WorkDTO.builder()
//                .name("test")
//                .build());
//        Work work = repository.findById(1L).get();
//        Assertions.assertEquals(work.getName(), response.getName());
//        log.info("success");
//    }
//
//    @Test
//    public void delete_WorkParent_with_children_Test() {
//        service.delete(2L);
//        log.info("success");
//
//        Work work = null;
//        Optional<Work> optionalWork = repository.findById(2L);
//
//        if(optionalWork.isPresent()){
//            work = optionalWork.get();
//        }
//        Assertions.assertEquals(work, null);
//        log.info("success");
//    }
//
//    @Test
//    public void addArea_whereParent_is_notNull() {
//        WorkDTO response = service.add(WorkDTO.builder()
//                .name("test")
//                .parentId(1L)
//                .build());
//
//        Assertions.assertNotNull(response.getId());
//
//        Work fromDb = service.getOne(response.getId());
//        Assertions.assertNotNull(fromDb);
//        Assertions.assertEquals(fromDb.getId(), response.getId());
//    }
//
//    @Test
//    public void getAllWorks_where_work_is_parent(){
//        List<Work> list = repository.findByWorkParentIsNull();
//        for (Work w: list) {
//            if (!w.getWorkChild().isEmpty()) {
//                for (Work work: w.getWorkChild()){
//                    log.debug("child: {}, parent: {}", work.getId(), w.getId());
//                }
//            }
//        }
//        log.debug("");
//        System.out.println(list);
//        log.debug("size: {}", list.size());
//    }
//
////    @Test
////    public void getAllWorks_where_work_is_child(){
////        List<Work> list = repository.findByParentIsNotNull();
////        for (Work work: list) {
////            if (!work.getWorkChild().isEmpty()) {
////                for (Work a: work.getWorkChild()){
////                    log.debug("child: {}, parent: {}", a.getId(), work.getId());
////                }
////            }
////        }
////        System.out.println(list);
////        log.debug("size: {}", list.size());
////    }
//
//}
