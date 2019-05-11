<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/admin/adminHeader.jsp" %>
<%@include file="../include/admin/adminNavigator.jsp" %>
<style type="text/css">
	/*---------------------------------------demo css--------------------------------------------*/

	.date_selector, .date_selector * {
		width: auto;
		height: auto;
		border: none;
		background: none;
		margin: 0;
		padding: 0;
		text-align: left;
		text-decoration: none;
	}

	.date_selector {
		background: #fbfbfb;
		border: 1px solid #ccc;
		padding: 10px;
		margin: 0;
		margin-top: -1px;
		position: absolute;
		z-index: 100000;
		display: none;
		border-radius: 3px;
		box-shadow: 0 0 5px #aaa;
		box-shadow: 0 2px 2px #ccc;
		width: 260px;
		left:555px;
		top:75px;
	}
	.date_selector_ieframe {
		position: absolute;
		z-index: 99999;
		display: none;
	}

	.date_selector .nav {
		width: 17.5em;
	}

	.date_selector .nav p {
		clear: none;
	}

	.date_selector .month_nav, .date_selector .year_nav {
		margin: 0 0 3px 0;
		padding: 0;
		display: block;
		position: relative;
		text-align: center;
	}

	.date_selector .month_nav {
		float: left;
		width: 55%;
	}

	.date_selector .year_nav {
		float: right;
		width: 42%;
		margin-right: -8px;
	}

	.date_selector .month_name, .date_selector .year_name {
		font-weight: bold;
		line-height: 20px;
	}

	.date_selector .button {
		display: block;
		position: absolute;
		top: 0;
		width: 18px;
		height: 18px;
		line-height: 16px;
		font-weight: bold;
		color: #5985c7;
		text-align: center;
		font-size: 12px;
		overflow: hidden;
		border: 1px solid #ccc;
		border-radius: 2px;
	}

	.date_selector .button:hover, .date_selector .button.hover {
		background: #5985c7;
		color: #fff;
		cursor: pointer;
		border-color: #3a930d;
	}

	.date_selector .prev {
		left: 0;
	}

	.date_selector .next {
		right: 0;
	}

	.date_selector table {
		border-spacing: 0;
		border-collapse: collapse;
		clear: both;
		margin: 0;
		width: 220px;
	}

	.date_selector th, .date_selector td {
		width: 2.5em;
		height: 2em;
		padding: 0 !important;
		text-align: center !important;
		color: #666;
		font-weight: normal;
	}

	.date_selector th {
		font-size: 12px;
	}

	.date_selector td {
		border: 1px solid #f1f1f1;
		line-height: 2em;
		text-align: center;
		white-space: nowrap;
		color: #5985c7;
		background: #fff;
	}

	.date_selector td.today {
		background: #eee;
	}

	.date_selector td.unselected_month {
		color: #ccc;
	}

	.date_selector td.selectable_day {
		cursor: pointer;
	}

	.date_selector td.selected {
		background: #2b579a;
		color: #fff;
		font-weight: bold;
	}

	.date_selector td.selectable_day:hover, .date_selector td.selectable_day.hover {
		background: #5985c7;
		color: #fff;
	}

	/*-----------------------------------------------------------------------------------*/

</style>
<script>
    $(function () {
        $("button.orderPageCheckOrderItems").click(function () {
            var oid = $(this).attr("oid");
            $("tr.orderPageOrderItemTR[oid=" + oid + "]").toggle();
        });

        $('.date_picker').date_input();
    });
