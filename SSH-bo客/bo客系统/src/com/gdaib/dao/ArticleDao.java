package com.gdaib.dao;

import com.gdaib.domain.Article;
import com.gdaib.domain.Category;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public interface ArticleDao {
    List<Category> getCategory(Integer parentid);
    List<Article>getAllArticle();

    Integer getTotalCount(DetachedCriteria detachedCriteria);

    List<Article> getPageData(DetachedCriteria detachedCriteria, Integer index, Integer pageSize);

    void delete(Article article);

    void save(Article article);

    Article getEdit(Integer article_id);

    void update(Article article);
}
