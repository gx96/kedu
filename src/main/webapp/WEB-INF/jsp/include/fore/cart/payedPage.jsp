<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<title>支付成功</title>
<div class="payedDiv">
    <div class="payedTextDiv">
        <%--<img src="img/site/paySuccess.png">--%>
        <%--<span>您已支付成功</span>--%>
        <span>支付成功</span>
    </div>
    <div class="payedAddressInfo">
        <%--<ul>--%>
        <%--<li>收货地址：${o.address} ${o.receiver} ${o.mobile }</li>--%>
        <%--<li>付款：<span class="payedInfoPrice">--%>
        <%--￥<fmt:formatNumber type="number" value="${total_amount}" minFractionDigits="2"/>--%>
        <%--</li>--%>
        <%--<li>预计3日后送达</li>--%>
        <%--</ul>--%>
        <%--<div class="paedCheckLinkDiv">--%>
        <%--您可以--%>
        <%--<a class="payedCheckLink" href="forebought">查看已买到的宝贝</a>--%>
        <%--</div>--%>
        <p>收货人：${o.receiver}</p>
        <p>收货地址：${o.address}</p>
        <p>联系电话：${o.mobile}</p>
        <p>付款：<span class="payedInfoPrice">￥</span><fmt:formatNumber type="number" value="${total_amount}"
                                                                     minFractionDigits="2"/></p>
        <p>您可以<a class="payedCheckLink" href="forebought">查看已买到的商品</a></p>
    </div>

    <div class="payedSeperateLine">
    </div>
</div>