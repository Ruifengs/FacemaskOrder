<%--
  Created by IntelliJ IDEA.
  User: Later
  Date: 2020/6/14
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>修改口罩信息</title>
    <style type="text/css">
        th {
            text-align: right;
            padding-right: 5px;
        }
    </style>
</head>
<body>
<form action="f_update" method="post">
    <table>
        <tr>
            <th>ID</th>
            <td><input type="number" name="f_ID" value="${obj.f_ID}" readonly="readonly"/></td>
        </tr>
        <tr>
            <th>名称</th>
            <td><input type="text" name="f_name" value="${obj.f_name}"/></td>
        </tr>
        <tr>
            <th>入库总数量</th>
            <td><input type="number" name="f_total" value="${obj.f_total}" readonly="readonly"/></td>
        </tr>
        <tr>
            <th>库存总数量</th>
            <td><input type="number" name="f_inventory" value="${obj.f_inventory}" readonly="readonly"/></td>
        </tr>
        <tr>
            <th>已领取数量</th>
            <td><input type="number" name="f_received" value="${obj.f_received}" readonly="readonly"/></td>
        </tr>
        <tr>
            <th>单价</th>
            <td><input type="number" name="f_price" value="${obj.f_price}" step="0.01"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="保存">&nbsp;</td>
            <td><input type="reset" value="重置"></td>
        </tr>
    </table>
</form>
</body>
</html>
