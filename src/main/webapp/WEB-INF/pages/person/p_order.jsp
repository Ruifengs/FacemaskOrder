<%--
  Created by IntelliJ IDEA.
  User: 许锐锋
  Date: 2020/6/23
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="head.jsp"/>
这是您的订单
<table border="1">
    <tr>
        <td>订单号</td>
        <td>${order.orderId}</td>
    </tr>
    <tr>
        <td>口罩类型</td>
        <td>${faceType}</td>
    </tr>
    <tr>
        <td>口罩个数</td>
        <td>${order.fmaskNum}</td>
    </tr>
    <tr>
        <td>价格</td>
        <td>${order.fmaskPrice}</td>
    </tr>
    <tr>
        <td>预约时间</td>
        <td>${order.orderTime}</td>
    </tr>
</table>
</body>
</html>
