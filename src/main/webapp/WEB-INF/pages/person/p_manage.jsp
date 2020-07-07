<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="/WEB-INF/common/tag.jsp"%>
<html>
<head>
    <title>后台登录</title>
    <%@include file="/WEB-INF/common/head.jsp" %>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>用户管理</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <td>账号</td>
                    <td>密码</td>
                    <td>用户名</td>
                    <td>真实姓名</td>
                    <td>身份证号</td>
                    <td>手机号</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="person" items="${persons}">
                    <tr>
                        <td>${person.pId}</td>
                        <td>${person.password}</td>
                        <td>${person.username}</td>
                        <td>${person.pName}</td>
                        <td>${person.idNum}</td>
                        <td>${person.phoneNum}</td>
                        <td>
                            <a href="/person/${person.pId}/personModify">修改</a>
                            <a href="/person/${person.pId}/personDelete">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</body>
</html>
