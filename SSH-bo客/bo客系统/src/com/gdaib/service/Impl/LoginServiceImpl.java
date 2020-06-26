package com.gdaib.service.Impl;

import com.gdaib.dao.UserDao;
import com.gdaib.domain.User;
import com.gdaib.service.LoginService;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class LoginServiceImpl implements LoginService {

    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User login(User user) {
        System.out.println("我来到了————————service"+user);
        User resUser = userDao.getUser(user.getUsername(), user.getPassword());
        return resUser;
    }
}
