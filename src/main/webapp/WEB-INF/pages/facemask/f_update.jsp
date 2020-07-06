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
        body {
            background-color: pink;
            text-align: center;
            margin-top: 300px;
            margin-left: 750px;
        }
        h1 {
            font-size: 50px;
            color: crimson;
            /*margin-left: 10px;*/
            text-align: left;
        }
        th {
            color: blueviolet;
            font-size: 30px;
            text-align: center;
            padding-right: 5px;
        }
        input{
            padding:10px;
            width: 200px;
            color: black;
            margin-bottom:10px;
            background-color: antiquewhite;
            border: 1px solid black;
            border-radius:4px;
            letter-spacing:2px;
        }
        input[type="submit"]{
            width: 50px;
            background-color: brown;
        }
        input[type="reset"]{
            width: 50px;
            background-color: brown;
        }
    </style>
</head>
<body>
<h1>口罩信息修改</h1>
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
