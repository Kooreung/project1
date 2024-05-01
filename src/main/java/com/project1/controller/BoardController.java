package com.project1.controller;

import com.project1.domain.Board;
import com.project1.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService service;

    @GetMapping("/add")
    public String add() {
        return "board/add";
    }

    @PostMapping("/add")
    public String addPost(Board board) {
        System.out.println("board = " + board);
        service.add(board);
        return "redirect:/add";
    }
}
