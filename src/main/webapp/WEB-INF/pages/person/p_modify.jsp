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
        input{
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
            top: 40px;
        }
        button {
            position: absolute;
            top: 380px;
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
<jsp:include page="head.jsp"/>
<form method="post" action="/person/${person.pId}/personModifySubmit">
    <div id="header">
    </div>
    <div id="box">
        <div id="change">
            <h1>用户修改资料</h1>
            密&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;：<input type="password" name="password" value="${person.password}"><br>
            确认密码：<input type="password" name="repassword" value="${person.password}"><br>
            用户名：&nbsp;&nbsp;<input type="text" name="username" value="${person.username}"><br>
            手机号：&nbsp;&nbsp;<input type="text" name="phoneNum" value="${person.phoneNum}"><br>
            身份证号：<input type="text" name="idNum" value="${person.idNum}"><br>
            <button type="submit">确认修改</button>
        </div>
    </div>

</form>
</body>
</html>
