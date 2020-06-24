<%--
  Created by IntelliJ IDEA.
  User: 许锐锋
  Date: 2020/6/23
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>当前用户：${sessionScope.person.username}&nbsp;&nbsp;&nbsp;<a href="/person/logout">注销账号</a></div>
</body>
</html>
