<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Login</title>
    <style type="text/css">

        *{
            margin: 0;
            padding: 0;
        }

        #body{
            width: 100%;
            height:100%;
            background-image: url("https://images.pexels.com/photos/3951858/pexels-photo-3951858.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"); /*背景图片路径设置*/
            background-repeat:no-repeat; /*不进行平铺，图片适应窗口大小*/
            background-attachment: fixed; /*背景图片固定，不随内容滚动*/
            background-origin: border-box; /*从边框区域显示*/
            background-size:cover;/*全部覆盖*/
        }


        .panel{
            width: 350px;
            height: 360px;
            position: relative;
            left: 550px;
            top: 60px;
            background-color: #FFFFFF;
            border-radius: 5px;
            border: 1px solid #f57421;
            opacity: 0.8;
        }

        .top{
            height:60px;
            border-bottom:1px solid #f57421;
        }

        .top>p{
            text-align: center;
            padding-top: 15px;
            /*margin: 20px 0;*/
            font-size: 25px;
            color: #f57421;
        }

        .middle{
            position: relative;
            height: 250px;

        }

        .middle>form>input{
            height: 40px;
            width: 290px;
            margin: 20px 30px;
            border: 1px solid #e0e0e0;
        }

        .middle>form>input:last-child{
            background-color: #f57421;
            font-size: 18px;
            color: #FFFFFF;
        }

        .middle>form>input:last-child:hover{
            background-color: #f57421;
            opacity: 0.7;
            cursor: pointer;
            font-size: 18px;
        }
        #title{
            width: 600px;
            height: 100px;
            position: relative;
            left: 550px;
            top: 30px;

        }
        #title p{
            font-size: 50px;
            color: chocolate;
        }
        #register{
            width: 100px;
            height: 20px;
            position: relative;
            left: 250px;
        }
        #register a{
            text-decoration: none;
            font-size: 14px;
            color: #f57421;
        }
    </style>



</head>

<body>
<%--<h1>欢迎登录口罩预约系统</h1>--%>
<%--<form method="post" action="person/personLoginSubmit">--%>
<%--    用户名：<input type="text" name="username"><br>--%>
<%--    密码：<input type="password" name="password"><br>--%>
<%--    <button type="submit">登录</button>--%>
<%--    <button type="button"><a href="/person/registered">注册</a> </button>--%>
<%--</form>--%>


<div id="body">
    <div id="title">
        <p>口罩预约管理系统</p>
    </div>
    <div class="panel">
        <div class="top">
            <p>账号登录</p>
        </div>

        <div class="middle">
            <form action="person/personLoginSubmit" method="post">
                <input type="text" name="username" value=""  class="iputs"/>
                <input type="password" name="password" value="" class="iputs"/>
                <input type="submit" value="登陆"/>
            </form>
            <div id="register">
                <a href="/person/registered">立即注册</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
