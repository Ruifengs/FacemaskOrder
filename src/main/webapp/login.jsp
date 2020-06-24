<%--
  Created by IntelliJ IDEA.
  User: 许锐锋
  Date: 2020/6/20
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
${msg}
<form method="post" action="person/personLoginSubmit">
    用户名：<input type="text" name="username"><br>
    密码：<input type="password" name="password"><br>
    <button type="submit">登录</button>
    <button type="button"><a href="person/registered">注册</a> </button>
</form>
</body>
</html>
