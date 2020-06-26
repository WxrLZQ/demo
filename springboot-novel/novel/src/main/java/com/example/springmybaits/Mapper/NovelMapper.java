package com.example.springmybaits.Mapper;

import com.example.springmybaits.daomain.Book;
import com.example.springmybaits.daomain.Novel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface NovelMapper {


    //首页品书试读区
    @Select("select * from novel limit 0,6")
    public List<Novel> home();

    //
    @Select("select * from novel limit 0,20")
    public List<Novel> newbook();

    //24小时热销榜区
    @Select("select * from novel where cid=#{cid} limit 0,4")
    public List<Novel> sort(Integer cid);


    @Select("select * from novel where cid=#{cid} limit 0,15")
    public List<Novel> sort1(Integer cid);

    //小说详情页
    @Select("select * from novel where nid=#{nid}")
    public Novel details(Integer nid);

    //搜索查询
    @Select("select * from novel where novel like '%${param}%'")
    public List<Novel> search(@Param("param") String name);

    //章节查询
    @Select("select * from book where nid=#{nid}")
    public List<Book> chapter(Integer nid);

    //章节内容
    @Select("select * from book where cid=#{cid}")
    public Book cartain(Integer cid);

    //翻阅章节
    @Select("select * from book where nid=#{param1} and id=#{param2}")
    public Book  browse(Integer nid,Integer id);

}
