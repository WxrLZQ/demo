package com.example.springmybaits.daomain;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class Book {
    private Integer cid;
    private String bname;
    private String novel;
    private String chapterNumber;
    private String content;
    private Integer nid;
    private Integer id;
    private String writer;


    @Override
    public String toString() {
        return "Book{" +
                "cid=" + cid +
                ", bname='" + bname + '\'' +
                ", novel='" + novel + '\'' +
                ", chapterNumber='" + chapterNumber + '\'' +
                ", content='" + content + '\'' +
                ", nid=" + nid +
                ", id=" + id +
                ", writer='" + writer + '\'' +
                '}';
    }
}
