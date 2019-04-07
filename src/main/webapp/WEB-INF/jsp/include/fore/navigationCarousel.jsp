<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="js/jquery/2.0.0/jquery.min.js"></script>
	<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
</head>
<style>
	div.categoryWithCarousel {
		width: 100%;
		position: relative;
	}
	
	div.categoryWithCarousel div.headbar {
		background-color: #DD2727;
	}
	
	div.categoryWithCarousel div.head {
		width: 250px;
		background-color: #C60A0A;
		height: 36px;
		line-height: 36px;
		font-size: 16px;
		font-weight: bold;
		color: white;
		display: inline-block;
	}
	
	div.carousel-of-product {
		height: 431px;
		width: 566px;
		margin-left: 250px;
	}
	
	img.carouselImage {
		height: 431px !important;
	}
	
	div.carouselBackgroundDiv {
		width: 100%;
		height: 431px;
		background-color:#F5F5F5;
		position: absolute;
		top: 36px;
		z-index: -1;
	}
</style>
<style>
	div.categoryMenu {
		width: 250px;
		background-color: white;
		margin-top: 36px;
		position: absolute;
		left: 0;
		top: 0;
		z-index: 1;
	}
	
	div.categoryMenu a {
		color: #000;
	}
	
	div.categoryMenu a:hover {
		color: lightskyblue;
		text-decoration: none;
	}
	
	div.productsAsideCategorys {
		margin-top: 36px;
		width: 650px;
		height: 431px;
		background-color: white;
		margin-left: 220px;
		position: absolute;
		left: 0;
		top: 0;
		z-index: 1;
	}
	
	div.productsAsideCategorys div.row {
		margin: 20px 80px 0px 80px;
	}
	
	div.productsAsideCategorys div.row div.seperator {
		margin-top: 20px;
		border-bottom-style: dashed;
		border-bottom-width: 1px;
		border-bottom-color: #e7e7e7;
	}
	
	div.productsAsideCategorys a {
		color: #999;
		font-size: 14px;
		margin: 8px;
	}
	
	div.productsAsideCategorys a:hover {
		color: #C40000;
		text-decoration: none;
	}
	
	div.eachCategory {
		line-height: 30px;
		padding-left: 10px;
		font-size: 14px;
	}
	
	div.eachCategory span {
		margin-right: 10px;
	}
	
	div.eachCategory:hover {
		background-color: white;
	}
</style>
<style>
	div.homepageCategoryProducts {
		background-color: #F5F5F5;
		padding: 50px 10px;
		margin: 0px auto;
		/*max-width: 1013px;*/
	}
	
	div.productItem {
		width: 189px;
		height: 285px;
		border: 1px solid white;
		/*background-color: white;*/
		/*margin: 8px 4px;*/
		float: left;
		cursor: pointer;
	}
	
	div.productItem span.productItemDesc {
		font-size: 12px;
		color: #000;
		display: block;
		padding: 16px;
	}
	
	div.productItem span.productPrice {
		font-size: 16px;
		color: #FF003A;
		display: block;
		padding-left: 16px;
		margin-top: -10px;
	}
	
	div.productItem img {
		width: 187px;
		height: 190px;
	}
	
	div.productItem img:hover {
		opacity: 0.7;
		filter: alpha(opacity=70);
	}
	
	div.eachHomepageCategoryProducts {
		margin: 0px 0px 40px 0px;
	}
	
	a.productItemDescLink {
		display: inline-block;
		height: 66px;
		text-decoration: none;
	}
	
	span.categoryTitle {
		font-size: 16px;
		margin-left: 30px;
		color: #C40000;
		font-weight: bold;
	}
</style>
<script>
function showProductsAsideCategorys(cid){
    $("div.eachCategory[cid="+cid+"]").css("background-color","white");
    $("div.eachCategory[cid="+cid+"] a").css("color","#87CEFA");
    $("div.productsAsideCategorys[cid="+cid+"]").show();
}
 
