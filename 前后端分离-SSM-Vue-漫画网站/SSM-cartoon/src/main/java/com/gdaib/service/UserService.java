package com.gdaib.service;



import com.gdaib.domain.User;

import java.util.List;

public interface UserService {
    //登录
    public User LoginUser(User user);

    //查询用户名是否重复
    public User FindUser(User user);

    //注册 把数据插入到数据库
    public void Register(User user);
}
