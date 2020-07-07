<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>--%>
<%@include file="/WEB-INF/common/tag.jsp"%>
<html>
<head>
    <title>口罩订单管理</title>
    <%@include file="/WEB-INF/common/head.jsp" %>
<%--    <jsp:include page="/WEB-INF/pages/person/head.jsp"/>--%>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>订单详情</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <td>订单号</td>
                    <td>预约人账号</td>
                    <td>口罩类型</td>
                    <td>口罩数量</td>
                    <td>价格</td>
                    <td>预约时间</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.pId}</td>
                    <td>${order.fmaskId}</td>
                    <td>${order.fmaskNum}</td>
                    <td>${order.fmaskPrice}</td>
                    <td>${order.orderTime}</td>
                    <td>
                        <a href="/order/${order.orderId}/orderModify">修改</a>
                        <a href="/order/${order.orderId}/orderDelete" >删除</a>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
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
