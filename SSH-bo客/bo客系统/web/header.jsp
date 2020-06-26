<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
    String ctx = request.getContextPath();
    pageContext.setAttribute("ctx", ctx);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title>po客(baidu.com)</title>
    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="stylesheet" href="${ctx}/js/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${ctx}/css/base.css">
    <link rel="stylesheet" href="${ctx}/css/lkblog.css">
    <link rel="stylesheet" href="${ctx}/css/blog_con.css">
    <link rel="stylesheet" href="${ctx}/css/pageStyle.css">
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/paging.js"></script>
</head>

<body>
<div id="top_bar" class="container hidden-xs hidden-sm">
    <div class="row">
        <div class="col-md-offset-1 col-md-7">
            <ul class="top-bar-left">
                <li style="margin-right: 20px;">
                    <a href="#" target="_blank">
                        <span class="icon-tel"></span>
                        想看啥,就上po客看
                    </a>
                </li>
                <li>
                    <a href="http://www.baidu.com" target="_blank">
                        <span class="icon-email"></span>
                        www.baidu.com
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-offset-3">
            <span class="top-bar-right pull-right">喜欢IT, 就来<span style="color: red">po课</span> (www.bai<span style="color: red">du</span>.com)</span>
        </div>
    </div>
</div>
<!--导航-->
<nav class="navbar navbar-default navbar-lk">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

            <a class="navbar-brand" href="https://image.baidu.com/search/index?ct=201326592&cl=2&st=-1&lm=-1&nc=1&ie=utf-8&tn=baiduimage&ipn=r&rps=1&pv=&fm=rs1&word=%E5%A4%8D%E4%BB%87%E8%80%85%E8%81%94%E7%9B%9Flogo%E5%90%AB%E4%B9%89&oriquery=%E5%A4%8D%E4%BB%87%E8%80%85%E8%81%94%E7%9B%9F%E5%9B%BE%E6%A0%87&ofr=%E5%A4%8D%E4%BB%87%E8%80%85%E8%81%94%E7%9B%9F%E5%9B%BE%E6%A0%87&sensitive=0&z=0&ic=0&width=0&height=0&latest=0&hd=1&copyright=0" style="margin-left: 180px">
                <img src="${ctx}/images/timg.jpeg" width="220" height="66">
            </a>

            <ul class="nav navbar-nav" id="nav" style="font-size: 20px">
                <li class="active"><a href="index.jsp">po客首页</a></li>

            </ul>
            <a href="${ctx}/mgr_login.jsp" style="line-height:95px; height: 95px;font-size: 18px; color: #0a628f">
                发布文章
            </a>
        </div>
    </div>
</nav>
<!--banner-->
<section id="lk_blog_one">
    <img src="#" alt="" class="one-img" width="280">
    <div class="one-right">
        <h1>po课技术专栏</h1>
        <span>喜欢IT,就来po课吧!</span>
        <div style="position: relative;" class="one-bottom">
            <button>关注我们</button>
            <img src="#" alt="" width="100" class="one-ewm">
        </div>
    </div>
</section>


<script>
    $(function () {
        //发送请求获取分类数据
        $.post("${pageContext.request.contextPath}/article_getCategory",{"parentid":0},function (data) {
            //遍历数组
            $(data).each(function (i,obj) {
                $("#nav").append("<li class='active'><a href='index.jsp?parentid="+obj.cid+"'>" +obj.cname  +"</a></li>")
            })
        },"json");
    })
</script>
