<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!--顶部导航栏部分-->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" title="logoTitle" href="#">客都后台管理</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li role="presentation">
                    <a href="#">当前用户：${sessionScope.admin.name}</a>
                </li>
                <li>
                    <a href="adminLoginPage">
                        <span class="glyphicon glyphicon-off"></span>退出登录</a>
                </li>
            </ul>
        </div>
    </div>
</nav>