<!DOCTYPE html><!--表示本页面会使用html5的技术-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<html>
<head>
	<link href="img/site/favicon.ico" rel="shortcut icon" />
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/back/style.css" rel="stylesheet">
	<script src="js/highcharts/highcharts.js"></script>
	<script src="js/date/jquery.date_input.pack.js"></script>
	<script src="js/date/jquery-migrate-1.2.1.min.js"></script>
	<script>
        function checkEmpty(id, name) {
            var value = $("#" + id).val();
            if (value.length === 0) {
                alert(name + "不能为空");
                $("#" + id)[0].focus();
                return false;
            }
            return true;
        }

        function checkNumber(id, name) {
            var value = $("#" + id).val();
            if (value.length === 0) {
                alert(name + "不能为空");
                $("#" + id)[0].focus();
                return false;
            }
            if (isNaN(value)) {
                alert(name + "必须是数字");
                $("#" + id)[0].focus();
                return false;
            }

            return true;
        }

        function checkInt(id, name) {
            var value = $("#" + id).val();
            if (value.length === 0) {
                alert(name + "不能为空");
                $("#" + id)[0].focus();
                return false;
            }
            // if (parseInt(value) !== value) {
            //     alert(name + "必须是整数"+value);
            //     $("#" + id)[0].focus();
            //     return false;
            // }
            return true;
        }

        $(function () {
            $("a").click(function () {
                var deleteLink = $(this).attr("deleteLink");
                console.log(deleteLink);
                if ("true" === deleteLink) {
                    return confirm("确认要删除？")
                }
            });
        });
        $(function () {
            $("#addForm").submit(function () {
                // if(checkEmpty("name","分类名称"))
                //     return false;
                // if(!checkEmpty("categoryPic","分类图片"))
                //     return false;
                // return true;
                return checkEmpty("name", "分类名称") && checkEmpty("categoryPic", "分类图片");
            });
        });

    </script>
</head>
<body>