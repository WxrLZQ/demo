package com.gdaib.service.Impl;

import com.gdaib.dao.CategoryDao;
import com.gdaib.domain.Category;
import com.gdaib.service.CategoryService;
import lombok.Setter;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Setter
    private CategoryDao categoryDao;

    //保存
    public void save(Category category) {
        //调用 dao
        System.out.println("我到了 CategoryService");
        categoryDao.save(category);
    }

    //展示数据
    @Override
    public List<Category> getAllCategory() {
        List<Category> list= categoryDao.getAllCategory();
        return list;
    }
    //获取数据
    @Override
    public Category getCategory(Integer cid) {
        Category category= categoryDao.getCategory(cid);
        return category;
    }
    //更新数据
    @Override
    public void update(Category category) {
        //调用dao
        categoryDao.update(category);
    }
    //删除数据
    @Override
    public void delete(Category category) {
        categoryDao.delete(category);
    }
}
