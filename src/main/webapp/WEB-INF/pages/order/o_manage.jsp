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
<jsp:include page="/WEB-INF/pages/person/head.jsp"/>
这是口罩订单管理
    <table border="1">
        <tr>
            <td>订单号</td>
            <td>预约人账号</td>
            <td>口罩类型</td>
            <td>口罩数量</td>
            <td>价格</td>
            <td>预约时间</td>
            <td>领取状态</td>>
            <td>领取时间</td>>
            <td>操作</td>
        </tr>
        <c:forEach var="order" items="${orders}">
        <tr>
            <td>${order.orderId}</td>
            <td>${order.pId}</td>
            <td>${order.fmaskId}</td>
            <td>${order.fmaskNum}</td>
            <td>${order.fmaskPrice}</td>
            <td>${order.orderTime}</td>
            <td>${order.orderStatus}</td>
            <td>${order.getFacemaskTime}</td>
            <td>
                <a href="/order/${order.orderId}/orderModify">修改</a>
                <a href="/order/${order.orderId}/orderDelete">删除</a>
            </td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>
