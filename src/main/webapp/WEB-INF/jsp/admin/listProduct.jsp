<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" errorPage="errorPage.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>

<script>
    $(function () {
        $("#addForm").submit(function () {
            if (!checkEmpty("name", "产品名称"))
                return false;
            //          if (!checkEmpty("subTitle", "小标题"))
            //              return false;
            if (!checkNumber("originalPrice", "原价格"))
                return false;
            if (!checkNumber("promotePrice", "优惠价格"))
                return false;
            if (!checkInt("stock", "库存"))
                return false;
            return true;
        });
    });
    window.onload = function () {
        var s = "${param.error}";<%-- 必须带""--%>
        if (s !== "") {
            s="删除失败";
            alert(s);
        }
    };
</script>
<title>商品管理</title>
<div class="pageContainer">
    <!--左导航-->
    <%@include file="../include/admin/adminNavigatorleft.jsp" %>
    <!-- 正文内容部分 -->
    <div class="pageContent">
        <div class="productWorkingArea">
            <ol class="breadcrumb">
                <li><a href="admin_category_list">返回</a></li>
                <%--<li><a href="admin_product_list?cid=${c.id}">${c.name}</a></li>--%>
                <%--<li class="active">商品管理</li>--%>
            </ol>
            <div class="listDataTableDiv">
                <table
                        class="table table-striped table-bordered table-hover  table-condensed">
                    <thead>
                    <tr class="info">
                        <!-- 					<th>产品编号</th> -->
                        <th>图片</th>
                        <th>商品名称</th>
                        <th>小标题</th>
                        <th width="53px">原价</th>
                        <th width="80px">优惠价格</th>
                        <th width="80px">库存数量</th>
                        <th width="80px">图片管理</th>
                        <th width="80px">设置属性</th>
                        <th width="42px">编辑</th>
                        <th width="42px">删除</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${ps}" var="p">
                        <tr>
                                <%-- 						<td>${p.id}</td> --%>
                            <td><c:if test="${!empty p.firstProductImage}">
                                <img width="40px" height="40px"
                                     src="img/productSingle/${p.firstProductImage.id}.jpg">
                            </c:if></td>
                            <td>${p.name}</td>
                            <td>${p.subTitle}</td>
                            <td>${p.originalPrice}</td>
                            <td>${p.promotePrice}</td>
                            <td>${p.stock}</td>
                            <td><a href="admin_productImage_list?pid=${p.id}"><span
                                    class="glyphicon glyphicon-picture"></span></a></td>
                            <td><a href="admin_propertyValue_edit?pid=${p.id}"><span
                                    class="glyphicon glyphicon-align-justify"></span></a></td>

                            <td><a href="admin_product_edit?id=${p.id}"><span
                                    class="glyphicon glyphicon-edit"></span></a></td>
                            <td><a deleteLink="true"
                                   href="admin_product_delete?id=${p.id}"><span
                                    class="     glyphicon glyphicon-trash"></span></a></td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="pageDiv">
                <%@include file="../include/admin/adminPage.jsp" %>
            </div>
            <form method="post" id="addForm" action="admin_product_add" >
                <table class="table table-striped table-bordered table-hover  table-condensed ">
                    <tr>
                        <th>增加商品</th>
                        <td>名称：<input type="text" id="name" name="name" ></td>
                        <td>小标题：<input type="text" id="subTitle" name="subTitle" ></td>
                        <td>原价格：<input type="text" id="originalPrice" name="originalPrice" ></td>
                        <td>优惠价格：<input type="text" id="promotePrice" name="promotePrice" ></td>
                        <td>库存：<input type="text" id="stock" name="stock" ></td>
                        <td>
                            <input type="hidden" name="cid" value="${c.id}">
                            <input type="submit" value="提交">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<%@include file="../include/admin/adminFooter.jsp" %>