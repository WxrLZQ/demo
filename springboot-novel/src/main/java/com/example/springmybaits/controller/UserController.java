package com.example.springmybaits.controller;

import com.example.springmybaits.daomain.User;
import com.example.springmybaits.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    //跳转到登录页面
    @RequestMapping("/tologin")
    public String tologin(){
        return "login";
    }

    //跳转到注册页面
    @RequestMapping("/toregist")
    public String toregist(){
        return "reg";
    }

    //登录
    @RequestMapping("/login")
    public String login(User user, HttpSession session,Model model){
        //查询是否有该账号和对应的密码
        User user1 = userService.getUser(user);
        if (user1!=null)
        {
            //该账号存在
            session.setAttribute("name",user1);
            return "redirect:/index";
        }else{
            //返回登陆页面
            model.addAttribute("error","密码或账号错误");
            return "login";
        }
    }

    //注册
    @RequestMapping("/regist")
    public String regist(User user, Model model){
        //判断数据库是否有该账号
        User user1 = userService.searchUser(user);
        if (user1==null)
        {
            //没有该账号插入数据
            userService.setUser(user);
            return "login";
        }else {
            //有该账号返回注册页面
            model.addAttribute("error","1");
            return "regist";
        }
    }
    @RequestMapping("/cancel")
    public String cancel(HttpSession session){
        session.removeAttribute("name");
         return "redirect:/index";
    }

}
