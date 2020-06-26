<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>博客后台管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.min.css" />
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <style>
        #modal_content2{
            padding: 30px 20px;
            width: 400px;
            height: 245px;
            background: white;
            position: fixed;
            left: 50%;
            top: 50%;
            margin-left: -200px;
            margin-top: -100px;
            display: none;
        }
        #close2{
            position: absolute;
            right: 10px;
            top: 10px;
        }

    </style>


</head>
<body>


<div class="main_top">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">分类管理</strong><small></small></div>
    </div>
    <hr>
    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
            <div class="am-btn-toolbar">
                <div class="am-btn-group am-btn-group-xs">
                    <button id="add" class="am-btn am-btn-default">
                        <span class="am-icon-plus"></span> 添加分类</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="goods_list" id="account_List">
    <ul class="title_ul">
        <li>parentid</li>
        <li>分类名称</li>
        <li>修改分类</li>
        <li>删除分类</li>
    </ul>

    <%--取数据--%>
    <s:iterator value="categorylist">
    <ul class="list_goods_ul">
        <li><s:property value="parentid"/></li>
        <li><s:property value="cname" /></li>
        <li>
            <a href="#" class="updatebtn" data-id="<s:property value="cid"/>" >
                <img class="img_icon" src="${pageContext.request.contextPath}/images/edit_icon.png" alt="">
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/category_delete?cid=<s:property value="cid"/>">
                <img class="img_icon" src="${pageContext.request.contextPath}/images/delete_icon.png" alt="">
            </a>
        </li>
    </ul>
    </s:iterator>




</div>

<div id="modal_view">


</div>

<div id="modal_content">
    <div id="close"><img src="${pageContext.request.contextPath}/images/delete_icon.png" alt=""></div>
    <div class="edit_content">

        <div class="item1">
            <div>
                <span>添加分类：</span>
            </div>
        </div>
        <div class="item1">
            <div>
                <span>parentid:</span>
                <input type="text" class="am-form-field" id="parentid">
                <br/>
                <span>分类名称:</span>
                <input type="text" class="am-form-field" id="cname" >&nbsp;&nbsp;
                <br/>
                <button class="am-btn am-btn-default" type="button" id="addcategory">添加</button>
            </div>
        </div>
    </div>
</div>

<div id="modal_content2">
    <div id="close2"><img src="${pageContext.request.contextPath}/images/delete_icon.png" alt=""></div>
    <div class="edit_content">

        <div class="item1">
            <div>
                <span>添加分类：</span>
            </div>
        </div>
        <div class="item1">
            <div>
                <span>parentid:</span>
                <input type="text" class="am-form-field" id="parentid2">
                <br/>
                <span>分类名称:</span>
                <input type="text" class="am-form-field" id="cname2" >&nbsp;&nbsp;
                <br/>
                <input  type="hidden" id="cid2"  >
                <button class="am-btn am-btn-default" type="button" id="updatebtn">修改</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        $('#add').click(function () {
            $("#modal_view").fadeIn();
            $("#modal_content").fadeIn();
        });

        $("#close").click(function () {
            $("#modal_view").fadeOut();
            $("#modal_content").fadeOut();
        });

        //监听添加按钮点击
        $("#addcategory").click(function () {
            var parentid=$("#parentid").val();
            var cname=$("#cname").val()
            $(window).attr('location','${pageContext.request.contextPath}/category_add?parentid='+parentid+'&cname='+cname);
        })
        //监听添加按钮
        $(".updatebtn").click(function () {
            /*1.当前点的是哪一条数据*/
            var cid=$(this).data("id");
            alert(cid);
            /*取出对应ID的数据,到数据库中查询当前记录
             *返回给页面
             *展示到页面中
             *
             * 发送请求的时候，不需要页面的跳转 Ajax  能够取当前返回数据 展示到界面
             **/
            $.post("${pageContext.request.contextPath}/category_updateUI",{"cid":cid},function (data) {
                console.log("-------json-------")
                console.log(data);
                $("#parentid2").val(data.parentid);
                $("#cname2").val(data.cname);
                $("#cid2").val(data.cid);

            },"json");
            /*2.把修改界面弹出*/
            $("#modal_view").fadeIn();
            $("#modal_content2").fadeIn();

        })
        $("#close2").click(function () {
            $("#modal_view").fadeOut();
            $("#modal_content2").fadeOut();
        });

        $("#updatebtn").click(function () {
            //1.获取文本框值
             var parentid2 =$("#parentid2").val();
             var cname2 =$("#cname2").val();
             var cid2 =$("#cid2").val();
             console.log(cname2);

            //2.发送请求
            $(window).attr('location','${pageContext.request.contextPath}/category_update.action?parentid='+parentid2+'&cname='+cname2+'&cid='+cid2);
        })




    });
</script>
</body>
</html>