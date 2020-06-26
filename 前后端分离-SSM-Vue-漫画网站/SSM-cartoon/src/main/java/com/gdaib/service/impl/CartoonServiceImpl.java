package com.gdaib.service.impl;

import com.gdaib.dao.CartoonDao;
import com.gdaib.domain.Cartoon;
import com.gdaib.domain.Chapter;
import com.gdaib.domain.Picture;
import com.gdaib.service.CartoonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("cartoonService")
public class CartoonServiceImpl implements CartoonService {

    @Autowired
    private CartoonDao cartoonDao;


    //查询排行分类
    @Override
    public List<Cartoon> pagehome(Integer choice) {
        return cartoonDao.homepage(choice);
    }

    //查询所有
    @Override
    public List<Cartoon> allcart() {
        return cartoonDao.allcart();
    }


    // 分类查询
    @Override
    public List<Cartoon> themecart(Integer theme) {
        return cartoonDao.themecart(theme);
    }

    //查询已完结或者加载中的漫画
    @Override
    public List<Cartoon> categorycart(Integer category) {
        return cartoonDao.categorycart(category);
    }

    //查询分类和加载
    @Override
    public List<Cartoon> sort(Integer theme, Integer category) {
        return cartoonDao.sort(theme,category);
    }

    //查询章节
    @Override
    public List<Chapter> chapter(Integer cid) {
        return cartoonDao.chapter(cid);
    }

    //章节当前查询
    @Override
    public Chapter onechapter(Integer mid) {
        return cartoonDao.onechapter(mid);
    }

    @Override
    public List<Picture> picture(Integer mid) {
        return cartoonDao.pic(mid);
    }

    @Override
    public List<Cartoon> newbook(Integer choice) {
        return cartoonDao.newbook(choice);
    }

    @Override
    public List<Cartoon> billboard(Integer choice) {
        return cartoonDao.billboard(choice);
    }
}
