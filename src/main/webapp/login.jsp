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
    <style>
        body{
            background-color: pink;
            text-align: center;
            margin-top: 350px;
        }
        h1 {
            font-size: 50px;
            color: blueviolet;
        }
        input{
            padding:10px;
            width: 200px;
            color: black;
            margin-bottom:10px;
            background-color: antiquewhite;
            border: 1px solid black;
            border-radius:4px;
            letter-spacing:2px;
        }
        /* 登录按钮的css，cursor:pointer当鼠标移到按钮上面时变成小手形状 */
        form button{
            width:100px;
            padding:8px;
            background-color: chocolate;
            border:1px solid black;
            border-radius:4px;
            cursor:pointer;
        }
        form a{
            width:100px;
            padding:8px;
            background-color: chocolate;
            /*border:1px solid black;*/
            /*border-radius:4px;*/
            cursor:pointer;
            margin-top:10px;
            text-align: center;
        }
    </style>
</head>
<body>
${msg}
<h1>欢迎登录口罩预约系统</h1>
<form method="post" action="person/personLoginSubmit">
    用户名：<input type="text" name="username"><br>
    密码：<input type="password" name="password"><br>
    <button type="submit">登录</button>
    <button type="button"><a href="/person/registered">注册</a> </button>
</form>
</body>
</html>
