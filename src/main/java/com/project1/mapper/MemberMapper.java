package com.project1.mapper;

import com.project1.domain.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MemberMapper {

    @Insert("""
            INSERT INTO member (email, password, nick_name) 
            VALUES (#{email}, #{password}, #{nickName})
            """)
//    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(Member member);


    @Select("""
            SELECT *
            FROM member
            ORDER BY id DESC
            """)
        // Column 종류가 List 로 들어간다
    List<Member> selectAll();

    @Select("""
            SELECT *
            FROM member
            WHERE id = #{id}
            """)
    Member selectById(Integer id);

    @Delete("""
            DELETE FROM member
            WHERE id = #{id}
            """)
    int deleteById(Integer id);

    @Update("""
            UPDATE member 
            SET email = #{email}, 
                password = #{password}, 
                nick_name = #{nickName}
            WHERE id = #{id}
            """)
    int update(Member member);
}
