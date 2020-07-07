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
            /*background-color: pink;*/
            text-align: center;
            width: 100%;
            height:100%;
            background-image: url("https://images.pexels.com/photos/3951858/pexels-photo-3951858.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"); /*背景图片路径设置*/
            /*background-color: #F9F900;*/
            background-repeat:no-repeat; /*不进行平铺，图片适应窗口大小*/
            background-attachment: fixed; /*背景图片固定，不随内容滚动*/
            background-origin: border-box; /*从边框区域显示*/
            background-size:cover;/*全部覆盖*/

        }

        div#container {
            width: 1280px;
            height: 520px;
            margin: auto;
        }
        div#top_ta{
            width: 100%;
            height: 60%;
        }
        div#dow_ta{
            width: 100%;
            height: 40%;
        }

        table {
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
        }

        table td, table th {
            border: 1px solid #cad9ea;
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
        h2{
            font-size: 50px;
            color: crimson;
            /*margin-left: 10px;*/
            /*text-align: left;*/
        }
        input[type="submit"] {
            width: 50px;
            margin: auto;
        }

        input[type="reset"] {
            width: 50px;
            margin: auto;
        }
        table#up_ta{
            border: 0;
        }

    </style>
</head>
<body>
<div id="container">
    <div><h2>口罩入库</h2></div>
    <div id="top_ta">
        <form action="f_save" method="post">
            <table border="0" id="up_ta">
                <tr>
                    <th>名    称</th>
                    <td><input type="text" style="font-size: 35px;" name="f_name"/></td>
                </tr>
                <tr>
                    <th>数    量</th>
                    <td><input type="number" style="font-size: 35px;" name="f_total"/></td>
                </tr>
                <tr>
                    <th>单    价</th>
                    <td><input type="number" style="font-size: 35px;" name="f_price" step="0.01"/></td>
                </tr>
                <tr >
                    <td align="center" colspan="2">
                        <input type="submit" style="font-size: 20px;" value="保存">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" style="font-size: 20px;" value="重置">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dow_ta">
        <table border="1" width="100%" >
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
    </div>
</div>

<br>

</body>
</html>
