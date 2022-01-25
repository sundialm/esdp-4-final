//package com.example.demo;
//
//import com.example.demo.dto.AreaDTO;
//import com.example.demo.entities.Area;
//import com.example.demo.entities.Work;
//import com.example.demo.repositories.AreaRepository;
//import com.example.demo.services.AreaService;
//import lombok.Getter;
//import lombok.Setter;
//import lombok.extern.slf4j.Slf4j;
//import org.junit.jupiter.api.Assertions;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.web.servlet.MockMvc;
//
//import java.util.List;
//import java.util.Optional;
//
//@SpringBootTest
//@Slf4j
//@AutoConfigureMockMvc
//public class AreaServiceImplIntegrationTest {
//
//    @Autowired
//    private AreaRepository areaRepository;
//
//    @Autowired
//    private AreaService areaService;
//
//    @Autowired
//    private MockMvc mvc;
//
//    @Test
//    public void getOneArea_whenGetOneArea_thenStatus200() throws Exception{
//        Area area = areaService.getOne(12L);
//        Assertions.assertEquals(area.getId(), 12L);
//        log.info("success");
//    }
//
//    @Test
//    public void updateAreaTest(){
//        AreaDTO response = areaService.update( 12L, AreaDTO.builder()
//                .name("test")
//                .build());
//        Area area = areaRepository.findById(12L).get();
//        Assertions.assertEquals(area.getName(), response.getName());
//        log.info("success");
//    }
//
//    @Test
//    public void deleteAreaParent_with_children_Test() {
//        areaService.delete(2L);
//        log.info("success");
//
//        Area area = null;
//        Optional<Area> optionalArea = areaRepository.findById(2L);
//
//        if(optionalArea.isPresent()){
//            area = optionalArea.get();
//        }
//        Assertions.assertEquals(area, null);
//        log.info("success");
//    }
//
//    @Test
//    public void addArea_whereParent_is_notNull() {
//        AreaDTO response = areaService.add(AreaDTO.builder()
//                .name("test")
//                .height("123")
//                .parentId(1L)
//                .build());
//
//        Assertions.assertNotNull(response.getId());
//
//        Area fromDb = areaService.getOne(response.getId());
//        Assertions.assertNotNull(fromDb);
//        Assertions.assertEquals(fromDb.getId(), response.getId());
////        areaService.delete(fromDb.getId());
//    }
//
//    @Test
//    public void getAllAreas_whereArea_isParent(){
//        List<Area> list = areaRepository.findByParentIsNull();
//        for (Area area: list) {
//            if (!area.getSubAreas().isEmpty()) {
//                for (Area a: area.getSubAreas()){
//                    log.debug("child: {}, parent: {}", a.getId(), area.getId());
//                }
//            }
//        }
//        log.debug("");
//        System.out.println(list);
//        log.debug("size: {}", list.size());
//    }
//
//    @Test
//    public void getAllAreas_whereArea_isChildren(){
//        List<Area> list = areaRepository.findByParentIsNotNull();
//        for (Area area: list) {
//            if (!area.getSubAreas().isEmpty()) {
//                for (Area a: area.getSubAreas()){
//                    log.debug("child: {}, parent: {}", a.getId(), area.getId());
//                }
//            }
//        }
//        System.out.println(list);
//        log.debug("size: {}", list.size());
//    }
//
//}
