<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>

<script>
    $(function () {
        $("button.orderPageCheckOrderItems").click(function () {
            var oid = $(this).attr("oid");
            $("tr.orderPageOrderItemTR[oid=" + oid + "]").toggle();
        });
    });

</script>
<title>订单管理</title>
<div class="pageContainer">
    <!--左导航-->
    <%@include file="../include/admin/adminNavigatorleft.jsp" %>
    <!-- 正文内容部分 -->
    <div class="pageContent">
        <div class="workingAreaOrder">
            <div class="listDataTableDiv">
                <table class="table table-striped table-bordered table-hover1  table-condensed">
                    <thead>
                    <tr class="info">
                        <th>订单编号</th>
                        <th width="100px">买家名称</th>
                        <th>总金额</th>
                        <th width="100px">商品数量</th>
                        <th>创建时间</th>
                        <th>支付时间</th>
                        <th>发货时间</th>
                        <th>确认收货时间</th>
                        <th>状态</th>
                        <th width="120px">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${os}" var="o">
                        <tr>
                            <td align="center">${o.orderCode}</td>
                            <td align="center">${o.user.name}</td>
                            <td>￥<fmt:formatNumber type="number" value="${o.total}" minFractionDigits="2"/></td>
                            <td align="center">${o.totalNumber}</td>
                            <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${o.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${o.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${o.statusDesc}</td>
                            <td>
                                <button oid=${o.id} class="orderPageCheckOrderItems btn btn-primary btn-xs">查看详情</button>

                                <c:if test="${o.status=='waitDelivery'}">
                                    <a href="admin_order_delivery?id=${o.id}">
                                        <button class="btn btn-primary btn-xs">发货</button>
                                    </a>
                                </c:if>
                            </td>
                        </tr>
                        <tr class="orderPageOrderItemTR" oid=${o.id}>
                            <td colspan="10" align="center">

                                <div class="orderPageOrderItem">
                                    <table width="800px" align="center" class="orderPageOrderItemTable">
                                        <c:forEach items="${o.orderItems}" var="oi">
                                            <tr>
                                                <td align="left">
                                                    <img width="40px" height="40px"
                                                         src="img/productSingle/${oi.product.firstProductImage.id}.jpg">
                                                </td>

                                                <td>
                                                    <a href="foreproduct?pid=${oi.product.id}">
                                                        <span>${oi.product.name}</span>
                                                    </a>
                                                </td>
                                                <td align="right">

                                                    <span class="text-muted">${oi.number}个</span>
                                                </td>
                                                <td align="right">

                                                    <span class="text-muted">单价：￥${oi.product.promotePrice}</span>
                                                </td>

                                            </tr>
                                        </c:forEach>

                                    </table>
                                </div>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="pageDiv">
                <%@include file="../include/admin/adminPage.jsp" %>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/admin/adminFooter.jsp" %>