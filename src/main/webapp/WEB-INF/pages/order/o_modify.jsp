<%--
  Created by IntelliJ IDEA.
  User: 许锐锋
  Date: 2020/6/22
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {

            text-align: center;
        }
        #header{
            width: 100%;
            height:100%;
            background-image: url("https://images.pexels.com/photos/3951858/pexels-photo-3951858.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"); /*背景图片路径设置*/
            background-repeat:no-repeat; /*不进行平铺，图片适应窗口大小*/
            background-attachment: fixed; /*背景图片固定，不随内容滚动*/
            background-origin: border-box; /*从边框区域显示*/
            background-size:cover;/*全部覆盖*/
        }
        h1 {
            font-size: 40px;
            color: grey;
        }
        input,select{
            padding:12px;
            width: 200px;
            color: black;
            margin-bottom:10px;
            background-color: antiquewhite;
            border: 1px solid black;
            border-radius:4px;
            letter-spacing:2px;
        }
        #box{
            height: 500px;
            width: 700px;
            position: absolute;
            left: 350px;
            top:60px;
            border-radius: 5px;
            border:1px solid #f57421;
            background-color: white;
            opacity: 0.8;
        }
        #change{
            height: 450px;
            width: 500px;
            position: absolute;
            left: 100px;
            top: 50px;
        }
        button {
            position: absolute;
            top: 350px;
            left: 200px;
            width: 120px;
            height: 40px;
            border-radius: 5px;
            border: 1px solid;
            cursor: pointer;
            color: black;
            font-size: 16px;
        }
    </style>
</head>
<body>
<form method="post" action="/order/${order.pId}/orderModifySubmit">
    <div id="header">
    </div>
    <div id="box">
        <div id="change">
            订单号：&nbsp;&nbsp;&nbsp;<input name="orderId" value="${order.orderId}" checked><br>
            用户ID：&nbsp;&nbsp;&nbsp;<input name="pId" value="${order.pId}" checked><br>
            口罩类型：
            <select name="fmaskId">
                <option selected value="${order.fmaskId}">${fmaskType}</option>
                <c:forEach var="facemask" items="${facemasks}">
                    <option value =${facemask.f_ID}>${facemask.f_name}</option>
                </c:forEach>
            </select><br>
            口罩个数：<input name="fmaskNum" value="${order.fmaskNum}"><br>
            价格：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="fmaskPrice" value="${order.fmaskPrice}"><br>
            预约日期：<input name="orderTime" value="${order.orderTime}"><br>
            <button type="submit">确认修改</button>
        </div>
    </div>
</form>
</body>
</html>
