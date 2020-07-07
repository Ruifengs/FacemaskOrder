<%--
  Created by IntelliJ IDEA.
  User: Later
  Date: 2020/6/23
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>查看入库记录</title>
</head>
<style>
    body {
        /*background-color: pink;*/
        text-align: center;
        width: 100%;
        height: 100%;
        background-image: url("https://images.pexels.com/photos/3951858/pexels-photo-3951858.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"); /*背景图片路径设置*/
        /*background-color: #F9F900;*/
        background-repeat: no-repeat; /*不进行平铺，图片适应窗口大小*/
        background-attachment: fixed; /*背景图片固定，不随内容滚动*/
        background-origin: border-box; /*从边框区域显示*/
        background-size: cover; /*全部覆盖*/

    }

    div#container {
        width: 940px;
        height: 520px;
        margin: auto;
    }

    div#ta {
        width: 100%;
        height: 90%;
    }
    div#pag{
        width: 100%;
        height: 10%;
        background-color: #F5FAFA;
    }
    div#pag_le,div#pag_ri{
        width: 50%;
        float: left;
    }

    li {
        float: left;
        list-style: none;
        margin: auto;
    }

    table {
        border-collapse: collapse;
        margin: 0 auto;
        text-align: center;
        width: 100%;
        height: 100%;
    }

    table td, table th {
        border: 1px solid #cad9ea;
        color: #666;
        height: 30px;
    }

    table thead th {
        background-color: #CCE8EB;
        width: 100px;
    }

    table tr:nth-child(odd) {
        background: #fff;
    }

    table tr:nth-child(even) {
        background: #F5FAFA;
    }

    table#inventory_table {
        border: 0;
    }
</style>
<body>
<div id="container">
    <div id="ta">
        <table>
            <tr>
                <th>#</th>
                <th>口罩名称</th>
                <th>入库人</th>
                <th>操作类型</th>
                <th>入库数量</th>
                <th>入库时间</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="obj">
                <tr>
                    <td>${obj.r_ID}</td>
                    <td>${obj.f_Name}</td>
                    <td>${obj.pName}</td>
                    <td class="f_type">${obj.r_type}</td>
                    <td>${obj.f_num}</td>
                    <td>${obj.r_time}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div id="pag">
        <div id="pag_le">
            <p>总共${pageInfo.pages}页，共${total}条数据</p>
            <%--            <select name="pageSize" onchange="changePageSize(this.value)">--%>
            <%--                <option value="4" <c:if test="${pageInfo.pageSize==4}">selected</c:if>>4</option>--%>
            <%--                <option value="5" <c:if test="${pageInfo.pageSize==5}">selected</c:if>>5</option>--%>
            <%--                <option value="6" <c:if test="${pageInfo.pageSize==6}">selected</c:if>>6</option>--%>
            <%--            </select>条<br></div>--%>
        </div>
        <div id="pag_ri">
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/facemask/record?page=1&size=${pageInfo.pageSize}">首页</a>&nbsp;&nbsp;&nbsp;
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/facemask/record?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a>&nbsp;&nbsp;&nbsp;
                </li>
                <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                    <li>
                        <a href="${pageContext.request.contextPath}/facemask/record?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>&nbsp;&nbsp;&nbsp;
                    </li>
                </c:forEach>
                <li>
                    <a href="${pageContext.request.contextPath}/facemask/record?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a>&nbsp;&nbsp;&nbsp;
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/facemask/record?page=${pageInfo.pages}&size=${pageInfo.pageSize}">尾页</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">
    var f_type = document.getElementsByClassName("f_type");
    for (var i = 0, len = f_type.length; i < len; i++) {
        if (this.f_type[i].innerHTML == 0)
            this.f_type[i].innerHTML = "新建";
        else if (this.f_type[i].innerHTML == 1)
            this.f_type[i].innerHTML = "增加";
        else if (this.f_type[i].innerHTML == 2)
            this.f_type[i].innerHTML = "减少";
        else if (this.f_type[i].innerHTML == 3)
            this.f_type[i].innerHTML = "下架";
    }
</script>


</body>
</html>
