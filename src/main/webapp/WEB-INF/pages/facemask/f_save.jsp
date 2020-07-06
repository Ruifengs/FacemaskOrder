<%--
  Created by IntelliJ IDEA.
  User: Later
  Date: 2020/6/12
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>口罩入库</title>
    <style>
        body {
            background-color: pink;
            text-align: center;
            margin-top: 200px;
            margin-left: 450px;
        }
    </style>
</head>
<body>
<form action="f_save" method="post">
    名称：<input type="text" style="font-size: 35px;" name="f_name" /><br>
    数量：<input type="number" style="font-size: 35px;" name="f_total" /><br>
    单价：<input type="number" style="font-size: 35px;" name="f_price" step="0.01" /><br>
    <input type="submit" style="font-size: 20px;" value="保存">&nbsp;&nbsp;&nbsp;
    <input type="reset" style="font-size: 20px;" value="重置">
</form>
<br>
<table border="1" style="font-size: 30px">
    <tr>
        <th>#</th>
        <th>名称</th>
        <th>入库总数量</th>
        <th>库存总数量</th>
        <th>已领取数量</th>
        <th>单价</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${list}" var="obj">
        <tr>
            <td>${obj.f_ID}</td>
            <td>${obj.f_name}</td>
            <td>${obj.f_total}</td>
            <td>${obj.f_inventory}</td>
            <td>${obj.f_received}</td>
            <td>${obj.f_price}</td>
            <td>
                <form action="f_inventory_update">
                    <input type="number" name="id" value="${obj.f_ID}" hidden>
                    <input type="number" name="num" placeholder="请输入入库数量">
                    <input type="submit" value="添加">
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
