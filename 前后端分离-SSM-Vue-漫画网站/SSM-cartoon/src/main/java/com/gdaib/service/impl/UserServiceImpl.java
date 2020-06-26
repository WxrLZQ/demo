package com.gdaib.service.impl;

import com.gdaib.dao.UserDao;
import com.gdaib.domain.User;
import com.gdaib.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    //登录
    @Override
    public User LoginUser(User user) {
        return userDao.LoginUser(user);
    }

    //查询用户名是否重复
    @Override
    public User FindUser(User user) {
        return userDao.findUser(user);
    }

    //注册 把数据插入到数据库
    @Override
    public void Register(User user) {
        userDao.saveAccount(user);
    }
}
