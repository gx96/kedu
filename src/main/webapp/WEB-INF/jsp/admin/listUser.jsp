<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
 
<script>
	document.getElementById('li1').className = '';
	document.getElementById('li2').className = '';
	document.getElementById('li3').className = 'active';
	document.getElementById('li4').className = '';
</script>
 
<title>用户管理</title>
 
<div class="workingAreaUser">
    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="info">
                <th>用户编号</th>
                <th>用户名</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${us}" var="u">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.name}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
 
    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp" %>
    </div>
 
</div>
 
<%@include file="../include/admin/adminFooter.jsp"%>