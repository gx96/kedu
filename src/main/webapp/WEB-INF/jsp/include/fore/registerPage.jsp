<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<script>
$(function(){
     
    <c:if test="${!empty msg}">
    $("span.errorMessage").html("${msg}");
    $("div.registerErrorMessageDiv").css("visibility","visible");      
    </c:if>
     
    $(".registerForm").submit(function(){
        if(0==$("#name").val().length){
            $("span.UserErrorMessage").html("请输入用户名");
            $("div.registerErrorMessageDiv").css("visibility","visible");          
            return false;
        }      
        if(0==$("#password").val().length){
            $("span.pw1ErrorMessage").html("请输入密码");
            $("div.registerErrorMessageDiv").css("visibility","visible");          
            return false;
        }      
        if(0==$("#repeatpassword").val().length){
            $("span.pw2ErrorMessage").html("请再次输入密码");
            $("div.registerErrorMessageDiv").css("visibility","visible");          
            return false;
        }      
        if($("#password").val() !=$("#repeatpassword").val()){
            $("span.pw2ErrorMessage").html("两次密码不一致");
            $("div.registerErrorMessageDiv").css("visibility","visible");          
            return false;
        }      
 
        return true;
    });
})
</script>
<style>
	.login1{
	width: 400px;
	height:6px;
	background-color: #fff;
	text-align: center;
	margin-left: 50px;
	line-height: 10px;
	}
</style>
<div class="login1">
	<a href="forehome"><img alt="" src="img/site/logo3.jpg"></a><font size="5">欢迎注册</font>
</div>
<div class="registerDiv">
<div class="registerDiv1">
	<form method="post" action="foreregister" class="registerForm">
		<div class="registerErrorMessageDiv">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close"></button>
				<span class="errorMessage"></span>

		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">用户名：</label> <input id="name"
				name="name" placeholder="会员名一旦设置成功，无法修改" class="form-control">
				<span class="UserErrorMessage"></span>
		</div>
		<div style=""></div>
		<div class="form-group">
			<label for="exampleInputPassword1">密码：</label> <input id="password"
				name="password" type="password" placeholder="设置你的登陆密码"
				class="form-control">
				<span class="pw1ErrorMessage"></span>
		</div>
		<div class="form-group">
			<label for="exampleInputFile">再次输入密码：</label> <input
				id="repeatpassword" type="password" placeholder="请再次输入你的密码"
				class="form-control">
				<span class="pw2ErrorMessage"></span>
		</div>
		<div style="text-align: center">
			<a href="registerSuccess.jsp"><button type="submit" class="btn btn-block redButton">确 定</button></a>
		</div>
		<div>
                <span><a href="loginPage" class="pull-right">已有账号？请登录</a></span>
            </div>
	</form>
</div>
</div>