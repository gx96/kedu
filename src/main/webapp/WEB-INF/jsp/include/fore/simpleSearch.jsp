<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<div class="searchFrame1" style="margin: 0px 400px">
	<form action="foresearch" method="post">
		<div class="searchinput1">
			<input type="text" class="form-control" placeholder="在此输入您要购买的商品"
				name="keyword">
		</div>
		<div class="searchbutton1">
			<button type="submit" class="form-control">
				<span class="glyphicon glyphicon-search"></span>
			</button>
		</div>
	</form>
	<div class="addCartButton1" >
		<a href="forecart" style="color:#c40000;"><span class="glyphicon glyphicon-shopping-cart" style="color:#c40000;"></span>我的购物车<strong>${cartTotalItemNumber}</strong>件</a>
	</div>
	<div style="clear: both"></div>
</div>