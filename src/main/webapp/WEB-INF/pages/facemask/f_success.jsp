<%--
  Created by IntelliJ IDEA.
  User: Later
  Date: 2020/6/15
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>操作成功</title>
    <style>
        h2 {
            font-size: 50px;
            color: crimson;
        }

        div#top {
            width: 420px;
            height: 220px; /*设置div的大小*/
            left: 50%;
            top: 50%;
            border: 1px solid green; /*边框*/
            text-align: center; /*文字水平居中对齐*/
            /*line-height: 200px; !*设置文字行距等于div的高度*!*/
            /*overflow: hidden;*/
            margin: 0 auto;
        }
    </style>
    <script type="text/javascript">
        //3秒后自动跳转
        function countDown() {
            //获取初始时间
            var time = document.getElementById("Time");
            if (time.innerHTML == 0) {
                //等于0时，跳转到指定界面
                location.href = "main";
            } else
                time.innerHTML = time.innerHTML - 1;
        }

        //1秒（1000毫秒）调用一次
        window.setInterval("countDown()", 1000)
    </script>
</head>
<body>
<div id="top">
    <div id="in1"><h2>操作成功</h2></div>
    <div id="in2"><p><span id="Time">3</span>秒后自动跳转</p></div>
    <div id="in3"><a href="main">如果没有自动跳转，请点这里！</a></div>
</div>
</body>
</html>
