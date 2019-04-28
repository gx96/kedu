<!DOCTYPE html><!--表示本页面会使用html5的技术-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%--contentType="text/html; charset=UTF-8" 告诉浏览器使用UTF-8进行中文编码识别--%>
<%--pageEncoding="UTF-8" 本jsp上的中文文字，使用UTF-8进行编码--%>
<%--isELIgnored="false" 本jsp上会使用EL表达式--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%--引入JSTL：JSP Standard Tag Library (JSP标准标记库)--%>
<%--使用c和fmt两种标准标签库--%>
<html>
<head>
    <script src="js/jquery/2.0.0/jquery.min.js"></script><!--通过在springMVC中的配置，将静态资源路径映射到webapp目录下-->
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/back/style.css" rel="stylesheet">
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
            if (parseInt(value) !== value) {
                alert(name + "必须是整数");
                $("#" + id)[0].focus();
                return false;
            }

            return true;
        }

        $(function () {
            $("a").click(function () {
                var deleteLink = $(this).attr("deleteLink");
                console.log(deleteLink);
                if ("true" === deleteLink) {
                    // var confirmDelete = confirm("确认要删除");
                    // if(confirmDelete)
                    //     return true;
                    // return false;
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