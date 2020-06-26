package com.gdaib.service;

import com.gdaib.domain.Category;

import java.util.List;

public interface CategoryService {

    public void save(Category category);

    List<Category> getAllCategory();

    Category getCategory(Integer cid);

    void update(Category category);

    void delete(Category category);
}
