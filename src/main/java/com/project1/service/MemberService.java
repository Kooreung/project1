package com.project1.service;

import com.project1.domain.Member;
import com.project1.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
@RequiredArgsConstructor
public class MemberService {
    private final MemberMapper mapper;

    public void signup(Member member) {
        mapper.insert(member);
        // Controller 에서 받은 member 내용을 service로 받음
        // service 에서 받은 내용을 mapper 로 전달
        // insert 로 쓰기 위해
    }

    public List<Member> list() {
        return mapper.selectAll();
    }

    public Member get(Integer id) {
        return mapper.selectById(id);
    }

    public void delete(Integer id) {
        mapper.deleteById(id);
    }

    public void update(Member member) {
        mapper.update(member);
    }
}
