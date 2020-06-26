package com.gdaib.service;

import com.gdaib.domain.Article;
import com.gdaib.domain.Category;
import com.gdaib.domain.PageBean;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface ArticleService {


    PageBean getPageList(DetachedCriteria detachedCriteria, Integer currPage, int i);

    void delete(Article article);

    List<Category> getCategory(Integer parentid);

    void save(Article article);

    Article getEdit(Integer article_id);

    void update(Article article);
}
