package com.example.springmybaits.Mapper;

import com.example.springmybaits.daomain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {


    //登录查询
    @Select("select * from user where phone=#{phone} and password=#{password}")
    public User getUser(User user);

    //查询该用户是否存在
    @Select("select * from user where phone=#{phone}")
    public User searchUser(User user);
    //注册
    @Insert("insert into user(phone,password) values(#{phone},#{password})")
    public void setUser(User user);
}
