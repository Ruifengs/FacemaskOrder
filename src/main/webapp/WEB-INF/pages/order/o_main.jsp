<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 许锐锋
  Date: 2020/6/19
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>这是预约页面</title>
    <style type="text/css">
        body {
            background-color: pink;
            text-align: center;
            margin-top: 300px;
            margin-left: 750px;
        }

        p#tips1 {
            color: red;
        }

        input {
            padding: 10px;
            width: 200px;
            color: black;
            margin-bottom: 10px;
            background-color: antiquewhite;
            border: 1px solid black;
            border-radius: 4px;
            letter-spacing: 2px;
        }
    </style>
    <script type="text/javascript">
        function price() {
            var select = document.getElementById("ftype");
            var price = document.getElementById("fmaskPrice");
            if (select.value == 1) {
                price.value = 15;
            } else if (select.value == 2)
                price.value = 50;
            else if (select.value == 3)
                price.value = 20;
            else
                price.value = 10;
        }
    </script>
</head>
<body>
<p id="tips1">请确认信息是否正确！！！</p>
<form method="post" action="orderSubmit">
    姓&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="pName" value="${person.pName}" readonly><br>
    手&nbsp;机&nbsp;号：<input type="text" name="phoneNum" value="${person.phoneNum}" readonly><br>

    口罩类型：<select name="fmaskId" id="ftype" onchange="price()">
    <option>请选择</option>
    <c:forEach var="facemask" items="${facemasks}">
        <option value=${facemask.f_ID}>${facemask.f_name}</option>
    </c:forEach>
</select><br>
    口罩个数：<input name="fmaskNum" type="text" value="10" checked><br>

    价&nbsp;&nbsp;格：<input id="fmaskPrice" name="fmaskPrice" type="text">
    <button type="submit">预约</button>
</form>
</body>
</html>