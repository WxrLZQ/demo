package com.gdaib.web;

import com.gdaib.domain.Category;
import com.gdaib.service.CategoryService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import lombok.Setter;
import org.apache.struts2.ServletActionContext;

import java.io.IOException;
import java.util.List;

public class CategoryAction extends ActionSupport implements ModelDriven<Category> {
    private Category category=new Category();

    public Category getModel() {
        return category;
    }
    @Setter
    private CategoryService categoryService;
    //添加Category
    public String add(){
//        System.out.println("CategoryAction--------"+category);
        categoryService.save(category);
        return "listAction";
    }
    //查询所有Category
    public String list(){
//        System.out.println("list--------------------");
        //调用业务层 查询所有分类
        List<Category> list= categoryService.getAllCategory();
//        System.out.println(list);
        //把数据存到值栈中
        ActionContext.getContext().getValueStack().set("categorylist",list);
        return "list";
    }
    //获取当前Category
    public String updateUI() throws IOException {
//        System.out.println(category.getCid() );
//        System.out.println("updateUI____");
        //调用业务层
        Category category2= categoryService.getCategory(category.getCid());
//        System.out.println(category2);
        //把数据给页面
        //以 json(数据形式) 响应给页面
        Gson gson = new Gson();
        String s = gson.toJson(category2);
//        System.out.println(s);
        ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().println(s.toString());
        return null;
    }

    //更新当前Category
    public String update(){
//        System.out.println("--------------------------update");
//        System.out.println(category);
        categoryService.update(category);
        return "listAction";
    }


    //删除Category
    public String delete(){
//        System.out.println(category);
        categoryService.delete(category);
        return "listAction";

    }
}
