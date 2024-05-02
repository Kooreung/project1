package com.project1.mapper;

import com.project1.domain.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    @Insert("""
            INSERT INTO member (email, password, nick_name) 
            VALUES (#{email}, #{password}, #{nickName})
            """)
//    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(Member member);
}
