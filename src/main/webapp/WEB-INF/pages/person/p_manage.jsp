<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 许锐锋
  Date: 2020/6/22
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            background-color: pink;
            text-align: center;
            margin-top: 300px;
            margin-left: 750px;
        }
        h1 {
            font-size: 50px;
            color: crimson;
            /*margin-left: 10px;*/
            text-align: center;
        }
        td {
            color: blueviolet;
            font-size: 30px;
            text-align: center;
            padding-right: 5px;
        }
    </style>
</head>
<body>
<h1>这是用户管理界面</h1>
<table border="1">
    <tr>
        <td>账号</td>
        <td>密码</td>
        <td>用户名</td>
        <td>真实姓名</td>
        <td>身份证号</td>
        <td>手机号</td>
        <td>操作</td>
    </tr>
    <c:forEach var="person" items="${persons}">
        <tr>
            <td>${person.pId}</td>
            <td>${person.password}</td>
            <td>${person.username}</td>
            <td>${person.pName}</td>
            <td>${person.idNum}</td>
            <td>${person.phoneNum}</td>
            <td>
                <a href="/person/${person.pId}/personModify">修改</a>
                <a href="/person/${person.pId}/personDelete">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
