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
    账号：<input type="text" name="pId"><br>
    密码：<input type="text" name="password"><br>
    <button type="submit">登录</button>
    <button type="button"><a href="">注册</a> </button>
</form>
<form method="post" action="person/rootLoginSubmit">
    管理员账号：<input type="text" name="rootId"><br>
    密码：<input type="text" name="password"><br>
    <button type="submit">登录</button>
</form>
</body>
</html>
