<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<title>编辑分类</title>
<script>
    $(function () {
        $("#editForm").submit(function () {
            if (!checkEmpty("name", "分类名称"))
                return false;

            return true;
        });
    });
    $(function () {
        $("#li2").prop("class", "active");
        $("#li1").prop("class", " ");
        $("#li3").prop("class", " ");
        $("#li4").prop("class", " ");
    });
</script>
<div class="pageContainer">
    <!--左导航-->
    <%@include file="../include/admin/adminNavigatorleft.jsp" %>
    <!-- 正文内容部分 -->
    <div class="pageContent">
        <div class="workingArea">
            <div class="panel panel-warning editDiv">
                <ol class="breadcrumb">
                    <li><a href="admin_category_list">返回</a></li>
                    <%--<li class="active">编辑分类</li>--%>
                </ol>
                <div class="panel-body">
                    <form method="post" id="editForm" action="admin_category_update"
                          enctype="multipart/form-data">
                        <table class="editTable">
                            <tr>
                                <td>分类名称：</td>
                            </tr>
                            <tr>
                                <td><input id="name" name="name" value="${c.name}"
                                           type="text" class="form-control"></td>
                            </tr>
                            <tr>
                                <td>分类图片：</td>
                            </tr>
                            <tr>
                                <td><input id="categoryPic" accept="image/*" type="file"
                                           name="image"/></td>
                            </tr>
                            <tr class="submitTR">
                                <td colspan="2" align="center"><input type="hidden" name="id"
                                                                      value="${c.id}">
                                    <button type="submit" class="btn btn-success">提 交</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>