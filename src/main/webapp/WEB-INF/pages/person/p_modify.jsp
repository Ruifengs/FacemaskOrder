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
</head>
<body>
<jsp:include page="head.jsp"/>
这是用户修改资料界面
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
