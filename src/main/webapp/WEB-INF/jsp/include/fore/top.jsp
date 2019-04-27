<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
<nav class="top">
	<a href="forehome"> <span
		class="glyphicon glyphicon-home blueColor"></span>首页
	</a>

	<span class="pull-right">
	<a href="forebought">我的订单</a> 
	<a href="forecart"> 
		<span style="color: #C40000; margin: 0px" class=" glyphicon glyphicon-shopping-cart redColor"></span> 购物车<strong>${cartTotalItemNumber}</strong>件
	</a>
	</span>
	<span class="pull-right">
	<c:if test="${!empty user}">
		<a href="">${user.name}</a>
		<a href="forelogout">退出</a>
	</c:if>

	<c:if test="${empty user}">
		<a href="loginPage">登录</a>
		<a href="registerPage">注册</a>
	</c:if>
</span>	
</nav>