function hideProductsAsideCategorys(cid){
    $("div.eachCategory[cid="+cid+"]").css("background-color","#e2e2e3");
    $("div.eachCategory[cid="+cid+"] a").css("color","#000");
    $("div.productsAsideCategorys[cid="+cid+"]").hide();
}
 
$(function(){
    $("div.eachCategory").mouseenter(function(){
        var cid = $(this).attr("cid");
        showProductsAsideCategorys(cid);
    });
    $("div.eachCategory").mouseleave(function(){
        var cid = $(this).attr("cid");
        hideProductsAsideCategorys(cid);
    });
    $("div.productsAsideCategorys").mouseenter(function(){
        var cid = $(this).attr("cid");
        showProductsAsideCategorys(cid);
    });
    $("div.productsAsideCategorys").mouseleave(function(){
        var cid = $(this).attr("cid");
        hideProductsAsideCategorys(cid);
    });
});
</script>
<div class="categoryWithCarousel">
	<div style="position: relative">
		<div class="categoryMenu ">
			<div class="eachCategory" cid="1">
				<a href="#nowhere">女装 / 男装 / 内衣</a>
				<span class="glyphicon glyphicon-chevron-right"></span>
			</div>
			<div class="eachCategory" cid="2">
				<a href="#nowhere">鞋靴 / 箱包 / 配件</a>
				<span class="glyphicon glyphicon-chevron-right"></span>
			</div>
			<div class="eachCategory" cid="3">
				<a href="#nowhere">童装玩具 / 孕产 / 用品</a>
				<span class="glyphicon glyphicon-chevron-right"></span>
			</div>
			<div class="eachCategory" cid="4">
				<a href="#nowhere">家电 / 数码 / 手机</a>
				<span class="glyphicon glyphicon-chevron-right"></span>
			</div>
			<div class="eachCategory" cid="5">
				<a href="#nowhere">美妆/ 洗护 / 保健品</a>
				<span class="glyphicon glyphicon-chevron-right"></span>
			</div>
			<div class="eachCategory" cid="6">
				<a href="#nowhere">珠宝 / 眼镜 / 手表</a>
				<span class="glyphicon glyphicon-chevron-right"></span>
			</div>
			<div class="eachCategory" cid="7">
				<a href="#nowhere">运动 / 户外 / 乐器</a>
				<span class="glyphicon glyphicon-chevron-right"></span>
			</div>
			<div class="eachCategory" cid="8">
				<a href="#nowhere">游戏 / 动漫 / 影视</a>
				<span class="glyphicon glyphicon-chevron-right"></span>
			</div>
		</div>
	</div>
	<div style="position: relative;left: 0;top: 0;">
		<div class="productsAsideCategorys" cid="1">
			<div class="row ">
				<!--<span style="font-size: 20px">女装</span>-->
				<a href="#nowhere">短外套</a>
				<a href="#nowhere">衬衫</a>
				<a href="#nowhere">T恤</a>
				<a href="#nowhere">卫衣</a>
				<a href="#nowhere">毛衣</a>
				<a href="#nowhere">风衣</a>
				<a href="#nowhere">西装</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">连衣裙</a>
				<a href="#nowhere">牛仔裤</a>
				<a href="#nowhere">运动裤</a>
				<a href="#nowhere">九分裤</a>
				<a href="#nowhere">西装裤</a>
				<a href="#nowhere">汉服</a>
				<a href="#nowhere">旗袍</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">睡衣</a>
				<a href="#nowhere">袜子</a>
				<a href="#nowhere">背心</a>
				<a href="#nowhere">内衣套装</a>
				<div style="float: right;">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
		</div>
		<div class="productsAsideCategorys" cid="2">
			<div class="row ">
				<a href="#nowhere">厚底鞋</a>
				<a href="#nowhere">圆头鞋</a>
				<a href="#nowhere">尖头鞋</a>
				<a href="#nowhere">小白鞋</a>
				<a href="#nowhere">靴子</a>
				<a href="#nowhere">运动鞋</a>
				<a href="#nowhere">帆布鞋</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">女包</a>
				<a href="#nowhere">双肩包</a>
				<a href="#nowhere">钱包</a>
				<a href="#nowhere">手拿包</a>
				<a href="#nowhere">拉杆箱</a>
				<a href="#nowhere">腰包</a>
				<a href="#nowhere">手提包</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">帽子</a>
				<a href="#nowhere">丝巾</a>
				<a href="#nowhere">手套</a>
				<a href="#nowhere">腰带</a>
				<div style="float: right;">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
		</div>
		<div class="productsAsideCategorys" cid="3">
			<div class="row ">
				<a href="#nowhere">短外套</a>
				<a href="#nowhere">衬衫</a>
				<a href="#nowhere">T恤</a>
				<a href="#nowhere">卫衣</a>
				<a href="#nowhere">毛衣</a>
				<a href="#nowhere">风衣</a>
				<a href="#nowhere">西装</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">连衣裙</a>
				<a href="#nowhere">牛仔裤</a>
				<a href="#nowhere">运动裤</a>
				<a href="#nowhere">九分裤</a>
				<a href="#nowhere">西装裤</a>
				<a href="#nowhere">汉服</a>
				<a href="#nowhere">旗袍</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">睡衣</a>
				<a href="#nowhere">袜子</a>
				<a href="#nowhere">背心</a>
				<a href="#nowhere">内衣套装</a>
				<div style="float: right;">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
		</div>
		<div class="productsAsideCategorys" cid="4">
			<div class="row ">
				<a href="#nowhere">厚底鞋</a>
				<a href="#nowhere">圆头鞋</a>
				<a href="#nowhere">尖头鞋</a>
				<a href="#nowhere">小白鞋</a>
				<a href="#nowhere">靴子</a>
				<a href="#nowhere">运动鞋</a>
				<a href="#nowhere">帆布鞋</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">女包</a>
				<a href="#nowhere">双肩包</a>
				<a href="#nowhere">钱包</a>
				<a href="#nowhere">手拿包</a>
				<a href="#nowhere">拉杆箱</a>
				<a href="#nowhere">腰包</a>
				<a href="#nowhere">手提包</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">帽子</a>
				<a href="#nowhere">丝巾</a>
				<a href="#nowhere">手套</a>
				<a href="#nowhere">腰带</a>
				<div style="float: right;">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
		</div>
		<div class="productsAsideCategorys" cid="5">
			<div class="row ">
				<a href="#nowhere">短外套</a>
				<a href="#nowhere">衬衫</a>
				<a href="#nowhere">T恤</a>
				<a href="#nowhere">卫衣</a>
				<a href="#nowhere">毛衣</a>
				<a href="#nowhere">风衣</a>
				<a href="#nowhere">西装</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">连衣裙</a>
				<a href="#nowhere">牛仔裤</a>
				<a href="#nowhere">运动裤</a>
				<a href="#nowhere">九分裤</a>
				<a href="#nowhere">西装裤</a>
				<a href="#nowhere">汉服</a>
				<a href="#nowhere">旗袍</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">睡衣</a>
				<a href="#nowhere">袜子</a>
				<a href="#nowhere">背心</a>
				<a href="#nowhere">内衣套装</a>
				<div style="float: right;">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
		</div>
		<div class="productsAsideCategorys" cid="6">
			<div class="row ">
				<a href="#nowhere">厚底鞋</a>
				<a href="#nowhere">圆头鞋</a>
				<a href="#nowhere">尖头鞋</a>
				<a href="#nowhere">小白鞋</a>
				<a href="#nowhere">靴子</a>
				<a href="#nowhere">运动鞋</a>
				<a href="#nowhere">帆布鞋</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">女包</a>
				<a href="#nowhere">双肩包</a>
				<a href="#nowhere">钱包</a>
				<a href="#nowhere">手拿包</a>
				<a href="#nowhere">拉杆箱</a>
				<a href="#nowhere">腰包</a>
				<a href="#nowhere">手提包</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">帽子</a>
				<a href="#nowhere">丝巾</a>
				<a href="#nowhere">手套</a>
				<a href="#nowhere">腰带</a>
				<div style="float: right;">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
		</div>
		<div class="productsAsideCategorys" cid="7">
			<div class="row ">
				<a href="#nowhere">短外套</a>
				<a href="#nowhere">衬衫</a>
				<a href="#nowhere">T恤</a>
				<a href="#nowhere">卫衣</a>
				<a href="#nowhere">毛衣</a>
				<a href="#nowhere">风衣</a>
				<a href="#nowhere">西装</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">连衣裙</a>
				<a href="#nowhere">牛仔裤</a>
				<a href="#nowhere">运动裤</a>
				<a href="#nowhere">九分裤</a>
				<a href="#nowhere">西装裤</a>
				<a href="#nowhere">汉服</a>
				<a href="#nowhere">旗袍</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">睡衣</a>
				<a href="#nowhere">袜子</a>
				<a href="#nowhere">背心</a>
				<a href="#nowhere">内衣套装</a>
				<div style="float: right;">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
		</div>
		<div class="productsAsideCategorys" cid="8">
			<div class="row ">
				<a href="#nowhere">厚底鞋</a>
				<a href="#nowhere">圆头鞋</a>
				<a href="#nowhere">尖头鞋</a>
				<a href="#nowhere">小白鞋</a>
				<a href="#nowhere">靴子</a>
				<a href="#nowhere">运动鞋</a>
				<a href="#nowhere">帆布鞋</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">女包</a>
				<a href="#nowhere">双肩包</a>
				<a href="#nowhere">钱包</a>
				<a href="#nowhere">手拿包</a>
				<a href="#nowhere">拉杆箱</a>
				<a href="#nowhere">腰包</a>
				<a href="#nowhere">手提包</a>
				<div style="float: right">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
			<div class="row ">
				<a href="#nowhere">帽子</a>
				<a href="#nowhere">丝巾</a>
				<a href="#nowhere">手套</a>
				<a href="#nowhere">腰带</a>
				<div style="float: right;">
					<a href="#nowhere">更多</a>
				</div>
				<div class="seperator"></div>
			</div>
		</div>
	</div>
	<div style="height:510"></div>
