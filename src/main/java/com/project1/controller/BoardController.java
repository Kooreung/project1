package com.project1.controller;

import com.project1.domain.Board;
import com.project1.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService service;

    @GetMapping("/add")
    public String add() {
        return "board/add";
    }

    @PostMapping("/add")
    public String addPost(Board board, Principal principal, RedirectAttributes rttr) {
        service.add(board);

        rttr.addAttribute("id", board.getId());
        return "redirect:/board";
    }

    // /board?id=3
    @GetMapping("/board")
    public String view(Integer id, Model model) {
        // 게시물 조회 (select)
        Board board = service.get(id);
        // Model 에 넣고
        model.addAttribute("board", board);
        // jsp 로 포워드
        return "board/view";
    }

    @GetMapping("/")
    public String home(@RequestParam(value = "page", defaultValue = "1") Integer page,
                       Model model) {
        // 게시물 목록 조회 (select)
        // Model 에 넣고
        model.addAllAttributes(service.list(page));
        // model 은 Map Attribute 과 key , value 구성이 같다. <String , O>
        // 그래서 model.addAllAttribute 의 초반부에 적용할 수 있다.
        // jsp 로 포워드
        return "board/home";
    }

    @PostMapping("/delete")
    public String delete(Integer id) {
        service.delete(id);

        return "redirect:/";
    }

    @GetMapping("/modify")
    public String modify(Integer id, Model model) {
        model.addAttribute("board", service.get(id));
        return "board/modify";
    }

    @PostMapping("/modify")
    public String modifyPost(Board board, RedirectAttributes rttr) {
        service.modify(board);
        rttr.addAttribute("id", board.getId());
        return "redirect:/board";
    }
}
