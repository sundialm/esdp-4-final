package com.example.demo.entities;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

@Data
@Table(name = "session")
@Entity

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Session {





    @Column
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;


    @NotBlank
    @Column(length = 128)
    private String access_token;

    @NotBlank
    @Column(length = 128)
    private String refresh_token;

    @NotBlank
    @Column(length = 128)
    private LocalDateTime expiration_time;


    @NotBlank
    @Column(length = 128)
    private LocalDateTime expiration_date;

    @ManyToOne(fetch = FetchType.LAZY)
    private User user;


}
