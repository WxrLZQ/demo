package com.gdaib.domain;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class Cartoon {
    private Integer cid;
    private String title;
    private String author;
    private String update;
    private String text;
    private String img;

    @Override
    public String toString() {
        return "cartoon{" +
                "cid=" + cid +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", update='" + update + '\'' +
                ", text='" + text + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
