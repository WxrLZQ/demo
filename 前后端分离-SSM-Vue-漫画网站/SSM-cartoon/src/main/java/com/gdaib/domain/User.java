package com.gdaib.domain;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class User {
    private Integer uid;
    private String email;
    private String password;
    private String nickname;

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                '}';
    }
}
