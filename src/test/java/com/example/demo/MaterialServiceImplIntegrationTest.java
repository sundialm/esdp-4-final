package com.example.demo;

import com.example.demo.dto.MaterialDTO;
import com.example.demo.entities.Material;
import com.example.demo.repositories.MaterialsRepository;
import com.example.demo.services.MaterialService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.util.Optional;

@SpringBootTest
@Slf4j
public class MaterialServiceImplIntegrationTest {

    @Autowired
    private MaterialsRepository repository;

    @Autowired
    private MaterialService service;

    @Test
    public void getOneMaterial_whenGetOneArea_thenStatus200() throws Exception{
        Material material = service.getOne(1L);
        Assertions.assertEquals(material.getId(), 1L);
        log.debug("success: {}", material.getId());
        System.out.println("success: "+ material.getId());
    }

    @Test
    public void update_material_Test(){
        MaterialDTO response = service.update( 1L, MaterialDTO.builder()
                .name("test")
                .qty(12L)
                .measurement("test")
                .build());
        Material material = repository.findById(1L).get();
        Assertions.assertEquals(material.getName(), response.getName());
    }

    @Test
    public void addMaterial_whereParent_is_notNull() {
        MaterialDTO response = service.add(MaterialDTO.builder()
                .name("test")
                .measurement("test")
                .qty(1L)
                .build());

        Assertions.assertNotNull(response.getId());

        Material fromDb = service.getOne(response.getId());
        Assertions.assertNotNull(fromDb);
        Assertions.assertEquals(fromDb.getId(), response.getId());

//        service.delete(fromDb.getId());
    }

    @Test
    public void deleteAreaParent_with_children_Test() {
        service.delete(1L);
        log.info("success");
    }

}
