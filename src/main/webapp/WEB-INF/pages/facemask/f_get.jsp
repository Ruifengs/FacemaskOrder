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
        table
        {
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
            width: 100%;
            /*height: 100%;*/
        }
        table td, table th
        {
            border: 1px solid #cad9ea;
            color: #666;
            height: 30px;
        }
        table thead th
        {
            background-color: #CCE8EB;
            width: 100px;
        }
        table tr:nth-child(odd)
        {
            background: #fff;
        }
        table tr:nth-child(even)
        {
            background: #F5FAFA;
        }
        table#inventory_table{
            border: 0;
        }
        #container {
            width: 940px;
            height: 520px;
            margin: auto;
        }

        #ti,#search{
            width: 100%;
            height: 10%;
            /*float: right;*/
        }
        #ta{
            width: 100%;
            height: 80%;
        }
        #search-le,#search-ri{
            height: 100%;
            width: 50%;
            float: right;
        }
        h2{
            font-size: 50px;
            color: crimson;
            /*margin-left: 10px;*/
            text-align: left;
        }
        input[type="text"]{
            width: 288px;
            margin-left: 0;
        }
        input[type="submit"] {
            width: 50px;
            margin: 0 auto;
            /*background-color: brown;*/
        }
    </style>
</head>
<body>
<div id="container">
<%--    <div id="ti"><h2>口罩领取</h2></div>--%>
    <div id="search">
        <div id="search-le">
            <form action="/order/search"><input type="text" name="search"  /><input type="submit" value="搜索"></form>
        </div>
        <div id="search-ri"><p>支持搜索用户ID和模糊搜索口罩名称</p></div>
    </div>
    <div id="ta"><table border="1">
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
    </table></div>
</div>


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