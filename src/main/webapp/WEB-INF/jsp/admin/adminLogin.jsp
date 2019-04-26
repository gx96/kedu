<%--
  Created by IntelliJ IDEA.
  User: win
  Date: 2019/4/25
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="js/jquery/2.0.0/jquery.min.js"></script><!--通过在springMVC中的配置，将静态资源路径映射到webapp目录下-->
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link href="css/fore/style.css" rel="stylesheet">
<html>
<head>
    <title>管理员登录</title>
    <script>
        $(function(){

            <c:if test="${!empty msg}">
            $("span.errorMessage").html("${msg}");
            $("div.loginErrorMessageDiv").show();
            </c:if>

            $("form.loginForm").submit(function(){
                if(0==$("#name").val().length||0==$("#password").val().length){
                    $("span.errorMessage").html("请输入完整的账号和密码");
                    $("div.loginErrorMessageDiv").show();
                    return false;
                }
                return true;
            });

            $("form.loginForm input").keyup(function(){
                $("div.loginErrorMessageDiv").hide();
            });

            var left = window.innerWidth/2+162;
            $("div.loginSmallDiv").css("left",left);
        })
    </script>
    <style>
        .login1{
            width: 400px;
            height:68px;
            background-color: #fff;
            text-align: center;
            margin-left: 50px;
            line-height: 10px;
        }
    </style>
</head>
<body>



<div class="login1">
    <a href="forehome"><img alt="" src="img/site/logo3.jpg"></a><font size="5">管理员登录</font>
</div>
<div id="loginDiv" style="position: relative">
    <img id="loginBackgroundImg" class="loginBackgroundImg" src="img/site/login.jpg">
    <form class="loginForm" action="adminlogin" method="post">
        <div id="loginSmallDiv" class="loginSmallDiv">
            <div class="loginErrorMessageDiv">
                <div class="alert alert-danger" >
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                    <span class="errorMessage"></span>
                </div>
            </div>
            <div class="loginInput" >
                <span class="loginInputIcon ">
                    <span class=" glyphicon glyphicon-user"></span>
                </span>
                <input id="name" name="name" placeholder="用户名" type="text">
            </div>

            <div class="loginInput " >
                <span class="loginInputIcon ">
                    <span class=" glyphicon glyphicon-lock"></span>
                </span>
                <input id="password" name="password" type="password" placeholder="密码" type="text" >
            </div>
            <div style="margin-top:20px">
                <button class="btn btn-block redButton" type="submit">登录</button>
            </div>
        </div>
    </form>

</div>
</body>
</html>
