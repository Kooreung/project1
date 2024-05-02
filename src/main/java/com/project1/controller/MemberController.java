package com.project1.controller;

import com.project1.domain.Member;
import com.project1.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("member")
public class MemberController {
    private final MemberService service;

    @GetMapping("signup")
    public String signup() {

        return "member/signup";
        // 회원가입 view 로 전달
        // 같은 경로라서 void 로 바꿔도 상관 없다.
    }

    @PostMapping("signup")
    public String signup(Member member) {
        service.signup(member);
        // 여러 파라미터가 필요하니까 Member Bean 을 생성
        // 이 내용을 service 에 전달

        return "redirect:/";
    }
}
