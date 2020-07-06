<%--
  Created by IntelliJ IDEA.
  User: Later
  Date: 2020/6/23
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/tag.jsp"%>
<html>
<head>
    <title>用户注册界面</title>
    <%@include file="/WEB-INF/common/head.jsp" %>
</head>
<body>
<form action="/person/personRegistered" method="post">
    <table border="1">
        <tr>
            <th colspan="2">注册新用户</th>
        </tr>
        <tr>
            <th>用户名</th>
            <td><input type="text" name="username" id="s1"/></td>
        </tr>
        <tr>
            <th>密码</th>
            <td><input type="password" name="password" id="s2"/></td>
            <input width=500 type="text" style= "color: red; border-style: solid; border-width:0" name="explain1" readonly/></td>
        </tr>
        <tr>
            <th>确认密码</th>
            <td><input type="password" name="repassword" id="s3"/></td>
            <input width=500 type="text" style= "color: red; border-style: solid; border-width:0" name="explain2" readonly/></td>
        </tr>
        <tr>
            <th>姓名</th>
            <td><input type="text" name="pName" id="s4"/></td>
        </tr>
        <tr>
            <th>身份证号码</th>
            <td><input type="text" name="idNum" id="s5"/></td>
        </tr>
        <tr>
            <th>电话号码</th>
            <td><input type="text" name="phoneNum" id="s6"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="保存" /></td>
            <td><input type="reset" value="重置" /></td>
        </tr>
    </table>
</form>

<%--<p>注：前端实现-----确认两次密码是否一致，身份证、手机号码长度是否正确</p>--%>

<%--<script type="text/javascript">--%>
<%--    function Check() {--%>
<%--        var passwd1=document.password.value;--%>
<%--        var passwd2=document.repassword.value;--%>

<%--        if (passwd1 ==="") {--%>
<%--            document.explain1.innerText="密码空，请输入";--%>
<%--            document.explain2.innerText="";--%>
<%--            return;--%>
<%--        }--%>
<%--        if (passwd1 !== passwd2) {--%>
<%--            document.explain1.innerText="";--%>
<%--            document.explain2.innerText="密码不一致，请重输入";--%>
<%--            document.password.innerText="";--%>
<%--            document.repassword.innerText="";--%>
<%--        } else {--%>
<%--            document.explain1.explain1.innerText="";--%>
<%--            document.explain2.explain2.innerText="";--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
