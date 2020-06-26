package com.example.springmybaits.controller;


import com.example.springmybaits.daomain.Book;
import com.example.springmybaits.daomain.Novel;
import com.example.springmybaits.service.NovelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class NovelController {

    @Autowired
    NovelService novelService;

    //首页页面数据
    @RequestMapping(value = {"/","/index"})
    public String home(Model model){
        //首页品书试读区数据
        List<Novel> home = novelService.home();
        //24小时热销榜区
        List<Novel> sort = novelService.sort(1);
        //月票榜区
        List<Novel> sort1 = novelService.sort(2);
        //收藏榜
        List<Novel> sort2 = novelService.sort(3);
        //周推荐榜
        List<Novel> sort3 = novelService.sort(4);
        //新书榜
        List<Novel> sort4 = novelService.sort1(5);
        //最近更新
        List<Novel> newbook = novelService.newbook();
        model.addAttribute("novels",home);
        model.addAttribute("sort1",sort);
        model.addAttribute("sort2",sort1);
        model.addAttribute("sort3",sort2);
        model.addAttribute("sort4",sort3);
        model.addAttribute("sort5",sort4);
        model.addAttribute("book",newbook);
        return "index";
    }


    //详细页面
    @RequestMapping("/info/{nid}")
    public String info(@PathVariable("nid")Integer nid,Model model){
        Novel details = novelService.details(nid);
        List<Book> chapter = novelService.chapter(nid);
        model.addAttribute("chapter",chapter);
        model.addAttribute("detail",details);
        return "info";
    }

    //搜索
    @RequestMapping("/search")
    public String search(@RequestParam("novel") String name,Model model){
//        System.out.println(name);
        List<Novel> search = novelService.search(name);
//        System.out.println(search.size());
        model.addAttribute("novels",search);
        return "search";
    }

    //章节内容
    @RequestMapping("/chapter/{cid}")
    public String chapter(@PathVariable("cid") Integer cid,Model model){
        Book cartain = novelService.cartain(cid);
        model.addAttribute("book",cartain);
        return "chapter";
    }

    //上一章
    @RequestMapping("/last")
    public String last(@RequestParam("id") Integer id,@RequestParam("nid")Integer nid,Model model){
        id=id-1;
        if (id==0){
            id=id+1;
            Book book = novelService.browse(nid, id);
            model.addAttribute("book",book);
            return "chapter";
        }else {
            Book book = novelService.browse(nid, id);
            model.addAttribute("book",book);
            return "chapter";
        }
    }

    //下一章
    @RequestMapping("/next")
    public String next(@RequestParam("id") Integer id,@RequestParam("nid")Integer nid,Model model){
        id=id+1;
        Book browse = novelService.browse(nid, id);
        if (browse==null){
            id=id-1;
            Book book = novelService.browse(nid, id);
            model.addAttribute("book",book);
            return "chapter";
        }else {
            model.addAttribute("book",browse);
            return "chapter";
        }
    }

}
