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
        background-color: pink;
    }
    li {
        float: left;
        list-style: none;
        margin: auto;
    }
</style>
<body>
<table id="list" border="1">
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
            <td id="type">${obj.r_type}</td>
            <td>${obj.f_num}</td>
            <td>${obj.r_time}</td>
        </tr>
    </c:forEach>
</table>
总共${pageInfo.pages}页，共${total}条数据。每页
<select name="pageSize" onchange="changePageSize(this.value)">
    <option value="4" <c:if test="${pageInfo.pageSize==4}">selected</c:if>>4</option>
    <option value="5" <c:if test="${pageInfo.pageSize==5}">selected</c:if>>5</option>
    <option value="6" <c:if test="${pageInfo.pageSize==6}">selected</c:if>>6</option>
</select>条<br>
<ul>
    <li><a href="${pageContext.request.contextPath}/facemask/record?page=1&size=${pageInfo.pageSize}">首页</a></li>
    <li><a href="${pageContext.request.contextPath}/facemask/record?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
    <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
        <li><a href="${pageContext.request.contextPath}/facemask/record?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
    </c:forEach>
    <li><a href="${pageContext.request.contextPath}/facemask/f_record.jsp?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
    <li><a href="${pageContext.request.contextPath}/facemask/f_record.jsp?page=${pageInfo.pages}&size=${pageInfo.pageSize}">尾页</a></li>
</ul>
<br>
<%--<p>注：前端实现库存“操作类型” int--->String 转换（0---新建；1---增加；2---减少；3---删除）</p>--%>

<script type="text/javascript">
    var dat = "";
    function changePageSize() {
        var pageSize = document.getElementsByName("pageSize")[0];
        location.href = "/facemask/f_record.jsp?page=1&size=" + pageSize.value;
    }
    function judge() {
        var data = ${obj.r_type};
        if(data===0){
            dat="新建";
        }else if(data===1){
            dat="增加";
        }else if(data===2){
            dat="减少";
        }else{
            dat="删除"
        }
        return dat;
    }
</script>
</body>
</html>
