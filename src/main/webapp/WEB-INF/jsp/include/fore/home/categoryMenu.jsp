<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<div class="categoryMenu">
	<c:forEach items="${cs}" var="c">
		<div cid="${c.id}" class="eachCategory">

			<a href="forecategory?cid=${c.id}"> ${c.name} </a> <span
				style="float: right" class="glyphicon glyphicon-chevron-right"></span>
		</div>
	</c:forEach>
</div>
