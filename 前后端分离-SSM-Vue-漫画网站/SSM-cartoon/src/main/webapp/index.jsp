<%--
  Created by IntelliJ IDEA.
  User: teacher
  Date: 2019-11-21
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <form action="/User/register" method="post">
        email:<input type="text" name="email"><br>
        密码:<input type="text" name="password"><br>
        验证码：<input type="text" name="code"><br>
        <input type="submit" value="提交">
    </form>
    <form action="/Email/send" method="post">
        <input type="text" name="user">
        <input type="submit" value="提交1">
    </form>
    <a href="/Cartoon/homepage">跳转</a>
    <form action="/Cartoon/choice">
        <input type="text" name="recid">
        <input type="submit" value="提交表单">
    </form>

    <form action="/Cartoon/sort">
        <input type="text" name="num1">
        <input type="text" name="num2">
        <input type="submit" value="提交表单">
    </form>

    <form action="/Cartoon/last">
        <input type="text" name="mid">
        <input type="submit" value="提交表单">
    </form>


    <form action="/Cartoon/next">
        <input type="text" name="mid">
        <input type="submit" value="提交表单">
    </form>



    <form action="/Cartoon/chapter">
        <input type="text" name="cid">
        <input type="submit" value="提交表单1">
    </form>
    <form action="/Cartoon/pic">
        <input type="text" name="mid">
        <input type="submit" value="提交表单2">
    </form>
</body>
</html>
