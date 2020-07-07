
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>后台管理</title>
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
            /*background-color: red;*/

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

        /*.middle>form>.s1{*/
        /*    height: 40px;*/
        /*    width: 40px;*/
        /*    position: absolute;*/
        /*    left: 35px;*/
        /*    top: 40px;*/
        /*    background: url("../images/J1.PNG") no-repeat;*/
        /*}*/

        /*.middle>form>.s2{*/
        /*    height: 40px;*/
        /*    width: 40px;*/
        /*    position: absolute;*/
        /*    left: 35px;*/
        /*    top: 120px;*/
        /*    background: url("../images/J2.PNG") no-repeat;*/
        /*}*/



        .tail>a{
            float: right;
            font-size: 12px;
            padding: 10px;
            text-decoration:none;
            color: black;
        }

        .tail>a:hover{
            color: red;
        }

        .middle>form>.iputs:hover{
            border:1px solid red;
        }


        .footer>span{
            font-size: 15px;
            position: relative;
            left: 45%;
        }

        #middle_top{
            height: 40px;
            width: 300px;
            position: relative;
            left: 22px;
            top: 20px;
            border-radius: 5px;
            border:1px solid #f57421;
        }
        #middle_mid{
            height: 40px;
            width: 300px;
            position: relative;
            left: 22px;
            top:70px;
            border-radius: 5px;
            border:1px solid #f57421;
        }
        #middle_footer{
            height: 40px;
            width: 300px;
            position: relative;
            left: 22px;
            top:120px;
            border-radius: 5px;
            border:1px solid #f57421;
        }
        .middle a{
            text-decoration:none;
            display: block; /* 设置为块元素 */
            width: 300px;
            height: 40px;
            line-height: 40px; /* 设置垂直居中 */
            text-align: center;

        }
        #title{
            width: 600px;
            height: 100px;
            position: relative;
            left: 500px;
            top: 30px;

        }
        #title p{
            font-size: 50px;
            color: chocolate;
        }
    </style>
</head>
<body>
<%--<a href="/person/personManage">用户管理</a>--%>
<%--<a href="/facemask/main">口罩管理</a>--%>
<%--<a href="/order/ordersManage">订单管理</a>--%>
<body>
<div id="body">
    <div id="title">
        <p>欢迎来到后台管理系统</p>
    </div>
<%--    <div id="web_bg" style="background-image: url(/WEB-INF/img/1.jpeg);">--%>
        <div class="panel">
            <div class="top">
                <p>请选择您需要的操作</p>
            </div>

            <div class="middle">
                <div id="middle_top">
                    <a href="/person/personManage">用户管理</a>
                </div>
                <div id="middle_mid">
                    <a href="/facemask/main">口罩管理</a>
                </div>
                <div id="middle_footer">
                    <a href="/order/ordersManage">订单管理</a>
                </div>
            </div>
        </div>
<%--    </div>--%>
</div>
</body>
</html>
