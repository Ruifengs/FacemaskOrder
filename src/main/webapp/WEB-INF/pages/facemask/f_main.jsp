<%--
  Created by IntelliJ IDEA.
  User: Later
  Date: 2020/6/13
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>库存管理</title>
    <style type="text/css">
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
            width: 940px;
            height: 520px;
            margin: auto;
        }
        div#list_top{
            width: 100%;
            height: 20%;
            background: #F5FAFA;
        }
        div#save {
            width: 35%;
            /*height: 20%;*/
            float: left;
        }

        div#list {
            width: 35%;
            /*height: 20%;*/
            float: left;
        }

        div#inventory {
            width: 30%;
            /*height: 20%;*/
            float: right;
        }

        div#table {
            width: 100%;
            height: 80%;
            clear: both;
        }

        table#f_table {
            width: 100%;
            height: 100%;
            margin: auto;
        }

        table
        {
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
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
        a#btn1,#btn2,#btn3{
            text-align: center;
        }
    </style>
</head>
<body>
<div id="container">
    <div id="list_top">
        <div id="save" style="font-size: 25px;color: red"><a id="btn1" href="/facemask/save"><p>口罩入库</p></a></div>
        <div id="list" style="font-size: 25px;color: red"><a id="btn2" href="/facemask/record?page=1&size=5"><p>入库记录</p></a></div>
        <div id="inventory">
            <table id="btn3">
                <tr>
                    <th style="font-size: 25px">口罩可预约数量</th>
                </tr>
                <tr>
                    <td>${inventory}个</td>
                </tr>
            </table>
        </div>
    </div>
    <div id="table">
        <table id="f_table" border="1">
            <tr>
                <th>#</th>
                <th>名称</th>
                <th>入库总数量</th>
                <th>库存总数量</th>
                <th>已领取数量</th>
                <th>状态</th>
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
                    <td id="td_status">${obj.f_status>0?"上架":"下架"}</td>
                    <td>${obj.f_price}</td>
                    <td>
                        <a href="update?id=${obj.f_ID}">修改信息</a>
                        <a id="a_status" href="/facemask/f_delete?id=${obj.f_ID}&status=${obj.f_status}"
                           onclick="return del()">${obj.f_status>0?"下架":"上架"}</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<script type="text/javascript">
    function del() {
        if (confirm("确定要更改商品状态吗？") == true) {
            return true;
        } else
            return false;
    }
</script>
</body>
</html>
