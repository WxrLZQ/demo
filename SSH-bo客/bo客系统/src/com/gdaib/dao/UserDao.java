package com.gdaib.dao;

import com.gdaib.domain.User;

public interface UserDao {
    public User getUser(String username, String password);
}
