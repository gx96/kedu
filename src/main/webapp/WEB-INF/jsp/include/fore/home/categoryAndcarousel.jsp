<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<script>
// 	function showProductsAsideCategorys(cid) {
// 		$("div.eachCategory[cid=" + cid + "]").css("background-color", "white");
// 		$("div.eachCategory[cid=" + cid + "] a").css("color", "#87CEFA");
// 		$("div.productsAsideCategorys[cid=" + cid + "]").show();
// 	}

// 	function hideProductsAsideCategorys(cid) {
// 		$("div.eachCategory[cid=" + cid + "]").css("background-color",
// 				"#e2e2e3");
// 		$("div.eachCategory[cid=" + cid + "] a").css("color", "#000");
// 		$("div.productsAsideCategorys[cid=" + cid + "]").hide();
// 	}
// 	$(function() {
// 		$("div.eachCategory").mouseenter(function() {
// 			var cid = $(this).attr("cid");
// 			showProductsAsideCategorys(cid);
// 		});
// 		$("div.eachCategory").mouseleave(function() {
// 			var cid = $(this).attr("cid");
// 			hideProductsAsideCategorys(cid);
// 		});
// 		$("div.productsAsideCategorys").mouseenter(function() {
// 			var cid = $(this).attr("cid");
// 			showProductsAsideCategorys(cid);
// 		});
// 		$("div.productsAsideCategorys").mouseleave(function() {
// 			var cid = $(this).attr("cid");
// 			hideProductsAsideCategorys(cid);
// 		});

// 		$("div.rightMenu span").mouseenter(function() {
// 			var left = $(this).position().left;
// 			var top = $(this).position().top;
// 			var width = $(this).css("width");
// 			var destLeft = parseInt(left) + parseInt(width) / 2;
// 			$("img#catear").css("left", destLeft);
// 			$("img#catear").css("top", top - 20);
// 			$("img#catear").fadeIn(500);

// 		});
// 		$("div.rightMenu span").mouseleave(function() {
// 			$("img#catear").hide();
// 		});

// 		var left = $("div#carousel-of-product").offset().left;
// 		$("div.categoryMenu").css("left", left - 20);
// 		$("div.categoryWithCarousel div.head").css("margin-left", left);
// 		$("div.productsAsideCategorys").css("left", left - 20);

// 	});
</script>


<div class="categoryWithCarousel">
	<div style="position: relative;">
		<%@include file="categoryMenu.jsp"%>
	</div>

	<%--<div style="position: relative;">--%>
		<%--<%@include file="productsAsideCategorys.jsp"%>--%>
	<%--</div>--%>
	<div>
		<%@include file="carousel.jsp"%>
	</div>

</div>