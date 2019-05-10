<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<div class="allbackgroundcolor">
	<div class="searchDiv">
		<div class="searchFrame">
			<form action="foresearch" method="post">
				<div class="searchinput">
					<input type="text" class="form-control" placeholder="在此输入您要购买的商品" name="keyword">
				</div>
				<div class="searchbutton">
					<button type="submit" class="form-control">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</div>
			</form>
			<div class="addCartButton1" id="addCartButton1">
				<a href="forecart" style="color:#c40000;"><span
						class="glyphicon glyphicon-shopping-cart"></span>我的购物车<strong>${cartTotalItemNumber}</strong>件</a>
			</div>
		</div>
	</div>
</div>