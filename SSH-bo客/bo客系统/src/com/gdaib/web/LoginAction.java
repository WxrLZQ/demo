package com.gdaib.web;

import com.gdaib.domain.User;
import com.gdaib.service.LoginService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements ModelDriven<User> {

    private User user=new User();
    @Override
    public User getModel() {
        return user;
    }

    //注入业务层
    private LoginService loginService;

    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    public String login(){
        System.out.println(user);
//        System.out.println("我来了");
        //登录业务逻辑
        User resUser = loginService.login(user);
        //判断是否有该信息
        if (resUser==null){
            //错误信息回显
            this.addActionError("用户名或者密码错误");

            return LOGIN;
        }else {
            //保存用户信息
            ActionContext.getContext().getSession().put("curUser",resUser);
            return SUCCESS;
        }
    }
    public String loginout(){
//        System.out.println("我来了");
        //清空当前到用户session
        ActionContext.getContext().getSession().remove("curUser");
        return "loginout";
    }


}
