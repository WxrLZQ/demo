package com.example.springmybaits.daomain;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class Game {
    private Integer gid;
    private String  gname;
    private String  hot;
    private String  img;

    @Override
    public String toString() {
        return "game{" +
                "gid=" + gid +
                ", gname='" + gname + '\'' +
                ", hot='" + hot + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
