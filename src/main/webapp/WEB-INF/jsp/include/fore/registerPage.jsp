<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<title>注册</title>
<script>
    $(function () {
        var userflag = false;
        var password1flag = false;
        var password2flag = false;
        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.registerErrorMessageDiv").css("visibility", "visible");
        </c:if>
        $('input[name="name"][ss="name"]').on("keyup",function () {
            var name = $(this).val().trim();
            if (name.length < 6 || name.length > 12) {
                $(".UserErrorMessage").html("用户名长度为6-12位，可包含数字和字母").css("color", "red");
                $(this).css("border-color", "red");
                userflag=false;
            } else {
                $(".UserErrorMessage").html("输入正确").css("color", "green");
                $(this).css("border-color", "");
                userflag = true;
            }
        });
        $('input[name="password"][ss="password"]').on("keyup",function () {
            var password = $(this).val().trim();
            if (password.length < 6 || password.length > 16) {
                $(".pw1ErrorMessage").html("长度错误").css("color", "red");
                $(this).css("border-color", "red");
            } else {
                var RegExpPassword = /^[A-Za-z][A-Za-z0-9]{5,15}$/
                if (!RegExpPassword.test(password)) {
                    $(".pw1ErrorMessage").html("密码是字母数字的组合,必须以字母开头").css("color", "red");
                    $(this).css("border-color", "red");
                    password1flag=false;
                } else {
                    $(".pw1ErrorMessage").html("输入正确").css("color", "green");
                    $(this).css("border-color", "");
                    password1flag = true;
                }
            }
        });
        $('input[id="repeatpassword"][ss="password2"]').on("keyup",function () {
            var ps = $('input[name="password"][ss="password"]').val().trim();
            var ps2 = $(this).val().trim();
            if (ps != ps2) {
                $(".pw2ErrorMessage").html("两次密码不一致").css("color","red");
                $(this).css("border-color", "red");
                password2flag=false;
            } else {
                $(".pw2ErrorMessage").html("输入正确").css("color", "green");
                $(this).css("border-color", "");
                password2flag = true;
            }
        });
        $(".registerForm").submit(function () {

            if(userflag && password1flag && password2flag){
                return true;
            }
            $(".errorMessage").html("请输入正确的用户名和密码");
            $("div.registerErrorMessageDiv").css("visibility", "visible");
            return false;
        });
    })
</script>
<div class="welcomeRegister">
	<a href="forehome"><img alt="" src="img/site/logo3.jpg"></a><font size="5">欢迎注册</font>
</div>
<div class="registerDiv">
	<form method="post" action="foreregister" class="registerForm">
		<div class="registerErrorMessageDiv">
			<%--<button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>--%>
			<span class="errorMessage"></span>
		</div>
		<div class="form-group">
			<label style="display:block;">用户名：</label>
			<input id="name" name="name" ss="name" style="width: 300px;display:inline;" placeholder="会员名一旦设置成功，无法修改"
				   class="form-control">
			<span class="UserErrorMessage"></span>
		</div>
		<div class="form-group">
			<label style="display:block;">密码：</label>
			<input id="password" name="password" ss="password" style="width: 300px;display:inline;" type="password"
				   placeholder="设置你的登录密码" class="form-control">
			<span class="pw1ErrorMessage"></span>
		</div>
		<div class="form-group">
			<label style="display:block;">再次输入密码：</label>
			<input id="repeatpassword" type="password" ss="password2" style="width: 300px;display:inline;"
				   placeholder="请再次输入你的密码" class="form-control">
			<span class="pw2ErrorMessage"></span>
		</div>
		<div>
			<a href="registerSuccess.jsp" style="color:white">
				<button type="submit" style="width: 300px;display:inline;" class="btn btn-block redButton">确 定</button>
			</a>
		</div>
		<div>
			<span><a href="loginPage" class="pull-center">已有账号？请登录</a></span>
		</div>
	</form>
</div>