<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>

<script>
    $(function () {
        $(".addFormSingle").submit(function () {
            if (checkEmpty("filepathSingle", "图片文件")) {
                $("#filepathSingle").value("");
                return true;
            }
            return false;
        });
        $(".addFormDetail").submit(function () {
            if (checkEmpty("filepathDetail", "图片文件"))
                return true;
            return false;
        });
    });
</script>
<title>商品图片管理</title>
<div class="pageContainer">
    <!--左导航-->
    <%@include file="../include/admin/adminNavigatorleft.jsp" %>
    <!-- 正文内容部分 -->
    <div class="pageContent">
        <div class="productWorkingArea1">
            <table class="addPictureTable" align="center">
                <tr>
                    <td colspan="2" class="addPictureTableTD1">
                        <ol class="breadcrumb">
                            <%--<li><a href="admin_category_list">返回</a></li>--%>
                            <li><a href="admin_product_list?cid=${p.category.id}">返回</a></li>
                            <%--<li class="active">${p.name}</li>--%>
                            <%--<li class="active">商品图片管理</li>--%>
                        </ol>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class=" table-striped table-bordered table-hover  table-condensed" style="width: 500px;">
                            <form method="post" class="addFormSingle"
                                  action="admin_productImage_add" enctype="multipart/form-data">
                                <tr>
                                    <td style="width: 100px">商品实拍图片</td>
                                    <td><input id="filepathSingle" type="file" name="image"/></td>
                                    <td align="center" width="80px">
                                        <input type="hidden" name="type" value="type_single"/>
										<input type="hidden" name="pid" value="${p.id}"/>
                                        <button type="submit" class="btn ">提 交</button>
                                    </td>
                                </tr>
                            </form>
                        </table>
                        <table class=" table-striped table-bordered table-hover  table-condensed" style="width: 500px;">
                            <tr>
                                <td style=" width: 100px ">预览</td>
                                <c:forEach items="${pisSingle}" var="pi">
                                    <%--<td>${pi.id}</td>--%>
                                    <td align="center">
                                        <a title="点击查看原图" href="img/productSingle/${pi.id}.jpg">
                                            <img height="60px" width="60px" src="img/productSingle/${pi.id}.jpg">
                                        </a>
                                    </td>
                                </c:forEach>
                            </tr>
                            <tr>
                                <td style="width: 100px">删除</td>
                                <c:forEach items="${pisSingle}" var="pi">
                                    <td align="center">
                                        <a deleteLink="true" href="admin_productImage_delete?id=${pi.id}">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </a>
                                    </td>
                                </c:forEach>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br/>
            <table class="addPictureTable" align="center">
                <tr>
                    <td>
                        <table class=" table-striped table-bordered table-hover  table-condensed" style="width: 500px;">
                            <form method="post" class="addFormDetail" action="admin_productImage_add"
                                  enctype="multipart/form-data">
                                <tr>
                                    <td style="width: 100px">商品介绍图片</td>
                                    <td><input id="filepathDetail" type="file" name="image"/></td>
                                    <td align="center" width="80px">
                                        <input type="hidden" name="type" value="type_detail"/>
                                        <input type="hidden" name="pid" value="${p.id}"/>
                                        <button type="submit" class="btn">提 交</button>
                                    </td>
                                </tr>
                            </form>
                        </table>
                        <table class=" table-striped table-bordered table-hover  table-condensed" style="width: 500px;">
                            <tr>
                                <td style=" width: 100px ">预览</td>
                                <c:forEach items="${pisDetail}" var="pi">
                                    <td align="center">
                                        <a title="点击查看原图" href="img/productDetail/${pi.id}.jpg">
                                            <img height="60px" width="60px" src="img/productDetail/${pi.id}.jpg">
                                        </a>
                                    </td>
                                </c:forEach>
                            </tr>
                            <tr>
                                <td style="width: 100px">删除</td>
                                <c:forEach items="${pisDetail}" var="pi">
                                    <td align="center">
                                        <a deleteLink="true" href="admin_productImage_delete?id=${pi.id}">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </a>
                                    </td>
                                </c:forEach>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<%@include file="../include/admin/adminFooter.jsp" %>