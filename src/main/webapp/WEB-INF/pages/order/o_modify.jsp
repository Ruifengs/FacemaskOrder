<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 许锐锋
  Date: 2020/6/24
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/WEB-INF/pages/person/head.jsp"/>
这是订单修改页面
<form action="/order/orderModifySubmit" method="post">
    订单号：<input name="orderId" value="${order.orderId}"><br>
    用户ID：<input name="pId" value="${order.pId}"><br>
    口罩类型：
    <select name="fmaskId">
        <option selected value="${order.fmaskId}">${fmaskType}</option>
        <c:forEach var="facemask" items="${facemasks}">
            <option value =${facemask.f_ID}>${facemask.f_name}</option>
        </c:forEach>
    </select><br>
    口罩个数：<input name="fmaskNum" value="${order.fmaskNum}"><br>
    价格：<input name="fmaskPrice" value="${order.fmaskPrice}"><br>
    预约日期：<input name="orderTime" value="${order.orderTime}"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>
