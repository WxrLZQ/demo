package com.example.springmybaits.daomain;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class Novel {
    private Integer nid;
    private String novel;
    private String writer;
    private String synopsis;
    private String motto;
    private String img;
    private Integer cid;
    private String  cname;
    private String css;
    private String chapter;
    private String brief;
    private String list;

    @Override
    public String toString() {
        return "Novel{" +
                "nid=" + nid +
                ", novel='" + novel + '\'' +
                ", writer='" + writer + '\'' +
                ", synopsis='" + synopsis + '\'' +
                ", motto='" + motto + '\'' +
                ", img='" + img + '\'' +
                ", cid=" + cid +
                ", cname='" + cname + '\'' +
                ", css='" + css + '\'' +
                ", chapter='" + chapter + '\'' +
                ", brief='" + brief + '\'' +
                ", list='" + list + '\'' +
                '}';
    }
}
