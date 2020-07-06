<%--
  Created by IntelliJ IDEA.
  User: Later
  Date: 2020/7/6
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>口罩领取界面</title>
</head>
<body>
<form action="/order/search"><input type="text" name="search"  /><input type="submit" value="搜索"></form><p>支持搜索用户ID和模糊搜索口罩名称</p>
<table border="1">
    <tr>
        <th>订单号</th>
        <th>预约</th>
        <th>口罩名称</th>
        <th>口罩数量</th>
        <th>总价</th>
        <th>预约时间</th>
        <th>预约状态</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${orders}" var="obj">
        <tr>
            <td>${obj.orderId}</td>
            <td>${obj.pId}</td>
            <td>${obj.f_name}</td>
            <td>${obj.fmaskNum}</td>
            <td>${obj.fmaskPrice}</td>
            <td>${obj.orderTime}</td>
            <td class="order_status">${obj.orderStatus}</td>
            <td>
                <a href="/order/rec_f?orderId=${obj.orderId}&method=1">领取</a>&nbsp;&nbsp;&nbsp;
                <a href="/order/rec_f?orderId=${obj.orderId}&method=-1">取消订单</a>
            </td>
        </tr>
    </c:forEach>
</table>
<script>
    status1 = document.getElementsByClassName("order_status");
    for (var i = 0, len = status1.length; i < len; i++){
        if (this.status1[i].innerHTML == 0)
            status1[i].innerHTML = "未领取";
        else
            status1[i].innerHTML = "取消订单";
    }


</script>
</body>
</html>