</script>
<title>订单管理</title>
<div class="pageContainer">
	<!--左导航-->
	<%@include file="../include/admin/adminNavigatorleft.jsp" %>
	<!-- 正文内容部分 -->
	<div class="pageContent">
		<div style="width: 950px;">
			<div style="padding: 40px 60px;">
				<div style="float:left;">
					<form action="selectOrderCode" method="post">
						<table>
							<tr>
								<td>订单号：<input type="text" name="orderCode"
											   style="width:170px;padding:7px 10px;border:1px solid #bbb;margin-right:10px; border-radius: 3px;">
								</td>
								<td><input type="submit" id="orderNumber" value="查询"></td>
							</tr>
						</table>
					</form>
				</div>
				<div style="float:right;">
					<form action="selectOrderDate" method="post">
						<table>
							<tr>
								<td>
									创建订单时间：<input style="width:160px;border: 1px solid #bbb;color: #333;padding: 7px;border-radius: 3px;" type="text" class="date_picker" name="startDate">
									- <input style="width:160px;border: 1px solid #bbb;color: #333;padding: 7px;border-radius: 3px; margin-right: 10px" type="text" class="date_picker" name="endDate">
								</td>
								<td><input type="submit" id="orderDate" value="查询"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<c:if test="${orders==null}">
			<div class="workingAreaOrder">
				<div class="listDataTableDiv">
					<table class="table table-striped table-bordered table-hover1  table-condensed">
						<thead>
						<tr class="info">
							<th>订单编号</th>
							<th width="70px">买家名称</th>
							<th>总金额</th>
							<th width="70px">商品数量</th>
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
									<button class="orderPageCheckOrderItems btn btn-primary btn-xs
									" oid=${o.id}>查看详情
									</button>

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
											<c:forEach items="${o.orderItems}" var="oi" varStatus="status">
												<c:if test="${status.index==0}">
													<tr>
														<td>收货人信息：</td>
														<td>
																${o.receiver}
														</td>
														<td>
																${o.address}
														</td>
														<td>
																${o.mobile}
														</td>
													</tr>
												</c:if>
												<tr>
													<td>商品信息：</td>
													<td>
														<img width="40px" height="40px"
															 src="img/productSingle/${oi.product.firstProductImage.id}.jpg">
													</td>

													<td>
														<a href="foreproduct?pid=${oi.product.id}">
															<span>${oi.product.name}</span>
														</a>
													</td>
													<td>
														<span>${oi.number}个</span>
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
		</c:if>
		<c:if test="${orders!=null}">
			<div class="workingAreaOrder">
				<div class="listDataTableDiv">
					<table class="table table-striped table-bordered table-hover1  table-condensed">
						<thead>
						<tr class="info">
							<th>订单编号</th>
							<th width="70px">买家名称</th>
							<th>总金额</th>
							<th width="70px">商品数量</th>
							<th>创建时间</th>
							<th>支付时间</th>
							<th>发货时间</th>
							<th>确认收货时间</th>
							<th>状态</th>
							<th width="120px">操作</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${orders}" var="order">
						<tr>
							<td align="center">${order.orderCode}</td>
							<td align="center">${order.user.name}</td>
							<td>￥<fmt:formatNumber type="number" value="${order.total}" minFractionDigits="2"/></td>
							<td align="center">${order.totalNumber}</td>
							<td><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td><fmt:formatDate value="${order.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td><fmt:formatDate value="${order.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td><fmt:formatDate value="${order.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${order.statusDesc}</td>
							<td>
								<button class="orderPageCheckOrderItems btn btn-primary btn-xs" oid=${order.id}>查看详情
								</button>

								<c:if test="${order.status=='waitDelivery'}">
									<a href="admin_order_delivery?id=${order.id}">
										<button class="btn btn-primary btn-xs">发货</button>
									</a>
								</c:if>
							</td>
						</tr>
						<tr class="orderPageOrderItemTR" oid=${order.id}>
							<td colspan="10" align="center">
								<div class="orderPageOrderItem">
									<table width="800px" align="center" class="orderPageOrderItemTable">
										<c:forEach items="${order.orderItems}" var="oi" varStatus="status">
											<c:if test="${status.index==0}">
												<tr>
													<td>收货人信息：</td>
													<td>
															${order.receiver}
													</td>
													<td>
															${order.address}
													</td>
													<td>
															${order.mobile}
													</td>
												</tr>
											</c:if>
											<tr>
												<td>商品信息：</td>
												<td>
													<img width="40px" height="40px"
														 src="img/productSingle/${oi.product.firstProductImage.id}.jpg">
												</td>
												<td>
													<a href="foreproduct?pid=${oi.product.id}">
														<span>${oi.product.name}</span>
													</a>
												</td>
												<td>
													<span>${oi.number}个</span>
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
					<%--<div class="pageDiv">--%>
						<%--<%@include file="../include/admin/adminPage.jsp" %>--%>
					<%--</div>--%>
				</div>
			</div>
		</c:if>
	</div>
</div>
<%@include file="../include/admin/adminFooter.jsp" %>