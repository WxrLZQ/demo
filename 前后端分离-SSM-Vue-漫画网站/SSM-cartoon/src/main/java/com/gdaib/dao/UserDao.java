package com.gdaib.dao;


import com.gdaib.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    //登录
    @Select("select * from ct_user where email=#{email} and password=#{password}")
    public User LoginUser(User user);

    //判断数据库是否存在改邮箱
    @Select("select * from ct_user where email=#{email}")
    public User findUser(User user);
    //注册
    @Insert("insert into ct_user (email,password,nickname) values (#{email},#{password},#{nickname})")
    public void  saveAccount(User user);
}
