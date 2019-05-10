<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
    var deleteOrder = false;
    var deleteOrderid = 0;

    $(function () {
        $("a[orderStatus]").click(function () {
            var orderStatus = $(this).attr("orderStatus");
            if ('all' == orderStatus) {
                $("table[orderStatus]").show();
            }
            else {
                $("table[orderStatus]").hide();
                $("table[orderStatus=" + orderStatus + "]").show();
            }

            $("div.orderType div").removeClass("selectedOrderType");
            $(this).parent("div").addClass("selectedOrderType");
        });

        $("a.deleteOrderLink").click(function () {
            deleteOrderid = $(this).attr("oid");
            deleteOrder = false;
            $("#deleteConfirmModal").modal("show");
        });

        $("button.deleteConfirmButton").click(function () {
            deleteOrder = true;
            $("#deleteConfirmModal").modal('hide');
        });
		$("button.NoShowOrderLink").click(function () {
			$("").css("display","none");
        });
        $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
            if (deleteOrder) {
                var page = "foredeleteOrder";
                $.post(
                    page,
                    {"oid": deleteOrderid},
                    function (result) {
                        if ("success" == result) {
                            $("table.orderListItemTable[oid=" + deleteOrderid + "]").hide();
                        }
                        else {
                            location.href = "login.jsp";
                        }
                    }
                );

            }
        })

        $(".ask2delivery").click(function () {
            var link = $(this).attr("link");
            $(this).hide();
            page = link;
            $.ajax({
                url: page,
                success: function (result) {
                    alert("卖家已秒发，刷新当前页面，即可进行确认收货")
                }
            });

        });
        $(".cancelOrderLink").click(function () {
			if(confirm("确认取消订单？")){
			    return true;
			}else{
			    return false;
			}
        });
    });

</script>
<title>我的订单</title>
<div class="boughtDiv">
	<div class="orderType">
		<div class="selectedOrderType"><a orderStatus="all" href="#nowhere">全部订单</a></div>
		<div><a orderStatus="waitPay" href="#nowhere">待付款</a></div>
		<div><a orderStatus="waitDelivery" href="#nowhere">待发货</a></div>
		<div><a orderStatus="waitConfirm" href="#nowhere">待收货</a></div>
		<div><a orderStatus="waitReview" href="#nowhere" class="noRightborder">待评价</a></div>

	</div>
	<div style="clear:both"></div>
	<div class="orderListTitle">
		<table class="orderListTitleTable">
			<tr>
				<td>商品</td>
				<td width="100px">单价</td>
				<td width="100px">数量</td>
				<td width="120px">总价</td>
				<td width="100px">操作</td>
			</tr>
		</table>

	</div>

	<div class="orderListItem">
		<c:forEach items="${os}" var="o">
			<table class="orderListItemTable" orderStatus="${o.status}" oid="${o.id}">
				<tr class="orderListItemFirstTR">
					<td colspan="4">
							<%--<b><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></b>--%>
						<span style="font-size: 15px;">支付日期：<fmt:formatDate value="${o.createDate}"
																			pattern="yyyy-MM-dd"/></span><span
							style="font-size: 15px;display:inline-block;margin-left:250px;">订单号: ${o.orderCode}
                    </span>
					</td>
					<td class="orderItemDeleteTD">

					</td>
					<td class="orderItemProductInfoPartTD" colspan="2">
							<%--<td width="100px"><a class="deleteOrderLink" oid="${o.id}" href="#nowhere" style="color:lightblue;">不再显示此订单</a></td>--%>
						<c:if test="${o.status=='waitDelivery'||o.status=='waitPay'}">
							<a class="cancelOrderLink" href="cancelOrderLink?oid=${o.id}&status=${o.status}"
							   style="font-size: 15px;">取消订单</a>
						</c:if>
						<c:if test="${o.status=='waitReview'||o.status=='waitConfirm'||o.status=='finish'}">
							<a class="deleteOrderLink" oid="${o.id}" href="#nowhere" style="font-size:15px">不再显示</a>
						</c:if>
					</td>
				</tr>
				<c:forEach items="${o.orderItems}" var="oi" varStatus="st">
					<tr class="orderItemProductInfoPartTR">
						<td class="orderItemProductInfoPartTD" width="80px">
							<img width="80" height="80"
								 src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg">
						</td>
						<td class="orderItemProductInfoPartTD">
								<%--<div class="orderListItemProductLinkOutDiv">--%>
							<a href="foreproduct?pid=${oi.product.id}">${oi.product.name}</a>
								<%--</div>--%>
						</td>
						<td class="orderItemProductInfoPartTD" width="100px">
							<div class="">￥<fmt:formatNumber type="number" value="${oi.product.promotePrice}"
															 minFractionDigits="2"/></div>
						</td>
						<td class="orderListItemNumberTD" width="100px">
							<span class="orderListItemNumber">${oi.number}</span>
						</td>
						<c:if test="${st.count==1}">
							<td valign="top" rowspan="${fn:length(o.orderItems)}" width="120px"
								class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD">
								<div class="">￥<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2"
																 type="number" value="${o.total}"/></div>
							</td>
							<td valign="top" rowspan="${fn:length(o.orderItems)}"
								class="orderListItemButtonTD orderItemOrderInfoPartTD" width="100px">
								<c:if test="${o.status=='waitConfirm' }">
									<a href="foreconfirmPay?oid=${o.id}">
										<button class="orderListItemConfirm" id="querenshouhuo">确认收货</button>
									</a>
								</c:if>
								<c:if test="${o.status=='waitPay' }">
									<a href="forebuyagain?oid=${o.id}&total=${o.total}">
										<button class="orderListItemConfirm" id="fukuan">付款</button>
									</a>
								</c:if>

								<c:if test="${o.status=='waitDelivery' }">
									<button class="orderListItemConfirm">待发货</button>
									<%--                                     <button class="btn btn-info btn-sm ask2delivery" link="admin_order_delivery?id=${o.id}">催卖家发货</button> --%>
								</c:if>

								<c:if test="${o.status=='waitReview' }">
									<a href="forereview?oid=${o.id}">
										<button class="orderListItemConfirm">评价</button>
									</a>
								</c:if>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</c:forEach>
	</div>
</div>