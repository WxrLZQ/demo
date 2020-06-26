package com.gdaib.dao;

import com.gdaib.domain.Cartoon;
import com.gdaib.domain.Chapter;
import com.gdaib.domain.Picture;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartoonDao {

    //首页数据
    @Select("select * from cartoonbook where choice=#{choice}")
    public List<Cartoon> homepage(Integer choice);

    //首页-新书查询
    @Select("select * from cartoonbook where choice=#{choice} limit 0,3")
    public List<Cartoon> newbook(Integer choice);

    //首页-排行查询
    @Select("select * from cartoonbook where choice=#{choice} limit 0,6")
    public List<Cartoon> billboard(Integer choice);

    //查询所有漫画
    @Select("select * from cartoonbook ")
    public List<Cartoon> allcart();

    //分类查询
    @Select("select * from cartoonbook where theme=#{theme}")
    public List<Cartoon> themecart(Integer theme);

    //查询已完结或者加载中的漫画
    @Select("select * from cartoonbook where category=#{category}")
    public List<Cartoon> categorycart(Integer category);

    //查询分类和加载
    @Select("select * from cartoonbook where theme=#{arg0} and category=#{arg1}")
    public List<Cartoon> sort(Integer theme,Integer category);

    //查询章节
    @Select("select * from chapter where cartoon=#{cid}")
    public List<Chapter> chapter(Integer cid);

    //查询当前章节
    @Select("select * from chapter where cid=#{mid}")
    public Chapter onechapter(Integer mid);

    //章节内容
    @Select("select * from picture where chapter=#{mid}")
    public List<Picture> pic(Integer mid);
}
