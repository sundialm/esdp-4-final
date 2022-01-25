package com.example.demo.dto;


import com.example.demo.entities.Area;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;
import java.util.stream.Collectors;

@Builder
@Getter
@Setter
@AllArgsConstructor
public class AreaDTO {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank
    @Column(length = 128)
    private String name;

    @NotBlank
    @Size(min =10, max = 100)
    @Column(length = 128)
    private String height;

    private Integer parentId;
    private List<AreaDTO> children;

    public static AreaDTO from(Area area) {
        return AreaDTO.builder()
                .id(area.getId())
                .name(area.getName())
                .height(area.getHeight())
                .parentId(area.getParent() != null ? area.getParent().getId() : null)
                .children(area.getSubAreas()!=null ?
                        area.getSubAreas().stream().map(t -> AreaDTO.from(t)).collect(Collectors.toList()): null)
                .build();
    }
}
