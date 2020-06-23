package com.example.springmybaits.service;

import com.example.springmybaits.daomain.Game;
import com.example.springmybaits.daomain.Goods;

import java.util.List;

public interface GoodsService {

        public List<Goods> allgoods();

        public List<Game> partgame();

        public List<Game> allgame();

        public List<Goods> selectgoods(Integer gid);

        public Goods  onegood(Integer id);

        public List<Game> search(String name);

        public void put(Goods goods);

}
