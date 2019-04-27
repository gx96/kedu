<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!-- 左侧导航栏 -->
<%--<script>--%>
    <%--$(function(){--%>
        <%--$(".nav li").click(function() {--%>
            <%--$(".active").removeClass('active');--%>
            <%--$(this).addClass("active");--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>
<div class="pageSidebar">
    <ul class="nav nav-stacked nav-pills">
        <li role="presentation">
            <a href="admin_category_list" target="mainFrame"><span class="glyphicon glyphicon-th-large"></span>  分类管理</a>
        </li>
        <li role="presentation">
            <a href="admin_user_list" target="mainFrame"><span class="glyphicon glyphicon-user"></span>  用户管理</a>
        </li>
        <li role="presentation">
            <a href="admin_order_list" target="mainFrame"><span class="glyphicon glyphicon-list-alt"></span>  订单管理</a>
        </li>
    </ul>
</div>

