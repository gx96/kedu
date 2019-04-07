<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<c:if test="${empty param.categorycount}">
    <c:set var="categorycount" scope="page" value="100"/>
</c:if>
 
<c:if test="${!empty param.categorycount}">
    <c:set var="categorycount" scope="page" value="${param.categorycount}"/>
</c:if>

<div class="categoryProducts">
    <c:forEach items="${c.products}" var="p" varStatus="stc">
        <c:if test="${stc.count<=categorycount}">
        <div class="productUnit" price="${p.promotePrice}">
            <div class="productUnitFrame">
                <a href="foreproduct?pid=${p.id}">
                    <img class="productImage" src="img/productSingle_middle/${p.firstProductImage.id}.jpg">
                </a>
                <span class="productPrice">¥<fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/></span>
                <a class="productLink" href="foreproduct?pid=${p.id}">
                 ${fn:substring(p.name, 0, 50)}
                </a>
                <div class="productInfo">
                    <span class="monthDeal"> <span class="productDealNumber">${p.saleCount}</span>人已付款</span>
                    <span class="productReview"><span class="productReviewNumber">${p.reviewCount}</span>人已评价</span>
                </div>
            </div>
            
        </div>
        </c:if>
    </c:forEach>
        <div style="clear:both"></div>
</div>