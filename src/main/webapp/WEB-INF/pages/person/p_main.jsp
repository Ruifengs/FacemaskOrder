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
    <style>
        h2 {
            font-size: 50px;
            color: crimson;
            /*margin-left: 10px;*/
            text-align: left;
        }
        a {
            color: blueviolet;
            font-size: 30px;
            text-align: center;
            padding-right: 5px;
        }
    </style>
</head>
<body>
<jsp:include page="head.jsp"/>
<h2>欢迎${sessionScope.person.username}</h2>
<a href="/order/rules">口罩预约</a><br>
<a href="/order/${sessionScope.person.pId}/findBypId">查看订单</a><br>
<a href="/person/${sessionScope.person.pId}/personModify">修改个人信息</a><br>
<a href="/order/${sessionScope.person.pId}/getFaskmask">领取口罩</a>
</body>
</html>
