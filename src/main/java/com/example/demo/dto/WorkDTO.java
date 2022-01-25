package com.example.demo.dto;

import com.example.demo.entities.Work;
import lombok.*;
import org.springframework.lang.Nullable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.stream.Collectors;


@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class WorkDTO {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank
    @Column(length = 128)
    private String name;

    @Nullable
    private Integer parentId;

    private List<WorkDTO> children;

    public static WorkDTO from(Work work) {
        return WorkDTO.builder()
                .id(work.getId())
                .name(work.getName())
                .parentId(work.getWorkParent() != null ? work.getWorkParent().getId() : null)
                .children(work.getWorkChild()!=null ?
                        work.getWorkChild().stream().map(t -> WorkDTO.from(t)).collect(Collectors.toList()): null
                )
                .build();
    }
}
