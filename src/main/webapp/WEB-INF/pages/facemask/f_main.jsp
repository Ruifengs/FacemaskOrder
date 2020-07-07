<%--
  Created by IntelliJ IDEA.
  User: Later
  Date: 2020/6/13
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>--%>
<%@include file="/WEB-INF/common/tag.jsp"%>
<html>
<head>
    <title>库存管理</title>
    <%@include file="/WEB-INF/common/head.jsp" %>
    <jsp:include page="/WEB-INF/pages/person/head.jsp"/>
<%--    <style type="text/css">--%>
<%--        body {--%>
<%--            background-color: pink;--%>
<%--        }--%>
<%--        div#container {--%>
<%--            width: 940px;--%>
<%--            height: 520px;--%>
<%--            margin: auto;--%>
<%--        }--%>

<%--        div#save {--%>
<%--            width: 35%;--%>
<%--            height: 20%;--%>
<%--            float: left;--%>
<%--        }--%>

<%--        div#list {--%>
<%--            width: 35%;--%>
<%--            height: 20%;--%>
<%--            float: left;--%>
<%--        }--%>

<%--        div#inventory {--%>
<%--            width: 30%;--%>
<%--            height: 20%;--%>
<%--            float: left;--%>
<%--        }--%>

<%--        div#table {--%>
<%--            width: 100%;--%>
<%--            height: 80%;--%>
<%--            clear: both;--%>
<%--        }--%>

<%--        table#f_table {--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            margin: auto;--%>
<%--        }--%>

<%--        td {--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--    </style>--%>
</head>
<body>
<div class="container">
<%--    <div id="save" style="font-size: 25px;color: red"><a href="save">口罩入库</a></div>--%>
<%--    <div id="list" style="font-size: 25px;color: red"><a href="record?page=1&size=5">入库记录</a></div>--%>

<%--    <div id="inventory">--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <th style="font-size: 25px">口罩可预约数量</th>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>${inventory}个</td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </div>--%>
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>图书详情</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
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
                </thead>
                <tbody>
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
                            <a id="a_status" href="delete?id=${obj.f_ID}&status=${obj.f_status}"
                               onclick="return del()">${obj.f_status>0?"下架":"上架"}</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
<%--    <div id="table">--%>
<%--        <table id="f_table" border="1">--%>
<%--            <tr>--%>
<%--                <th>#</th>--%>
<%--                <th>名称</th>--%>
<%--                <th>入库总数量</th>--%>
<%--                <th>库存总数量</th>--%>
<%--                <th>已领取数量</th>--%>
<%--                <th>状态</th>--%>
<%--                <th>单价</th>--%>
<%--                <th>操作</th>--%>
<%--            </tr>--%>
<%--            <c:forEach items="${list}" var="obj">--%>
<%--                <tr>--%>
<%--                    <td>${obj.f_ID}</td>--%>
<%--                    <td>${obj.f_name}</td>--%>
<%--                    <td>${obj.f_total}</td>--%>
<%--                    <td>${obj.f_inventory}</td>--%>
<%--                    <td>${obj.f_received}</td>--%>
<%--                    <td id="td_status">${obj.f_status>0?"上架":"下架"}</td>--%>
<%--                    <td>${obj.f_price}</td>--%>
<%--                    <td>--%>
<%--                        <a href="update?id=${obj.f_ID}">修改信息</a>--%>
<%--                        <a id="a_status" href="delete?id=${obj.f_ID}&status=${obj.f_status}"--%>
<%--                           onclick="return del()">${obj.f_status>0?"下架":"上架"}</a>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
<%--        </table>--%>
<%--    </div>--%>
</div>
<%--<script type="text/javascript">--%>
<%--    function del() {--%>
<%--        if (confirm("确定要更改商品状态吗？") == true) {--%>
<%--            return true;--%>
<%--        } else--%>
<%--            return false;--%>
<%--    }--%>
<%--</script>--%>
<%--jQery文件,务必在bootstrap.min.js之前引入--%>
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<%--使用CDN 获取公共js http://www.bootcdn.cn/--%>
<%--jQuery Cookie操作插件--%>
<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<%--jQuery countDown倒计时插件--%>
<script src="http://cdn.bootcss.com/jquery.countdown/2.1.0/jquery.countdown.min.js"></script>

<script src="/resources/script/bookappointment.js" type="text/javascript"></script>
</body>
</html>
