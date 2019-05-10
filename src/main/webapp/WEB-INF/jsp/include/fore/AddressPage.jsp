<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<style>
	.addressTable1 td {
		border: 1px solid #D2D2D2;
		text-align: center;
		vertical-align: middle;
	}
	.addressTable1 {
		width: 1000px;
	}
	.addressDiv {
		width: 1000px;
		margin: 40px auto 20px;
	}
	.trHead {
		background-color: #e2e2e2;
	}
	.trHead td {
		background-color: #e2e2e2;
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
		width: 1000px;
		height: 320px;
		margin: 0 auto;
	}
	.addressUpdateTable {
		width: 550px;
	}

	.addressUpdateTable td {
		height: 40px;
	}
	.addressUpdateTable input, .addressUpdateTable textarea {
		border: 1px solid #ccc;
		outline-style: none;
		border-radius: 5px;
		padding: 7px 0;
		margin: 0 10px;
		width: 250px;
	}
	.addressUpdateTable button {
		border: 1px solid dodgerblue;
		background-color: deepskyblue;
		font-size:14px;
		color:white;
		outline-style: none;
		border-radius: 5px;
		padding: 7px 0;
		margin: 0 90px;
		width: 50px;
	}
</style>
<script>
    $(function () {
        $(".addressUpdateTable td:even").css("text-align", "right").css("width", "70px");
        <c:if test="${flag!=null}">
        var nameflag=true;
        var postalflag=true;
        var phoneflag=true;
		</c:if>
		<c:if test="${flag==null}">
        var nameflag=false;
        var postalflag=false;
        var phoneflag=false;
		</c:if>
        $('input[name="name"]').on("keyup",function(){
            var nameV=$(this).val().trim();
			var nameRedExp=/^[\u4e00-\u9fa5A-Za-z]{2,25}$/
			if(!nameRedExp.test(nameV)){
			    $(".nameMessage").text("收货人姓名应为2-25个字符");
			    nameflag=false;
			}else{
                $(".nameMessage").html("");
                nameflag=true;
			}
		});
        $('input[name="postal"]').on("keyup",function(){
            var postalV=$(this).val().trim();
            var postalRedExp=/^[0-9]{6}$/
            if(!postalRedExp.test(postalV)){
                $(".postalMessage").html("邮政编码为6位数字");
                postalflag=false;
            }else{
                $(".postalMessage").html("");
                postalflag=true;
            }
        });
        $('input[name="phone"]').on("keyup",function(){
            var phoneV=$(this).val().trim();
            var phoneRedExp=/^[0-9]{11}$/
            if(!phoneRedExp.test(phoneV)){
                $(".phoneMessage").html("联系电话为11位数字");
                phoneflag=false;
            }else{
                $(".phoneMessage").html("");
                phoneflag=true;
            }
        });
        $(this).submit(function(){
            if(nameflag && postalflag && phoneflag){
                return true;
            }
            $(".confirmMessage").html("请输入正确的信息");
            return false;
		});
    });
</script>
<title>地址设置</title>
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
					<td><span style="color:#c40000">默认地址</span></td>
				</c:if>
				<c:if test="${a.start==0}">
					<td><a href="foreAddressDefault?id=${a.id}&uid=${a.uid}">设为默认</a></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</div>
<c:if test="${addressUpdate==null}">
	<div class="addressDivUpdate">
		<form action="foreAddressAdd" method="post">
			<table class="addressUpdateTable">
				<tr>
					<td style="background-color: #e2e2e2">添加地址</td>
					<td colspan="2" style="padding: 20px;background-color: #e2e2e2"></td>
				</tr>
				<tr>
					<td>收货人姓名:</td>
					<td><input type="text" name="name" placeholder="长度不超过25个字符"><span class="nameMessage" style="color:red;"></span></td>

				</tr>
				<tr>
					<td>所在地区:</td>
					<td><input type="text" name="area" placeholder="请输入省/市/县(区)/镇(街道)"><span class="areaMessage" style="color:red;"></span></td>
				</tr>
				<tr>
					<td>详细地址:</td>
					<td><textarea name="address" placeholder="请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元等信息"></textarea><span class="addressMessage" style="color:red;"></span></td>
				</tr>
				<tr>
					<td>邮政编码:</td>
					<td><input type="text" name="postal" placeholder="请填写邮编"><span class="postalMessage" style="color:red;"></span></td>
				</tr>
				<tr>
					<td>联系电话:</td>
					<td><input type="text" name="phone" placeholder="请填写联系电话"><span class="phoneMessage" style="color:red;"></span></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2">
						<input type="hidden" name="uid" value="${user.id}">
						<button class="submitConfirm" type="submit">确认</button><span class="confirmMessage" style="color:red;margin-left: 38px;"></span>
					</td>
				</tr>
			</table>
		</form>
	</div>
</c:if>
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
					<td><input type="text" name="name" placeholder="长度不超过25个字符" value="${addressUpdate.name}"><span class="nameMessage" style="color:red;"></span></td>

				</tr>
				<tr>
					<td>所在地区:</td>
					<td><input type="text" name="area" placeholder="请输入省/市/县(区)/镇(街道)" value="${addressUpdate.area}"><span class="areaMessage" style="color:red;"></span></td>
				</tr>
				<tr>
					<td>详细地址:</td>
					<td><textarea name="address" placeholder="请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元等信息">${addressUpdate.address}</textarea><span class="addressMessage" style="color:red;"></span></td>
				</tr>
				<tr>
					<td>邮政编码:</td>
					<td><input type="text" name="postal" placeholder="请填写邮编" value="${addressUpdate.postal}"><span class="postalMessage" style="color:red;"></span></td>
				</tr>
				<tr>
					<td>联系电话:</td>
					<td><input type="text" name="phone" placeholder="请填写联系电话" value="${addressUpdate.phone}"><span class="phoneMessage" style="color:red;"></span></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="2">
						<input type="hidden" name="id" value="${addressUpdate.id}">
						<input type="hidden" name="uid" value="${addressUpdate.uid}">
						<input type="hidden" name="start" value="${addressUpdate.start}">
						<button class="submitConfirm" type="submit">确认</button><span class="confirmMessage" style="color:red;margin-left: 38px;"></span>
					</td>
				</tr>
			</table>
		</form>
	</div>
</c:if>