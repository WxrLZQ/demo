package com.gdaib.controller;

import com.gdaib.domain.User;
import com.gdaib.service.UserService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.util.Properties;
import java.util.Random;

@Controller
@ResponseBody
@CrossOrigin
@RequestMapping(value = "/User",produces = {"application/json;charset=UTF-8"})
public class UserController {

    @Autowired
    private UserService userService;

    //登录接口
    @RequestMapping("/login")
    public String login(User user){

        Gson gson = new Gson();
        User loginUser = userService.LoginUser(user);
        //判断数据库是否存在改账号，不存在放回1，存在放回该对象数据
        if(loginUser==null)
        {
            return "1";
        }else{
            return gson.toJson(loginUser);
        }

    }

    //注册接口

    @RequestMapping("/register")
    public String register(User user,@RequestParam("code") String code,HttpServletRequest request){
        String number = (String) request.getSession().getAttribute("number");
//        System.out.println(code);
//        System.out.println("验证码为："+number);

//        System.out.println(user);
        if(code.equals(number))
        {
            //查看账号是否重复
            User user1 = userService.FindUser(user);

            if(user1==null){
                //不重复插入到数据库
                userService.Register(user);
                return "1";
            }else {
                return "0";
            }
        }else{
            return "3";

        }
    }

}
