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
<h2>这里是Success界面</h2>
<p><span id="Time">3</span>秒后自动跳转</p>
<a href="main">如果没有自动跳转，请点这里！</a>
</body>
</html>
