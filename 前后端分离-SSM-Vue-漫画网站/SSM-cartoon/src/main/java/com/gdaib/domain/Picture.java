package com.gdaib.domain;

import lombok.Getter;
import lombok.Setter;

@Setter@Getter
public class Picture {
    private Integer pid;
    private String pic;
    private String chapter;


    @Override
    public String toString() {
        return "Picture{" +
                "pid=" + pid +
                ", pic='" + pic + '\'' +
                ", chapter='" + chapter + '\'' +
                '}';
    }
}
