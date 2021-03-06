<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<title>确认支付</title>
<div class="confirmPayPageDiv">
	<div class="confirmPayOrderItemDiv">
		<table class="confirmPayOrderItemTable">
			<thead>
			<th colspan="2">商品</th>
			<th width="120px">单价</th>
			<th width="120px">数量</th>
			<th width="120px">总价</th>
			</thead>
			<c:forEach items="${o.orderItems}" var="oi">
				<tr>
					<td><img width="50px" src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg"></td>
					<td class="confirmPayOrderItemProductLink">
						<a href="#nowhere">${oi.product.name}</a>
					</td>
					<td>￥<fmt:formatNumber type="number" value="${oi.product.promotePrice}" minFractionDigits="2"/></td>
					<td>${o.totalNumber}</td>
					<td><span class="">￥<fmt:formatNumber type="number" value="${o.total}"
														  minFractionDigits="2"/></span></td>
				</tr>
			</c:forEach>
		</table>
		<%----%>
		<%--<div class="confirmPayOrderItemText pull-right">--%>
		<%--付款： <span class="confirmPayOrderItemSumPrice">￥<fmt:formatNumber type="number" value="${o.total}" minFractionDigits="2"/></span>--%>
		<%--</div>--%>


	</div>
	<div class="confirmPayOrderDetailDiv">

		<table class="confirmPayOrderDetailTable">
			<tr>
				<td>订单编号：</td>
				<td>${o.orderCode} </td>
			</tr>
			<tr>
				<td>付款：</td>
				<td><span class="confirmPayOrderItemSumPrice">￥<fmt:formatNumber type="number" value="${o.total}"
																				 minFractionDigits="2"/></span></td>
			</tr>
			<tr>
				<td>收货信息：</td>
				<td>${o.address}，${o.receiver}， ${o.mobile}，${o.post} </td>
			</tr>
			<tr>
				<td>成交时间：</td>
				<td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
		</table>

	</div>
	<div class="confirmPayButtonDiv">
		<a href="foreorderConfirmed?oid=${o.id}">
			<button class="confirmPayButton">确认</button>
		</a>
	</div>
</div>