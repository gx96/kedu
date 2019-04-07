<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>

<script>
    $(function () {
        $("#li2").prop("class", "active");
        $("#li1").prop("class", " ");
        $("#li3").prop("class", " ");
        $("#li4").prop("class", " ");
    });
</script>
<title>分类管理</title>
<div class="workingArea">
    <table class="table table-striped table-bordered table-hover  table-condensed ">
        <thead>
        <tr class="info">
            <th align=center>分类编号</th>
            <!-- 				<th>图片</th> -->
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
                <td align=center>${c.id}</td>
                    <%--<td><img height="40px" src="img/category/${c.id}.jpg"></td> --%>
                <td>${c.name}</td>
                <td><a href="admin_property_list?cid=${c.id}"><span class="glyphicon glyphicon-align-justify"></span></a></td>
                <td><a href="admin_product_list?cid=${c.id}"><span class="glyphicon glyphicon-align-justify"></span></a></td>
                <td><a href="admin_category_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                <!--deleteLink是自创的属性，配合jQuery使用-->
                <td><a deleteLink="true" href="admin_category_delete?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp" %>
    </div>
</div>
<div class="panel panel-warning addDiv">
    <div class="panel-heading" style="background-color: #d1EEEE">
        <b>增加分类</b>
    </div>
    <div class="panel-body">
        <%--1. method="post" 用于保证中文的正确提交--%>
        <%--2. 必须有enctype="multipart/form-data"，这样才能上传文件--%>
        <%--3. accept="image/*" 这样把上传的文件类型限制在了图片--%>
        <form method="post" id="addForm" action="admin_category_add" enctype="multipart/form-data">
            <table class="addTable">
                <tr>
                    <td>分类名称：<input id="name" name="name" type="text" class="form-control"></td>
                </tr>
                <tr>
                    <td>分类图片：<input id="categoryPic" accept="image/*" type="file" name="image"/></td>
                </tr>
                <tr class="submitTR">
                    <td colspan="2" align="center">
                        <button type="submit" class="btn btn-success">提 交</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<%@include file="../include/admin/adminFooter.jsp" %>
