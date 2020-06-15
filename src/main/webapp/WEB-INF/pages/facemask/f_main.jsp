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
        div#container {
            width: 940px;
            height: 520px;
            margin: auto;
        }

        div#save {
            width: 35%;
            height: 20%;
            float: left;
        }

        div#list {
            width: 35%;
            height: 20%;
            float: left;
        }

        div#inventory {
            width: 30%;
            height: 20%;
            float: left;
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

        td {
            text-align: center;
        }
    </style>
</head>
<body>
<div id="container">
    <div id="save"><a href="save">口罩入库</a></div>
    <div id="list">入库记录</div>
    <div id="inventory">
        <table>
            <tr>
                <th>口罩可预约数量</th>
            </tr>
            <tr>
                <td>${inventory}个</td>
            </tr>
        </table>
    </div>
    <div id="table">
        <table id="f_table" border="1">
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
                        <a href="update?id=${obj.f_ID}">修改</a>
                        <a href="f_delete?id=${obj.f_ID}" onclick="return del()">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<script type="text/javascript">
    function del() {
        if (confirm("确定要删除此条记录吗？") == true) {
            return true;
        } else
            return false;
    }
</script>
</body>
</html>
