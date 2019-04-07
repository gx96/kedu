<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     
<div class="payedDiv">
    <div class="payedTextDiv">
        <img src="img/site/paySuccess.png">
        <span>您已支付成功</span>
         
    </div>
    <div class="payedAddressInfo">
        <ul>
            <li>收货地址：${o.address} ${o.receiver} ${o.mobile }</li>
            <li>付款：<span class="payedInfoPrice">
            ￥<fmt:formatNumber type="number" value="${param.total}" minFractionDigits="2"/>
            </li>
            <li>预计3日后送达</li>
        </ul>
                 
        <div class="paedCheckLinkDiv">
            您可以
            <a class="payedCheckLink" href="forebought">查看已买到的宝贝</a>
        </div>
             
    </div>
     
    <div class="payedSeperateLine">
    </div>
</div>