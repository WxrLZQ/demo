package com.example.springmybaits.controller;

import com.example.springmybaits.daomain.Game;
import com.example.springmybaits.daomain.Goods;
import com.example.springmybaits.service.GoodsService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class GoodsController {

    @Autowired
    GoodsService goodsService;

    //到达首页发送请求调用数据返回页面
    @RequestMapping(value = {"/","index"})
    public String homepage(Model model){
        //查询所有商品
        List<Goods> allgoods = goodsService.allgoods();
        //查询所有游戏
        List<Game> allgame = goodsService.partgame();
        //存入model返回数据给页面
        model.addAttribute("games",allgame);
        model.addAttribute("goods",allgoods);
        return "index";
    }

    //查询游戏类型商品
    @RequestMapping("/goods/{gid}")
    public String goods(@PathVariable("gid")Integer gid,Model model){
        //查询某个游戏类型的商品
        List<Goods> selectgoods = goodsService.selectgoods(gid);
        //存入mode返回数据到页面
        model.addAttribute("selectgood",selectgoods);
        return "goods";
    }

    //查询商品详细信息
    @RequestMapping("/info/{id}")
    public String info(@PathVariable("id")Integer id,Model model){
        Goods onegood = goodsService.onegood(id);
        model.addAttribute("good",onegood);
        return "info";
    }

    //游戏列表
    @RequestMapping("/list")
    public String list(Model model){
        List<Game> allgame = goodsService.allgame();
        model.addAttribute("all",allgame);
        return "list";
    }


    //搜索商品
    @RequestMapping("/search")
    public String search(@RequestParam("gname")String name,Model model){
        List<Game> search = goodsService.search(name);
        model.addAttribute("all",search);
        return "list";
    }

    //跳转到发布页面
    @RequestMapping("/write")
    public String write(){
        return "write";
    }

    //发布商品
    @RequestMapping("/put")
    public String put(Goods goods)
    {
        System.out.println(goods);
        goodsService.put(goods);
        return "redirect:/list";
    }
}
