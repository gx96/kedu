<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!-- top.jsp以下、footer.jsp以上背景色全灰色 -->
<div class="allbackgroundcolor">
    <!-- 高150, -->
    <div class="searchDiv">
        <!-- left150 -->
        <div class="logoFrame">
            <img id="logo" src="img/site/logo.jpg">
        </div>
        <!-- left400 -->
        <div class="searchFrame">
            <form action="foresearch" method="post">
                <div class="searchinput">
                    <input type="text" class="form-control" placeholder="在此输入您要购买的商品" name="keyword">
                    <div class="searchBelow">
                        <span>热搜：</span>
                        <c:forEach items="${cs}" var="c" varStatus="st">
                            <c:if test="${st.count>=7 and st.count<=9}">
								<span> 
								<a href="forecategory?cid=${c.id}"> ${c.name}</a>
								<c:if test="${st.count!=8}">
                                </c:if>
								</span>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="searchbutton">
                    <button type="submit" class="form-control">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </div>
            </form>
            <div class="addCartButton1">
                <a href="forecart" style="color:#c40000;"><span
                        class="glyphicon glyphicon-shopping-cart"></span>我的购物车<strong>${cartTotalItemNumber}</strong>件</a>
            </div>
        </div>
    </div>