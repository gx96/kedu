<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<style>
    .addressTable1 td {
        border: 1px solid #e2e2e2;
        text-align: center;
        vertical-align: middle;
    }
    .addressTable1 {
        width: 1000px;
    }
    .addressDiv {
        width: 1000px;
        height: 470px;
        margin: 0px auto;
    }
    .trHead {
        background-color: #f2f2f2;
    }
    .trHead td {
        background-color: #f2f2f2;
        height: 50px;
    }
    .trBody {
        height: 50px;
    }
    .trBody a {
        text-decoration: none;
    }
    .trBody a:hover {
        text-decoration: underline;
    }
    .addressDivUpdate {
        width: 350px;
        height: 320px;
        margin: 0px auto;
    }
    .addressUpdateTable {
        width: 500px;
    }
    .addressUpdateTable td {
        height: 40px;
    }
    .addressUpdateTable input ,.addressUpdateTable textarea{
        border:1px solid #ccc;
        outline-style: none;
        border-radius: 5px;
        padding:7px 0px;
        margin: 0px 10px;
        width: 250px;
    }
    .addressUpdateTable button{
        border:1px solid #ccc;
        outline-style: none;
        border-radius: 5px;
        padding:7px 0px;
        margin: 0px 90px;
        width: 50px;
    }
</style>
<script>
    $(function () {
        $(".addressUpdateTable td:even").css("text-align", "right").css("width","100px");
    });
</script>
<c:if test="${addressUpdate!=null}">
    <div class="addressDivUpdate">
        <form action="foreAddressUpdateAfter" method="post">
            <table class="addressUpdateTable">
                <tr>
                    <td style="background-color: #e2e2e2">修改地址</td>
                    <td colspan="2" style="padding: 20px;background-color: #e2e2e2"></td>
                </tr>
                <tr>
                    <td>收货人姓名:</td>
                    <td><input type="text" name="name" value="${addressUpdate.name}"></td>
                </tr>
                <tr>
                    <td>所在地区:</td>
                    <td><input type="text" name="area" value="${addressUpdate.area}"></td>
                </tr>
                <tr>
                    <td>详细地址:</td>
                    <td><textarea name="address">${addressUpdate.address}</textarea>
                </tr>
                <tr>
                    <td>邮编:</td>
                    <td><input type="text" name="postal" value="${addressUpdate.postal}"></td>
                </tr>
                <tr>
                    <td>联系电话:</td>
                    <td><input type="text" name="phone" value="${addressUpdate.phone}"></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                        <input type="hidden" name="id" value="${addressUpdate.id}">
                        <input type="hidden" name="uid" value="${addressUpdate.uid}">
                        <input type="hidden" name="start" value="${addressUpdate.start}">
                        <button type="submit">确认</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</c:if>
<div class="addressDiv">
    <table class="addressTable1">
        <tr class="trHead">
            <td>收货人姓名</td>
            <td>所在地区</td>
            <td>详细地址</td>
            <td>邮编</td>
            <td>联系电话</td>
            <td>操作</td>
            <td></td>
        </tr>
        <c:forEach items="${as}" var="a">
            <tr class="trBody">
                <td width="80px">${a.name}</td>
                <td>${a.area}</td>
                <td>${a.address}</td>
                <td width="80px">${a.postal}</td>
                <td width="80px">${a.phone}</td>
                <td width="100px"><a href="foreAddressUpdate?id=${a.id}">修改</a> | <a
                        href="foreAddressDelete?id=${a.id}">删除</a></td>
                <c:if test="${a.start==1}">
                    <td><a href=""><span style="color:#c40000">默认地址</span></a></td>
                </c:if>
                <c:if test="${a.start==0}">
                    <td><a href="foreAddressDefault?id=${a.id}&uid=${a.uid}">设为默认</a></td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</div>