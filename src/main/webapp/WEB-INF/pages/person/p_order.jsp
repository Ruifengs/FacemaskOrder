<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<table border="1">
        <tr>
            <td>订单号</td>
            <td>口罩类型</td>
            <td>口罩个数</td>
            <td>价格</td>
            <td>预约时间</td>
            <td>领取状态</td>
        </tr>
        <c:forEach var="order" items="${orders}" varStatus="loop">
        <tr>
            <td>${order.orderId}</td>
            <td>${faceType[loop.count-1]}</td>
            <td>${order.fmaskNum}</td>
            <td>${order.fmaskPrice}</td>
            <td>${order.orderTime}</td>
            <td>
                <c:choose>
                    <c:when test="${order.orderStatus==0}">
                        未领取
                    </c:when>
                    <c:when test="${order.orderStatus==1}">
                        已领取
                    </c:when>
                </c:choose>
            </td>
        </tr>
        </c:forEach>
</table>
${message}
</body>
</html>
