package com.example.springmybaits.service;

import com.example.springmybaits.daomain.Book;
import com.example.springmybaits.daomain.Novel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NovelService {

    public List<Novel> home();

    public List<Novel> sort(Integer cid);

    public List<Novel> newbook();

    public Novel details(Integer nid);

    public List<Novel> search( String name);

    public List<Novel> sort1(Integer cid);

    public List<Book> chapter(Integer nid);

    public Book cartain(Integer cid);

    public Book  browse(Integer nid,Integer id);
}
