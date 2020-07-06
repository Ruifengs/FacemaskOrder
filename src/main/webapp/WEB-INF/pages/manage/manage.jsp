<%--
  Created by IntelliJ IDEA.
  User: 许锐锋
  Date: 2020/6/22
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Title</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
    <script src="/lib/layui/layui.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>

    <style>
        .o_div{
            background: url("/images/01.jpg") no-repeat;
        }
        .o_span{
            display: block;
            text-align: center;
            font-size: 20px;
            letter-spacing:8px
        }
    </style>
</head>
<body>
<%--<h2>欢迎${sessionScope.person.username}</h2>--%>
<%--<a href="/facemask/main">口罩管理</a><br>--%>
<%--<a href="/person/personManage">用户管理</a><br>--%>
<%--<a href="/order/ordersManage">订单管理</a>--%>

<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="">口罩预约管理系统</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <%--<ul class="layui-nav left fast-add" lay-filter="">--%>
    <%--<li class="layui-nav-item">--%>
    <%--<a href="javascript:;">+新增</a>--%>
    <%--<dl class="layui-nav-child"> <!-- 二级菜单 -->--%>
    <%--<dd><a onclick=""><i class="iconfont">&#xe6a2;</i>资讯</a></dd>--%>
    <%--<dd><a onclick=""><i class="iconfont">&#xe6a8;</i>图片</a></dd>--%>
    <%--<dd><a onclick=""><i class="iconfont">&#xe6b8;</i>用户</a></dd>--%>
    <%--</dl>--%>
    <%--</li>--%>
    <%--</ul>--%>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            ${sessionScope.person.username}
            <a href="/person/logout">退出</a>
        </li>
    </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li class="sub-menu">
                <a href="/person/personManage">
                    <cite>用户管理</cite>
                </a>
            </li>

            <li>
                <a href="/facemask/main">
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>口罩管理</cite>

                </a>
            </li>
            <li class="sub-menu">
                <a href="/order/ordersManage">
                    <cite>订单管理</cite>
                </a>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content" >
            <div class="layui-tab-item layui-show o_div" >
                <span class="o_span">${sessionScope.person.username}管理员，欢迎来到口罩预约管理系统！</span>
                <div class="layui-col-md6" style="padding: 30px;left: 60px;background-color: #F2F2F2;">
                    <div class="layui-card">
                        <div class="layui-card-header">个人信息
                        </div>
                        <div class="layui-card-body">
                            <%--<div class="layui-form-label" style="text-align: left">你好</div>--%>
                            用户名：${sessionScope.ad.a_username}
                        </div>
                        <div class="layui-card-body">
                            姓名：${sessionScope.ad.a_name}
                        </div>
                        <div class="layui-card-body">
                            电话：${sessionScope.ad.a_phone}
                        </div>
                        <div class="layui-card-body">
                            级别描述：${sessionScope.ad.a_describe}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2019-2020 版权所有</div>
</div>
<!-- 底部结束 -->

<%--<script>--%>
<%--    layui.config({--%>
<%--        base: 'layui_exts/',--%>
<%--    }).extend({--%>
<%--        excel: 'excel',--%>
<%--    });--%>
<%--</script>--%>

</body>
</html>
