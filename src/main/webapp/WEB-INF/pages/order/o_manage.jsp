<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 许锐锋
  Date: 2020/6/22
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
这是口罩订单管理
<c:forEach var="order" items="${orders}">
    <table border="1">
        <tr>
            <td>订单号</td>
            <td>预约人账号</td>
            <td>预约人姓名</td>
            <td>预约人号码</td>
            <td>口罩类型</td>
            <td>口罩数量</td>
            <td>价格</td>
            <td>预约时间</td>
        </tr>
        <tr>
            <td>${order.orderId}</td>
            <td>${order.pId}</td>
            <td>${order.pName}</td>
            <td>${order.phoneNum}</td>
            <td>${order.fmaskId}</td>
            <td>${order.fmaskNum}</td>
            <td>${order.fmaskPrice}</td>
            <td>${order.orderTime}</td>
        </tr>
    </table>
</c:forEach>
</body>
</html>
