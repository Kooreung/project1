package com.project1.domain;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Board {
    private Integer id;
    private Integer memberId;
    private String title;
    private String content;
    private String writer;
    private LocalDateTime inserted;
}
