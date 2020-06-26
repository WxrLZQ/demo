package com.example.springmybaits.service;


import com.example.springmybaits.daomain.User;


public interface UserService {

    public User getUser(User user);

    public User searchUser(User user);

    public void setUser(User user);


}
