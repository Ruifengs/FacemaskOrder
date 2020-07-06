<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 许锐锋
  Date: 2020/7/6
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="head.jsp"/>
<c:if test="${orders.orderStatus==0}">
<table border="1">
    <tr>
        <td>订单号</td>
        <td>${orders.orderId}</td>
    </tr>
    <tr>
        <td>口罩类型</td>
        <td>${facemask.f_name}</td>
    </tr>
    <tr>
        <td>口罩个数</td>
        <td>${orders.fmaskNum}</td>
    </tr>
    <tr>
        <td>价格</td>
        <td>${orders.fmaskPrice}</td>
    </tr>
    <tr>
        <td>预约时间</td>
        <td>${orders.orderTime}</td>
    </tr>
    <tr>
        <td colspan="2">
            <a href="/order/${orders.orderId}/getFaskmaskSubmit">领取口罩</a>
        </td>
    </tr>
</c:if>
</table>
${message}
</body>
</html>
