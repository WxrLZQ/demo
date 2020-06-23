package com.example.springmybaits.daomain;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class User {
    private  Integer id;
    private  String phone;
    private  String password;


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
