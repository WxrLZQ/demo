package com.gdaib.controller;

import com.gdaib.domain.*;
import com.gdaib.service.CartoonService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@ResponseBody
@RequestMapping(value = "/Cartoon",produces = {"application/json;charset=UTF-8"})
public class CartoonController {

    @Autowired
    private CartoonService cartoonService;

    private Gson gson= new Gson();

    private HomePage page=new HomePage();

    private Chpater_pic chpater_pic = new Chpater_pic();

    //进入首页时想应页面数据
    @RequestMapping("/homepage")
    public String homepage(){
        List<Cartoon> cartoons = cartoonService.pagehome(1);
        List<Cartoon> cartoons1 = cartoonService.newbook(2);
        List<Cartoon> cartoons2= cartoonService.pagehome(4);
        List<Cartoon> cartoons3= cartoonService.billboard(5);
        page.setRecommed(cartoons);
        page.setBillboard(cartoons2);
        page.setT_Ranking(cartoons3);
        page.setB_Ranking(cartoons1);

        return gson.toJson(page);

    }

    //点击榜单
    @RequestMapping("/choice")
    public String  choice(@RequestParam("recid") Integer choice){
        Gson gson = new Gson();
        List<Cartoon> pagehome = cartoonService.pagehome(choice);
        return gson.toJson(pagehome);
    }

    //点击分类查询
    @RequestMapping("/sort")
    public String sort(@RequestParam("num_1") Integer theme,@RequestParam("num_2") Integer category){
        System.out.println(theme +category);
        if(theme==0 &&category==0)
        {
            List<Cartoon> allcart = cartoonService.allcart();
            return gson.toJson(allcart);

        }
        else if(theme!=0 && category==0)
        {
            List<Cartoon> themecart = cartoonService.themecart(theme);
            return gson.toJson(themecart);

        }
        else if(theme==0 && category!=0)
        {
            List<Cartoon> categorycart = cartoonService.categorycart(category);
            return gson.toJson(categorycart);
        }
        else
        {
            List<Cartoon> sort = cartoonService.sort(theme, category);
            return gson.toJson(sort);
        }
    }

    //查询章节
    @RequestMapping("/chapter")
    public String chapter(@RequestParam("cid") Integer cid){
        List<Chapter> chapter = cartoonService.chapter(cid);
        return  gson.toJson(chapter);
    }


    //查询章节内容
    @RequestMapping("/pic")
    public String picture(@RequestParam("mid") Integer mid)
    {
        List<Picture> picture = cartoonService.picture(mid);
        return gson.toJson(picture);
    }

    //上一章内容
    @RequestMapping("/last")
    public String last(@RequestParam("mid") Integer mid)
    {
        System.out.println(mid);
        System.out.println("我到了上一章");
        mid=mid-1;
        if(mid==0){
            mid=mid+1;
            Chapter onechapter = cartoonService.onechapter(mid);
            List<Picture> picture = cartoonService.picture(mid);
            chpater_pic.setChapterList(onechapter);
            chpater_pic.setPictureList(picture);
            return gson.toJson(chpater_pic);
        }else{
            Chapter onechapter = cartoonService.onechapter(mid);
            List<Picture> picture = cartoonService.picture(mid);
            chpater_pic.setChapterList(onechapter);
            chpater_pic.setPictureList(picture);
            return gson.toJson(chpater_pic);
        }
    }

    //下一章内容
    @RequestMapping("/next")
    public String next(@RequestParam("mid") Integer mid)
    {
        System.out.println(mid);
        System.out.println("我到了下一章");
        mid=mid+1;
        System.out.println("mid");
        List<Picture> picture = cartoonService.picture(mid);
        System.out.println(picture);
        //判断是否还有一下章
        if(picture.isEmpty())
        {
            mid=mid-1;
            System.out.println(mid);
            List<Picture> picture1 = cartoonService.picture(mid);
            Chapter onechapter1 = cartoonService.onechapter(mid);
            chpater_pic.setChapterList(onechapter1);
            chpater_pic.setPictureList(picture1);
            System.out.println(chpater_pic);
            return gson.toJson(chpater_pic);
        }else {
            Chapter onechapter = cartoonService.onechapter(mid);
            chpater_pic.setChapterList(onechapter);
            chpater_pic.setPictureList(picture);
            return gson.toJson(chpater_pic);
        }

    }

}
