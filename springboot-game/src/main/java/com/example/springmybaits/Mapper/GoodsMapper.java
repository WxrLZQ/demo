package com.example.springmybaits.Mapper;

import com.example.springmybaits.daomain.Game;
import com.example.springmybaits.daomain.Goods;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface GoodsMapper {

    //查询所有商品
    @Select("select * from goods")
    public List<Goods> allgoods();

    //查询所有页面游戏
    @Select("select * from game limit 0,12")
    public List<Game> partgame();

    //查询所有游戏
    @Select("select * from game ")
    public List<Game> allgame();


    //查询游戏类型商品
    @Select("select * from goods where gid=#{gid}")
    public List<Goods> selectgoods(Integer gid);

    //查询商品详细信息
    @Select("select * from goods where id=#{id}")
    public Goods  onegood(Integer id);


    //搜索游戏
    @Select("select * from game where gname like '%${param}%'")
    public List<Game> search(@Param("param") String name);

    //商品发布
    @Insert("insert into goods(gname,title,price,grade,mingwen,wzsj,pifu,yingxiong,guizu,sys,server,gid) " +
            "values(#{gname},#{title},#{price},#{grade},#{mingwen},#{wzsj},#{pifu},#{yingxiong},#{guizu},#{sys},#{server},#{gid})")
    public void put(Goods goods);

}
