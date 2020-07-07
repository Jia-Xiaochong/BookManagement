<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 16636
  Date: 2020/6/29
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>管理员-首页</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.0.0.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
</head>
<body class="container">
<!-- 导航条 -->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin">图书馆图书管理系统</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/addUser" role="button">添加用户</a></li>
            <li><a href="${pageContext.request.contextPath}/userList" role="button">用户列表</a></li>
            <li><a href="${pageContext.request.contextPath}/addBook" role="button">添加图书</a></li>
            <li><a>${sessionScope.user.username} - ${sessionScope.user.level}</a></li>
        </ul>
    </div>
</nav>
<!-- 图书列表 -->
<p>${msg}</p>
<div>
    <table class="table">
        <thead>
        <tr>
            <th>图书名称</th>
            <th>图书作者</th>
            <th>出版社</th>
            <th>分类</th>
            <th>总量</th>
            <th>存量</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${bookList}" var="book">
            <tr>
                <td>${book.bookname}</td>
                <td>${book.author}</td>
                <td>${book.press}</td>
                <td>${book.tag}</td>
                <td>${book.total}</td>
                <td>${book.stock}</td>
                <td><a href="${pageContext.request.contextPath}/adminShowBook/${book.bid}">查看详情</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<p style="text-align: center;">计算机172-贾笑冲</p>
</body>
</html>
