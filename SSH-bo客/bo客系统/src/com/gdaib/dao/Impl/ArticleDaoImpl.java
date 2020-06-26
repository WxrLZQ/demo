package com.gdaib.dao.Impl;

import com.gdaib.dao.ArticleDao;
import com.gdaib.domain.Article;
import com.gdaib.domain.Category;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.List;

public class ArticleDaoImpl extends HibernateDaoSupport implements ArticleDao {

    @Override
    public List<Article> getAllArticle() {

        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Article.class);
        List<Article> list = (List<Article>) this.getHibernateTemplate().findByCriteria(detachedCriteria);

        return list;
    }


    //获取总记录数
    @Override
    public Integer getTotalCount(DetachedCriteria detachedCriteria) {

        detachedCriteria.setProjection(Projections.rowCount());
        List<Long> list = (List<Long>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
        if (list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    //查询分页数据
    @Override
    public List<Article> getPageData(DetachedCriteria detachedCriteria, Integer index, Integer pageSize) {

        //清空前面的条件
        detachedCriteria.setProjection(null);
        List<Article> list = (List<Article>) this.getHibernateTemplate().findByCriteria(detachedCriteria, index, pageSize);
        return list;
    }
    //删除文章
    @Override
    public void delete(Article article) {
        this.getHibernateTemplate().delete(article);
    }
    //保存文章
    @Override
    public void save(Article article) {
        this.getHibernateTemplate().save(article);
    }
    //编辑文章
    @Override
    public Article getEdit(Integer article_id) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Article.class);
        detachedCriteria.add(Restrictions.eq("article_id",article_id));
        List<Article> list = (List<Article>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
        if (list.size()>0){
            return  list.get(0);
        }

        return null;
    }

    //更新文章
    @Override
    public void update(Article article) {
        this.getHibernateTemplate().update(article);
    }

    //根据parentid查询分类
    public List<Category> getCategory(Integer parentid) {
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Category.class);
        detachedCriteria.add(Restrictions.eq("parentid",parentid));

        List<Category> list = (List<Category>) this.getHibernateTemplate().findByCriteria(detachedCriteria);
        return list;
    }
}
