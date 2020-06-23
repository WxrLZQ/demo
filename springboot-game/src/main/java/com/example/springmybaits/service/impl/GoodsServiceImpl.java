package com.example.springmybaits.service.impl;

import com.example.springmybaits.Mapper.GoodsMapper;
import com.example.springmybaits.daomain.Game;
import com.example.springmybaits.daomain.Goods;
import com.example.springmybaits.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl  implements GoodsService {

    @Autowired
    GoodsMapper goodsMapper;

    //查询所有商品
    @Override
    public List<Goods> allgoods() {
        return goodsMapper.allgoods() ;
    }


    //查询页面游戏
    @Override
    public List<Game> partgame() {
        return goodsMapper.allgame();
    }

    @Override
    public List<Game> allgame() {
        return goodsMapper.allgame();
    }

    //查询游戏类型商品
    @Override
    public List<Goods> selectgoods(Integer gid) {
        return goodsMapper.selectgoods(gid);
    }

    //查询商品详细信息
    @Override
    public Goods onegood(Integer id) {
        return goodsMapper.onegood(id);
    }

    //搜索商品
    @Override
    public List<Game> search(String name) {
        return goodsMapper.search(name);
    }

    //发布商品
    @Override
    public void put(Goods goods) {
        goodsMapper.put(goods);
    }


}
