<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>搜索</title>
<div class="searchProducts">
    <c:forEach items="${ps}" var="p">
    <div class="productUnit" price="${p.promotePrice}">
        <a href="foreproduct?pid=${p.id}">
            <img class="productImage" src="img/productSingle/${p.firstProductImage.id}.jpg">
        </a>
        <span class="productPrice">¥<fmt:formatNumber type="number" value="${p.promotePrice}"
                                                      minFractionDigits="2"/></span>
        <a class="productLink" href="foreproduct?pid=${p.id}">
                ${fn:substring(p.name, 0, 50)}
        </a>
        <div class="productInfo">
            <span class="monthDeal "> <span class="productDealNumber">${p.saleCount}</span>人已付款</span>
            <span class="productReview"><span class="productReviewNumber">${p.reviewCount}</span>人已评价</span>
        </div>

    </div>
    </c:forEach>
    <c:if test="${empty ps}">
    <div class="noMatch">没有满足条件的产品
        <div>
            </c:if>

            <div style="clear:both"></div>
        </div>
    </div>