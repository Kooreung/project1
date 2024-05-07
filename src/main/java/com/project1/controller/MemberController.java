package com.project1.controller;

import com.project1.domain.Member;
import com.project1.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    @GetMapping("list")
    public String list(Model model) {
        model.addAttribute("memberList", service.list());
        return "member/list";
    }

    @GetMapping("") // 회원 정보 확인
    public String info(Integer id, Authentication authentication, Model model) {
        if (service.hasAccess(id, authentication)) {
            model.addAttribute("member", service.get(id));
            return "member/info";
        }
        return "redirect:/";
    }


    @PostMapping("remove")
    public String remove(Integer id, Authentication authentication) {
        if (service.hasAccess(id, authentication)) {
            service.delete(id);
        }

        return "redirect:/logout";
    }

    @GetMapping("modify")
    public String modifyForm(Integer id, Model model) {
        model.addAttribute("member", service.get(id));
        // service 에서 같은 일을 하고 있는 중
        // id 가 필요한데, info jsp 에서 id 를 받을 수 있도록 작성

        return "member/modify"; // 정보를 해당 링크로 전달
    }

    @PostMapping("modify")
    public String modify(Member member, Authentication authentication, RedirectAttributes rttr) {
        if (service.hasAccess(member.getId(), authentication)) {
            service.modify(member);
        }

        rttr.addAttribute("id", member.getId());
        return "redirect:/member";
    }

    @GetMapping("email")
    @ResponseBody
    public String emailCheck(String email) {
        String message = service.emailCheck(email);
        return message;
    }

    @GetMapping("login")
    public String loginFrom() {
        return "member/login";
    }

    @PostMapping("login")
    public String login(String email, String password) {

        return "redirect:/";
    }
}
