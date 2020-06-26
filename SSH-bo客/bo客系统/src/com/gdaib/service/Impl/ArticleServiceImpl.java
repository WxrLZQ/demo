package com.gdaib.service.Impl;

import com.gdaib.dao.ArticleDao;
import com.gdaib.domain.Article;
import com.gdaib.domain.Category;
import com.gdaib.domain.PageBean;
import com.gdaib.service.ArticleService;
import lombok.Setter;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
public class ArticleServiceImpl implements ArticleService {

    @Setter
    private ArticleDao articleDao;


    //文章列表
    @Override
    public PageBean getPageList(DetachedCriteria detachedCriteria, Integer currPage, int pageSize) {
        PageBean<Article> pageBean = new PageBean<>();

        //设置当前页
        pageBean.setCurrentPage(currPage);
        //设置当前一页多少条数据
        pageBean.setPageSize(pageSize);
        //获取总记录数
        //从数据库当中查询总记录数
        Integer totalCount=articleDao.getTotalCount(detachedCriteria);
        pageBean.setTotalCount(totalCount);
        //设置总页数
        pageBean.setTotalPage(pageBean.getTotalPage());
        //设置当前页数据
        //查询数据库
        List<Article> list=articleDao.getPageData(detachedCriteria,pageBean.getIndex(),pageBean.getPageSize());
        //计算
        pageBean.setList(list);
//        System.out.println(pageBean);
        return pageBean;
    }
    //文章删除
    @Override
    public void delete(Article article) {
        articleDao.delete(article);
    }

    //获取添加列表上到分类
    @Override
    public List<Category> getCategory(Integer parentid) {

        List<Category> list= articleDao.getCategory(parentid);
        return list;
    }
    //保存文章
    @Override
    public void save(Article article) {
        articleDao.save(article);
    }

    //获取编辑文章
    @Override
    public Article getEdit(Integer article_id) {
        Article resArticle= articleDao.getEdit(article_id);
        return resArticle;
    }

    //更新文章
    @Override
    public void update(Article article) {
        articleDao.update(article);
    }
}
