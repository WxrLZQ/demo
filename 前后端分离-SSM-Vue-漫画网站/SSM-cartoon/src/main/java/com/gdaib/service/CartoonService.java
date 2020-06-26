package com.gdaib.service;

import com.gdaib.domain.Cartoon;
import com.gdaib.domain.Chapter;
import com.gdaib.domain.Picture;

import java.util.List;

public interface CartoonService {

    //首页排行分类
    public List<Cartoon> pagehome(Integer choice);

    //查询所有
    public List<Cartoon> allcart();

    //分类查询
    public List<Cartoon> themecart(Integer theme);

    //查询已完结或者加载中的漫画
    public List<Cartoon> categorycart(Integer category);

    //查询分类和加载
    public  List<Cartoon> sort(Integer theme,Integer category);

    //查询章节
    public  List<Chapter> chapter(Integer cid);

    //章节当前查询
    public Chapter onechapter(Integer mid);

    //章节内容
    public  List<Picture> picture(Integer mid);

    // 首页-新书查询
    public List<Cartoon> newbook (Integer choice);

    // 首页-排行查询
    public List<Cartoon> billboard (Integer choice);

}
