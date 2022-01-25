package com.example.demo.dto;

import com.example.demo.entities.Material;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.springframework.lang.Nullable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.List;
import java.util.stream.Collectors;

@Builder
@Getter
@Setter
@AllArgsConstructor
public class MaterialDTO {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Size( max = 100)
    @NotBlank
    @Pattern(regexp = "^[^\\d\\s]+$", message = "Name should contain only letters")
    @Column(length = 128)
    private String name;


    @Nullable
    private Integer parentId;

    private List<MaterialDTO> children;

    @Column
    private Integer qty;


    @Nullable
    @Column(length = 128)
    private String measurement;

    public static MaterialDTO from(Material material) {
        return MaterialDTO.builder()
                .id(material.getId())
                .name(material.getName())
                .qty(material.getQty())
                .parentId(material.getParent()!=null?material.getParent().getId():null)
                .children(material.getChild()!=null ?
                        material.getChild().stream().map(t -> MaterialDTO.from(t)).collect(Collectors.toList()): null)
                .measurement(material.getMeasurement())
                .build();
    }
}
