package com.gdaib.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter@Getter
public class Chapter {
    private Integer cid;
    private String cname;
    private String img;
    private String hit;
    private String date;
    private String title;
    //一个章节对应多个图片
    private List<Picture> pictureList;


    @Override
    public String toString() {
        return "Chapter{" +
                "cid=" + cid +
                ", cname='" + cname + '\'' +
                ", img='" + img + '\'' +
                ", hit='" + hit + '\'' +
                ", date='" + date + '\'' +
                ", title='" + title + '\'' +
                ", pictureList=" + pictureList +
                '}';
    }
}
