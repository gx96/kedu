<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="carousel-of-product"
     class="carousel-of-product carousel slide1" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-of-product" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-of-product" data-slide-to="1"></li>
        <li data-target="#carousel-of-product" data-slide-to="2"></li>
        <li data-target="#carousel-of-product" data-slide-to="3"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <a href="forecategory?cid=1"><img class="carousel carouselImage" height="400px" src="img/carousel/2.jpg"></a>
        </div>
        <div class="item">
            <a href="forecategory?cid=2"><img class="carouselImage" height="400px" src="img/carousel/1.jpg"></a>
        </div>
        <div class="item">
            <a href="forecategory?cid=3"><img class="carouselImage" height="400px" src="img/carousel/3.jpg"></a>
        </div>
        <div class="item">
            <a href="forecategory?cid=4"><img class="carouselImage" height="400px" src="img/carousel/4.jpg" ></a>
        </div>
    </div>
    <%@include file="recommend.jsp"%>
</div>