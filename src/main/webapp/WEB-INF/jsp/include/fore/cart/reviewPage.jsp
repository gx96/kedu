<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<script type="text/javascript">
    function filterText(sText) {
        var reBadWords = /cnm|tmd|qnm|sb|nmsl|gun/gi;
        return sText.replace(reBadWords, "***");
    }

    $(function () {
        $("#submit").click(function () {
            $("#reviewFilter").val(filterText($("#reviewFilter").val()));
        });
    });
</script>
<div class="reviewDiv">
    <div class="reviewProductInfoDiv">
        <table style="width:1031px; border:1px solid #e2e2e2">
            <tr style="border: 1px solid #e2e2e2; font-size:16px;height: 40px;">
                <td colspan="2" align="center">商品</td>
                <td width="100px">单价</td>
                <td width="100px">累计销量</td>
                <td width="100px">累计评价</td>
            </tr>
            <tr style="height: 120px; line-height: 10px">
                <td width="120px" align="center">
                    <img width="100px" height="100px" src="img/productSingle/${p.firstProductImage.id}.jpg">
                </td>
                <td>
                    <span>${p.name}</span>
                </td>
                <td width="100px">
                    <span class="reviewProductInfoTableSellNumber">￥<fmt:formatNumber type="number"
                                                                                      value="${p.promotePrice}"
                                                                                      minFractionDigits="2"/></span>
                </td>
                <td width="100px">
                    <span class="reviewProductInfoTableSellNumber">${p.saleCount}</span> 件
                </td>
                <td width="100px">
                    <span class="reviewProductInfoTableSellNumber">${p.reviewCount}</span> 个
                </td>
            </tr>
        </table>
    </div>
    <c:if test="${param.showonly==true}">
        <div class="reviewDivlistReviews">
            <c:forEach items="${reviews}" var="r">
                <div class="reviewDivlistReviewsEach">
                    <div class="reviewUserInfo pull-right">${r.user.anonymousName}(匿名)
                    </div>
                    <div class="reviewDate"><fmt:formatDate value="${r.createDate}"
                                                            pattern="yyyy-MM-dd hh:mm:ss"/></div>
                    <div class="reviewContent">${r.content}</div>
                </div>
            </c:forEach>
        </div>
    </c:if>

    <c:if test="${param.showonly!=true}">
        <div class="makeReviewDiv">
            <form method="post" action="foredoreview" id="formFilter">
                <div class="makeReviewText"><p align="center">评论</p></div>
                <table class="makeReviewTable">
                    <tr>
                        <td><textarea name="content" id="reviewFilter"></textarea></td>
                    </tr>
                </table>
                <div class="makeReviewButtonDiv">
                    <input type="hidden" name="oid" value="${o.id}">
                    <input type="hidden" name="pid" value="${p.id}">
                    <button type="submit" id="submit">发布</button>
                </div>
            </form>
        </div>
    </c:if>
</div>