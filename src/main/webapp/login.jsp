<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/usersLogin.css">
    <script src="/js/jquery-1.3.2.min.js"></script>
    <script src="js/login.js"></script>
</head>

<body>
<%--<h1>欢迎登录口罩预约系统</h1>--%>
<%--<form method="post" action="person/personLoginSubmit">--%>
<%--    用户名：<input type="text" name="username"><br>--%>
<%--    密码：<input type="password" name="password"><br>--%>
<%--    <button type="submit">登录</button>--%>
<%--    <button type="button"><a href="/person/registered">注册</a> </button>--%>
<%--</form>--%>

<div class="header">

</div>
<div class="body">
    <div class="panel">
        <div class="top">
            <p>账户登陆</p>
        </div>

        <div class="middle">
            <form action="person/personLoginSubmit" method="post">
<%--                <span class="erro">${msg}</span>--%>
                <span class="s1"></span>
                <span class="s2"></span>
                <input type="text" name="username" value=""  class="iputs"/>
                <input type="password" name="password" value="" class="iputs"/>
                <input type="submit" value="登陆"/>
            </form>
        </div>
    </div>
</div>

<div class="footer">
    <span>@Copyright © 2019-2020 版权所有 </span>
</div>
</body>
</html>