</div>
<div class="categoryWithCarousel">
	<div data-ride="carousel" class="carousel-of-product carousel slide" id="carousel-of-product">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li class="active" data-slide-to="0" data-target="#carousel-of-product"></li>
			<li data-slide-to="1" data-target="#carousel-of-product" class=""></li>
			<li data-slide-to="2" data-target="#carousel-of-product" class=""></li>
			<li data-slide-to="3" data-target="#carousel-of-product" class=""></li>
		</ol>
		<!-- Wrapper for slides -->
		<div role="listbox" class="carousel-inner">
			<div class="item active">
				<img src="../../../../img/carousel/1.jpg" class="carouselImage">
			</div>
			<div class="item">
				<img src="../../../../img/carousel/2.jpg" class="carouselImage">
			</div>
			<div class="item">
				<img src="../../../../img/carousel/3.jpg" class="carouselImage">
			</div>
			<div class="item">
				<img src="../../../../img/carousel/4.jpg" class="carouselImage">
			</div>
		</div>

	</div>
	<div class="carouselBackgroundDiv">
	</div>
</div>

<div class="homepageCategoryProducts">
	<div class="eachHomepageCategoryProducts">
		<span class="categoryTitle">太阳镜</span>
		<span class="glyphicon glyphicon-chevron-right"></span>
		<br>
		<div class="productItem">
			<a href="#nowhere"><img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/9543.jpg"></a>
			<a href="#nowhere" class="productItemDescLink">
				<span class="productItemDesc">[热销]好先生同款墨镜孙红雷偏光男士太阳镜韩明星</span>
			</a>
			<span class="productPrice">97.50</span>
		</div>
		<div class="productItem">
			<a href="#nowhere"><img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/9532.jpg"></a>
			<a href="#nowhere" class="productItemDescLink">
				<span class="productItemDesc">[热销]陌森太阳眼镜男女2016偏光定制驾驶近视</span>
			</a>
			<span class="productPrice">518.70</span>
		</div>
		<div class="productItem">
			<a href="#nowhere"><img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/9521.jpg"></a>
			<a href="#nowhere" class="productItemDescLink">
				<span class="productItemDesc">[热销]帕莎Prsr太阳镜女偏光镜潮范冰冰同款女</span>
			</a>
			<span class="productPrice">624.00</span>
		</div>
		<div class="productItem">
			<a href="#nowhere"><img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/9510.jpg"></a>
			<a href="#nowhere" class="productItemDescLink">
				<span class="productItemDesc">[热销]变色眼镜男女款半框太阳镜大框潮流防辐射防</span>
			</a>
			<span class="productPrice">170.00</span>
		</div>
		<div class="productItem">
			<a href="#nowhere"><img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/9510.jpg"></a>
			<a href="#nowhere" class="productItemDescLink">
				<span class="productItemDesc">[热销]变色眼镜男女款半框太阳镜大框潮流防辐射防</span>
			</a>
			<span class="productPrice">170.00</span>
		</div>
		<div class="productItem">
			<a href="#nowhere"><img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/9499.jpg"></a>
			<a href="#nowhere" class="productItemDescLink">
				<span class="productItemDesc">[热销]新款男士偏光太阳镜日夜两用墨镜潮运动开车</span>
			</a>
			<span class="productPrice">551.00</span>
		</div>
		<div style="clear:both"></div>
	</div>
	<div class="eachHomepageCategoryProducts">
		<span class="categoryTitle">安全座椅</span>
		<span class="glyphicon glyphicon-chevron-right"></span>
		<br>
		<div class="productItem">
			<a href="#nowhere"><img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/10192.jpg"></a>
			<a href="#nowhere" class="productItemDescLink">
				<span class="productItemDesc">[热销]
                            新生儿婴儿提篮式安全座椅汽车用车载儿童安
                            </span>
			</a>
			<span class="productPrice">
                            882.00
                        </span>
		</div>
		<div class="productItem">
			<a href="#nowhere"><img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/10181.jpg"></a>
			<a href="#nowhere" class="productItemDescLink">
				<span class="productItemDesc">[热销]
                            REEBABY汽车儿童安全座椅ISOFI
                            </span>
			</a>
			<span class="productPrice">
                            1,344.00
                        </span>
		</div>
		<div class="productItem">
			<a href="#nowhere"><img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/10170.jpg"></a>
			<a href="#nowhere" class="productItemDescLink">
				<span class="productItemDesc">[热销]
                            REEBABY儿童安全座椅9个月-12岁
                            </span>
			</a>
			<span class="productPrice">
                            1,216.00
                        </span>
		</div>
		<div class="productItem">
			<a href="#nowhere"><img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/10159.jpg"></a>
			<a href="#nowhere" class="productItemDescLink">
				<span class="productItemDesc">[热销]
                            好孩子汽车儿童安全座椅goodbaby9
                            </span>
			</a>
			<span class="productPrice">
                            1,199.40
                        </span>
		</div>
		<div class="productItem">
			<a href="#nowhere"><img width="100px" src="http://how2j.cn/tmall/img/productSingle_middle/10148.jpg"></a>
			<a href="#nowhere" class="productItemDescLink">
				<span class="productItemDesc">[热销]
                            惠尔顿儿童安全座椅isofix硬接口汽车
                            </span>
			</a>
			<span class="productPrice">
                            1,993.60
                        </span>
		</div>
		<div style="clear:both"></div>
	</div>
</div>