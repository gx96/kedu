<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<div id="recommend" class="recommend">
    <c:forEach items="${rp}" var="p1" varStatus="stcp">
        <c:if test="${stcp.count<=3}">
            <div>
                <a href="foreproduct?pid=${p1.id}">
                    <img class="productImage" width="170px"
                         src="img/productSingle_middle/${p1.firstProductImage.id}.jpg">
                </a>
                <%--<a class="productItemDescLink" href="foreproduct?pid=${p1.id}">--%>
                    <%--<span class="productItemDesc">${fn:substring(p1.name, 0, 20)}</span>--%>
                <%--</a>--%>
            </div>
        </c:if>
    </c:forEach>
</div>