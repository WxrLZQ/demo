package com.example.springmybaits.service;

import com.example.springmybaits.daomain.Game;
import com.example.springmybaits.daomain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {

    public User getUser(User user);

    public User searchUser(User user);

    public void setUser(User user);


}
