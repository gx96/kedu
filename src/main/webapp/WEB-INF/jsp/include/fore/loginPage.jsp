<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
 
<script>
    $(function(){
 
        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.loginErrorMessageDiv").show();
        </c:if>
 
        $("form.loginForm").submit(function(){
            if(0==$("#name").val().length||0==$("#password").val().length){
                $("span.errorMessage").html("请输入账号密码");
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
<div class="login1">
	<a href="forehome"><img alt="" src="img/site/logo3.jpg"></a><font size="5">欢迎登录</font>
</div>
<div id="loginDiv" style="position: relative">
    <img id="loginBackgroundImg" class="loginBackgroundImg" src="img/site/login.jpg">
    <form class="loginForm" action="forelogin" method="post">
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
             <div>
                <span><a href="registerPage" class="pull-right">还没有账号？立即注册</a></span>
            </div>
        </div>
    </form>
 
</div>   