package com.gdaib.web;

import com.gdaib.domain.Article;
import com.gdaib.domain.Category;
import com.gdaib.domain.PageBean;
import com.gdaib.service.ArticleService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import lombok.Setter;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class ArticleAction extends ActionSupport implements ModelDriven<Article> {

    private Article article=new Article();

    @Override
    public Article getModel() {
        return article;
    }

    @Setter
    private ArticleService articleService;


    //删除文章

    public  String delete(){
//        System.out.println(article_id);
        Article article1 = new Article();
        article1.setArticle_id(article.getArticle_id());
        articleService.delete(article1);
        return "listres";
    }


    //获取分页数据
    @Setter
    private  Integer currPage =1;
    @Setter
    private  String keyWord;
    public String pageList(){
//        System.out.println(currPage);
//        System.out.println(keyWord);
        //离线查询条件
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Article.class);
        //设置条件
        if (keyWord!=null){
            detachedCriteria.add(Restrictions.like("article_title","%"+keyWord+"%"));
        }
        //调用业务层
        PageBean pageBean=articleService.getPageList(detachedCriteria,currPage,5);
        //把数据存到值栈中
        ActionContext.getContext().getValueStack().push(pageBean);
        return "list";
    }

    //添加列表—获取分类
    @Setter
    private  Integer parentid;
    public String getCategory() throws IOException {
        //根据parentid查询
        Gson gson = new Gson();
        List<Category> list= articleService.getCategory(parentid);
        String s = gson.toJson(list);
//        System.out.println(s);
        ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().println(s);
        return null;
    }


    //添加文章

    /**
     * 文件上传提供的三个属性:
     */
    @Setter
    private String uploadFileName; // 文件名称
    @Setter
    private File upload; // 上传文件
    @Setter
    private String uploadContentType; // 文件类型

    public String add(){
        if (upload!=null){
            //上传文件

            //随机生成文件名称
            //1.获取文件扩展名 .jpg
            int index = uploadFileName.lastIndexOf(".");
            String substring = uploadFileName.substring(index);
            //2.随机生成文件名  拼接扩展名
            String uuid= UUID.randomUUID().toString().replace("-","")+substring;
            System.out.println(uuid);

            //确定上传路径
            String path = ServletActionContext.getServletContext().getRealPath("/upload");
            File file = new File(path);
            System.out.println(file);
            if (!file.exists()){
                file.mkdir();
            }
            //拼接新文件路径
            File newFile = new File(path + "/" + uuid);

            try {
                FileUtils.copyFile(upload,newFile);
                article.setArticle_pic(uuid);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String s = simpleDateFormat.format(new Date());
        article.setArticle_time(s);
//        System.out.println(article);

        //调用业务层, 保存到数据库
        articleService.save(article);

        return"listres";
    }

    //文章编辑
    public String edit(){

        System.out.println(article.getArticle_id());
        //从数据库当中获取当前文章
        Article resarticle=articleService.getEdit(article.getArticle_id());
        System.out.println(resarticle);
        ActionContext.getContext().getValueStack().push(resarticle);
        //跳转编辑界面
        return "edit";
    }

    public String update(){
        //判断有没有新上传的图片
        if (upload!=null){


            //确定上传路径
            String path = ServletActionContext.getServletContext().getRealPath("/upload");
            //删除原有图片
            String picname =article.getArticle_pic();

            if (picname!=null || "".equals(picname)){
                File file = new File(path + picname);
                file.delete();
            }

            //随机生成文件名称
            //1.获取文件扩展名 .jpg
            int index = uploadFileName.lastIndexOf(".");
            String substring = uploadFileName.substring(index);
            //2.随机生成文件名  拼接扩展名
            String uuid= UUID.randomUUID().toString().replace("-","")+substring;
            System.out.println(uuid);



            File file = new File(path);
            if (!file.exists()){
                file.mkdir();
            }
            //拼接新文件路径
            File newFile = new File(path + "/" + uuid);

            try {
                FileUtils.copyFile(upload,newFile);
                article.setArticle_pic(uuid);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        //设置时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String s = simpleDateFormat.format(new Date());
        article.setArticle_time(s);


        //调用业务更新文章
        articleService.update(article);

        return "listres";
    }

}
