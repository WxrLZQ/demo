package com.gdaib.web;

import com.gdaib.domain.Article;
import com.gdaib.domain.Category;
import com.gdaib.domain.PageBean;
import com.gdaib.service.ArticleService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import lombok.Setter;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class WebAction  extends ActionSupport {

    @Setter
    private ArticleService articleService;

    @Setter
    private Integer currPage = 1;

    @Setter
    private Integer parentid;

    @Setter
    private Integer cid;

    //获取分页数据
    public void getPageList() throws IOException {
        //离线查询条件
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Article.class);

        //查询子类
        if (parentid != null) {
            List<Category> category = articleService.getCategory(parentid);
            //构建一个数组
            Object[] cidArrays = new Object[category.size()];
            for (int i = 0; i < category.size(); i++) {
                Category category1 = category.get(i);
                cidArrays[i] = category1.getCid();
            }
            System.out.println(Arrays.toString(cidArrays));
            detachedCriteria.add(Restrictions.in("category.cid", cidArrays));
        }
        //查询相对于的子类数据
        if (cid != null) {
            detachedCriteria.add(Restrictions.eq("category.cid", cid));
        }


        //设置条件
        PageBean pageBean = articleService.getPageList(detachedCriteria, currPage, 5);

        //以json返回给web
        JsonConfig jsonConfig = new JsonConfig();
        //hibernate懒加载
        jsonConfig.setExcludes(new String[]{"hander", "hibernateLazyInitializer"});
        JSONObject jsonObject = JSONObject.fromObject(pageBean, jsonConfig);


        ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().println(jsonObject.toString());
    }
    @Setter
    private Integer id;
    public void getDatail() throws IOException {
        Article edit = articleService.getEdit(id);
        JsonConfig jsonConfig = new JsonConfig();
        //hibernate懒加载
        jsonConfig.setExcludes(new String[]{"hander", "hibernateLazyInitializer"});
        JSONObject jsonObject = JSONObject.fromObject(edit, jsonConfig);


        ServletActionContext.getResponse().setContentType("text/json;charset=UTF-8");
        ServletActionContext.getResponse().getWriter().println(jsonObject.toString());

    }

}
