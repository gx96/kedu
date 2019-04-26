<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<script>
    $(function () {
        $("#li2").prop("class", "active");
        $("#li1").prop("class", " ");
        $("#li3").prop("class", " ");
        $("#li4").prop("class", " ");
        $("#addForm").submit(function () {
            if (checkEmpty("name", "属性名称"))
                return true;
            return false;
        });
    });
</script>
<title>属性管理</title>
<div class="pageContainer">
    <!--左导航-->
    <%@include file="../include/admin/adminNavigatorleft.jsp" %>
    <!-- 正文内容部分 -->
    <div class="pageContent">
        <div class="workingArea">
            <div class="listDataTableDiv propertyWorkingArea">
                <ol class="breadcrumb">
                    <li><a href="admin_category_list">返回</a></li>
                    <%--<li><a href="admin_property_list?cid=${c.id}">${c.name}</a></li>--%>
                    <%--<li class="active">属性管理</li>--%>
                </ol>
                <table
                        class="table table-striped table-bordered table-hover  table-condensed">
                    <thead>
                    <tr class="info">
                        <th>属性编号</th>
                        <th>属性名称</th>
                        <th>编辑</th>
                        <th>删除</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${ps}" var="p">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.name}</td>
                            <td><a href="admin_property_edit?id=${p.id}"><span
                                    class="glyphicon glyphicon-edit"></span></a></td>
                            <td><a deleteLink="true"
                                   href="admin_property_delete?id=${p.id}"><span
                                    class="     glyphicon glyphicon-trash"></span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="pageDiv">
                <%@include file="../include/admin/adminPage.jsp" %>
            </div>
            <form method="post" id="addForm" action="admin_property_add">
                <table class="table table-striped table-bordered table-hover  table-condensed ">
                    <tr>
                        <th>增加属性</th>
                        <td>属性名称：<input type="text" id="name" name="name"></td>
                        <td><input type="hidden" name="cid" value="${c.id}"><input type="submit" value="提交"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<%@include file="../include/admin/adminFooter.jsp" %>