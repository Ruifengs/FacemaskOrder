<%--
  Created by IntelliJ IDEA.
  User: Later
  Date: 2020/6/23
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册界面</title>
</head>
<body>
<form action="/person/personRegistered" method="post">
    <table border="1">
        <tr>
            <th colspan="2">注册新用户</th>
        </tr>
        <tr>
            <th>用户名</th>
            <td><input type="text" name="username"/></td>
        </tr>
        <tr>
            <th>密码</th>
            <td><input type="password" name="password"/></td>
        </tr>
        <tr>
            <th>确认密码</th>
            <td><input type="password" name="repassword"/></td>
        </tr>
        <tr>
            <th>姓名</th>
            <td><input type="text" name="pName"/></td>
        </tr>
        <tr>
            <th>身份证号码</th>
            <td><input type="text" name="idNum"/></td>
        </tr>
        <tr>
            <th>电话号码</th>
            <td><input type="text" name="phoneNum"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="保存" /></td>
            <td><input type="reset" value="重置" /></td>
        </tr>
    </table>
</form>

<p>注：前端实现-----确认两次密码是否一致，身份证、手机号码长度是否正确</p>
</body>
</html>
