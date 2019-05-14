<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"
         errorPage="errorPage.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<title>分类管理</title>
<script>
    window.onload = function () {
        var s = "${param.error}";<%-- 必须带""--%>
        if (s !== "") {
            s="删除失败";
            alert(s);
        }
    };
</script>
<div class="pageContainer">
    <!--左导航-->
    <%@include file="../include/admin/adminNavigatorleft.jsp" %>
    <!-- 正文内容部分 -->
    <div class="pageContent">
        <div class="workingArea">
			<form method="post" id="addForm" action="admin_category_add" enctype="multipart/form-data">
				<table class="table table-striped table-bordered table-hover table-condensed" style="margin-bottom:3px">
					<tr>
						<th>增加分类</th>
						<td>名称：<input type="text" id="name" name="name"></td>
						<td><input id="categoryPic" accept="image/*" type="file" name="image"></td>
						<td><input type="submit" value="提交"></td>
					</tr>
				</table>
			</form>
            <table class="table table-striped table-bordered table-hover table-condensed" style="margin-bottom:0">
                <thead>
                <tr class="info">
                    <%--<th>分类编号</th>--%>
                    <%--<th>图片</th>--%>
                    <th>分类名称</th>
                    <th>属性管理</th>
                    <th>商品管理</th>
                    <th>编辑</th>
                    <th>删除</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cs}" var="c"><!--取到model中的cs集合，赋值给c数组，使用foreach从c[0]对象开始遍历-->
                <tr>
                    <td>${c.name}</td>
                    <td><a href="admin_property_list?cid=${c.id}"><span
                            class="glyphicon glyphicon-align-justify"></span></a></td>
                    <td><a href="admin_product_list?cid=${c.id}"><span class="glyphicon glyphicon-align-justify"></span></a>
                    </td>
                    <td><a href="admin_category_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a id="deleteButton" deleteLink="true" href="admin_category_delete?id=${c.id}"><span
                            class="glyphicon glyphicon-trash"></span></a></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="pageDiv">
                <%@include file="../include/admin/adminPage.jsp" %>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/admin/adminFooter.jsp" %>
