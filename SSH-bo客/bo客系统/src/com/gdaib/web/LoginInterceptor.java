package com.gdaib.web;

import com.gdaib.domain.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;

public class LoginInterceptor extends MethodFilterInterceptor {
    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {


        System.out.println("我来了");

        //判断用户是否登录
        User user = (User) ServletActionContext.getRequest().getSession().getAttribute("curUser");
        if (user==null){
            ActionSupport action= (ActionSupport) actionInvocation.getAction();
            action.addActionError("你没有访问权限");

            return "login";
        }else {
            //对请求方法放行
            return actionInvocation.invoke();
        }

    }
}

