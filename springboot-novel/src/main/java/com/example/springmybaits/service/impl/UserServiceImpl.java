package com.example.springmybaits.service.impl;

import com.example.springmybaits.Mapper.UserMapper;
import com.example.springmybaits.daomain.User;
import com.example.springmybaits.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    //登录查询
    @Override
    public User getUser(User user) {
        return userMapper.getUser(user);
    }

    //查询该用户是否存在
    @Override
    public User searchUser(User user) {
        return userMapper.searchUser(user);
    }

    //注册
    @Override
    public void setUser(User user) {
        userMapper.setUser(user);
    }
}
