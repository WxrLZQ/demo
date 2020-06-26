package com.example.springmybaits.service.impl;

import com.example.springmybaits.Mapper.NovelMapper;
import com.example.springmybaits.daomain.Book;
import com.example.springmybaits.daomain.Novel;
import com.example.springmybaits.service.NovelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("novelService")
public class NovelServiceImpl implements NovelService {

    @Autowired
    NovelMapper novelMapper;

    //主页的小说
    @Override
    public List<Novel> home() {
        return novelMapper.home();
    }

    //24小时热销榜区
    @Override
    public List<Novel> sort(Integer cid) {
        return novelMapper.sort(cid);
    }

    //更新榜
    @Override
    public List<Novel> newbook() {
        return novelMapper.newbook();
    }

    //详情页
    @Override
    public Novel details(Integer nid) {
        return novelMapper.details(nid);
    }


    //搜索查询
    @Override
    public List<Novel> search(String name) {
        return novelMapper.search(name);
    }

    //最近更新
    @Override
    public List<Novel> sort1(Integer cid) {
        return novelMapper.sort1(cid);
    }
    //章节
    @Override
    public List<Book> chapter(Integer nid) {
        return novelMapper.chapter(nid);
    }
    //章节内容
    @Override
    public Book cartain(Integer cid) {
        return novelMapper.cartain(cid);
    }

    //翻阅
    @Override
    public Book browse(Integer nid, Integer id) {
        return novelMapper.browse(nid,id);
    }

}
