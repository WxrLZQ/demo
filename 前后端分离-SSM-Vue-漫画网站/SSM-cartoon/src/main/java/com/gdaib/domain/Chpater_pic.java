package com.gdaib.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter@Setter
public class Chpater_pic {
    private Chapter chapterList;
    private List<Picture> pictureList;

    @Override
    public String toString() {
        return "Chpater_pic{" +
                "chapterList=" + chapterList +
                ", pictureList=" + pictureList +
                '}';
    }
}
