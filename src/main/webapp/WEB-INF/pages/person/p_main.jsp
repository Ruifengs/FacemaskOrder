<%--
  Created by IntelliJ IDEA.
  User: Later
  Date: 2020/6/23
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>用户首页</title>
</head>
<body>
<h2>欢迎${sessionScope.person.username}</h2>
<a href="/order/rules">口罩预约</a><br>
<a>查看订单</a><br>
<a>修改个人信息</a><br>
<a href="/person/logout">注销账号</a>
</body>
</html>
