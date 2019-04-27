<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<div class="buyPageDiv">
	<form action="forecreateOrder" method="post">
		<div class="address">
			<div class="addressTip">收货人信息：</div>
			<div>
				<table class="addressTable">
					<tr>
						<td class="firstColumn">详细地址：</td>
						<td><textarea name="address" placeholder="请填写收货地址。">陕西省宝鸡市渭滨区宝鸡文理学院</textarea></td>
					</tr>
					<tr>
						<td>邮政编码：</td>
						<td><input name="post" placeholder="721000" type="text"></td>
					</tr>
					<tr>
						<td>姓名：</td>
						<td><input name="receiver" placeholder="请填写收货人姓名" type="text" value="张三"></td>
					</tr>
					<tr>
						<td>手机号码：</td>
						<td><input name="mobile" placeholder="请填写收货人手机号码" type="text" value="18829223388"></td>
					</tr>
				</table>

			</div>

		</div>
		<div class="productList">
			<div class="productListTip">订单信息：</div>

			<table class="productListTable">
				<thead>
					<tr>
						<th colspan="2" class="productListTableFirstColumn"><a
							class="wangwanglink" href="#nowhere"> <span
								class="wangwangGif"></span>
						</a></th>
						<th>单价</th>
						<th>数量</th>
						<th>总价</th>
					</tr>
					<tr class="rowborder">
						<td colspan="2"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</thead>
				<tbody class="productListTableTbody">
					<c:forEach items="${ois}" var="oi" varStatus="st">
						<tr class="orderItemTR">
							<td class="orderItemFirstTD"><img class="orderItemImg"
								src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg"></td>
							<td class="orderItemProductInfo"><a
								href="foreproduct?pid=${oi.product.id}"
								class="orderItemProductLink"> ${oi.product.name} </a></td>
							<td><span class="orderItemProductPrice">￥<fmt:formatNumber
										type="number" value="${oi.product.promotePrice}"
										minFractionDigits="2" /></span></td>
							<td><span class="orderItemProductNumber">${oi.number}</span>
							</td>
							<td><span class="orderItemTotalSumSpan"> ￥<fmt:formatNumber
										type="number" value="${oi.number*oi.product.promotePrice}"
										minFractionDigits="2" />
							</span></td>
							<c:if test="${st.count==1}">
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="submitOrderDiv">
			<button type="submit" class="submitOrderButton">提交订单</button>
		</div>
	</form>
</div>