package com.gdaib.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
@RequestMapping("/Email")
public class EmailController {
    @RequestMapping("/send")
    public String email(@RequestParam("user") String user, HttpServletRequest request) throws MessagingException {
        Properties properties = new Properties();
        properties.put("mail.transport.protocol", "smtp");// 连接协议
        properties.put("mail.smtp.host", "smtp.qq.com");// 主机名
        properties.put("mail.smtp.port", 465);// 端口号
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.enable", "true");// 设置是否使用ssl安全连接 ---一般都使用
        properties.put("mail.debug", "true");// 设置是否显示debug信息 true 会在控制台显示相关信息
        // 得到回话对象
        Session session = Session.getInstance(properties);
        // 获取邮件对象
        Message message = new MimeMessage(session);
        // 设置发件人邮箱地址
        message.setFrom(new InternetAddress("1454054667@qq.com"));
        // 设置收件人邮箱地址

        message.setRecipients(Message.RecipientType.TO,
                new InternetAddress[]{new InternetAddress(user)});
        //创建随机符号
        String str="abcdefghijklmnopqrstuvwxyz0123456789";
        Random random=new Random();
        StringBuffer c=new StringBuffer();
        for(int i=0;i<4;i++){
            int number=random.nextInt(62);
            c.append(str.charAt(number));
        }
        request.getSession().setAttribute("number",c.toString());

        // 设置邮件标题
        message.setSubject("验证码");

        // 设置邮件内容
        message.setText(c.toString());

        // 得到邮差对象
        Transport transport = session.getTransport();

        // 连接自己的邮箱账户
        transport.connect("1454054667@qq.com", "inwqdxejxuhcia");// 密码为QQ邮箱开通的stmp服务后得到的客户端授权码
        // 发送邮件
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        return "list";
    }
}
