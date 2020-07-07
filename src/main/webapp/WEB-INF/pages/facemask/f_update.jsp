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
            /*background-color: pink;*/
            text-align: center;
            /*margin-top: 300px;*/
            /*margin-left: 750px;*/
            width: 100%;
            height:100%;
            background-image: url("https://images.pexels.com/photos/3951858/pexels-photo-3951858.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"); /*背景图片路径设置*/
            /*background-color: #F9F900;*/
            background-repeat:no-repeat; /*不进行平铺，图片适应窗口大小*/
            background-attachment: fixed; /*背景图片固定，不随内容滚动*/
            background-origin: border-box; /*从边框区域显示*/
            background-size:cover;/*全部覆盖*/
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

        input {
            padding: 10px;
            width: 200px;
            color: black;
            margin-bottom: 10px;
            /*background-color: antiquewhite;*/
            border: 1px solid black;
            border-radius: 4px;
            letter-spacing: 2px;
        }

        input[type="submit"] {
            width: 50px;
            margin: auto;
            /*background-color: brown;*/
        }

        input[type="reset"] {
            width: 50px;
            margin: auto;
            /*background-color: brown;*/
        }

        table {
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
            width: 100%;
        }

        table td, table th {
            /*border: 1px solid #cad9ea;*/
            color: #666;
            height: 30px;
        }

        table thead th {
            background-color: #CCE8EB;
            width: 100px;
        }

        table tr:nth-child(odd) {
            background: #fff;
        }

        table tr:nth-child(even) {
            background: #F5FAFA;
        }

        table#inventory_table {
            border: 0;
        }
        div#container {
            width: 940px;
            height: 520px;
            margin: auto;
        }
        div#top{
            width: 100%;
            height: 20%;
            text-align: center;
        }
        div#ta{
            width: 100%;
            height: 80%;
            clear: both;
        }
    </style>
</head>
<body>
<div id="container">
    <div id="top"><h1 align="center">口罩信息修改</h1></div>
    <div id="ta">
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
    </div>
</div>


</body>
</html>
