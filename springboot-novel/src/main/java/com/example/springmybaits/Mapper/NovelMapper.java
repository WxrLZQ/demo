package com.example.springmybaits.Mapper;

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
    @Select("select * from novel ")
    public List<Novel> newbook();

    //24小时热销榜区
    @Select("select * from novel where cid=#{cid}")
    public List<Novel> sort(Integer cid);

    //小说详情页
    @Select("select * from novel where nid=#{nid}")
    public Novel details(Integer nid);

    //搜索查询
    @Select("select * from novel where novel like '%${param}%'")
    public List<Novel> search(@Param("param") String name);

}
