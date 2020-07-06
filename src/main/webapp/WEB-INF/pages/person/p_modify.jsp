<%--
  Created by IntelliJ IDEA.
  User: 许锐锋
  Date: 2020/6/22
  Time: 20:23
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
            text-align: left;
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
        button {
            color: grey;
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp"/>
<h1>用户修改资料界面</h1>
<form method="post" action="/person/${person.pId}/personModifySubmit">
    密&nbsp;&nbsp;码：<input type="password" name="password" value="${person.password}"><br>
    确认密码：<input type="password" name="repassword" value="${person.password}"><br>
    用户名：<input type="text" name="username" value="${person.username}"><br>
    手机号：<input type="text" name="phoneNum" value="${person.phoneNum}">
    身份证号：<input type="text" name="idNum" value="${person.idNum}">
    <button type="submit">确认修改</button>
</form>
</body>
</html>
