<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 16636
  Date: 2020/6/29
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>管理员-图书信息展示</title>

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
<!-- 图书信息展示 -->
<p>${msg}</p>
<table class="table">
    <tr>
        <td>图书ID</td>
        <td>${book.bid}</td>
    </tr>
    <tr>
        <td>图书名称</td>
        <td>${book.bookname}</td>
    </tr>
    <tr>
        <td>图书作者</td>
        <td>${book.author}</td>
    </tr>
    <tr>
        <td>出版社</td>
        <td>${book.press}</td>
    </tr>
    <tr>
        <td>图书概要</td>
        <td>${book.synopsis}</td>
    </tr>
    <tr>
        <td>图书标签</td>
        <td>${book.tag}</td>
    </tr>
    <tr>
        <td>图书总量</td>
        <td>${book.total}</td>
    </tr>
    <tr>
        <td>图书存量</td>
        <td>${book.stock}</td>
    </tr>
    <tr>
        <td>操作</td>
        <td>
            <a href="${pageContext.request.contextPath}/editBook/${book.bid}">修改图书信息</a>
            <c:if test="${book.stock == book.total}">
                <a href="${pageContext.request.contextPath}/delBook/${book.bid}">删除图书</a>
            </c:if>
        </td>
    </tr>
</table>
</body>
</html>
