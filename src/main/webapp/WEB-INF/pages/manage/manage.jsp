<%--
  Created by IntelliJ IDEA.
  User: 许锐锋
  Date: 2020/6/22
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            background-color: pink;
        }
        h2 {
            font-size: 50px;
            color: crimson;
        }
        a {
            font-size: 30px;
            color: chocolate;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/pages/person/head.jsp"/>
<h2>欢迎${sessionScope.person.username}</h2>
<a href="/facemask/main">口罩管理</a><br>
<a href="/person/personManage">用户管理</a><br>
<a href="/order/ordersManage">订单管理</a>
</body>
</html>
