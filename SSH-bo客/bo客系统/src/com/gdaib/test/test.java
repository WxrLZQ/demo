package com.gdaib.test;


import com.gdaib.domain.Article;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class test {
    @Test
    public void test1(){
        String  a ="AAAAA.c";
        int i = a.lastIndexOf(".");
        System.out.println(i);
        String substring = a.substring(0,5);
        System.out.println(substring);
        String uuid = UUID.randomUUID().toString().replace("-","")+substring;
        System.out.println(uuid);
    }
    @Test
    public void test2(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String s = simpleDateFormat.format(new Date());
        System.out.println(s);
        Article article = new Article();
        article.setArticle_time(s);
        System.out.println(article);
    }
    @Test
    public  void  test3(){
        String realPath = ServletActionContext.getServletContext().getRealPath("/");
        File file = new File(realPath);
        System.out.println(file);
    }
}
