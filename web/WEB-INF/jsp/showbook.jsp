<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 16636
  Date: 2020/6/29
  Time: 7:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>图书信息展示</title>

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
			<a class="navbar-brand" href="${pageContext.request.contextPath}/main">图书馆图书管理系统</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="${pageContext.request.contextPath}/mypage">${sessionScope.user.username}</a></li>
		</ul>
	</div>
</nav>
<p>${msg}</p>
<table class="table">
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
		<td>概要</td>
		<td>${book.synopsis}</td>
	</tr>
	<tr>
		<td>标签</td>
		<td>${book.tag}</td>
	</tr>
	<tr>
		<td>总量</td>
		<td>${book.total}</td>
	</tr>
	<tr>
		<td>库存</td>
		<td>${book.stock}</td>
	</tr>
	<tr>
		<td>操作</td>
		<td>
			<c:if test="${state.equals('待还')}">
				<a href="${pageContext.request.contextPath}/showbook/returnBook/${book.bid}">归还</a> | <a href="${pageContext.request.contextPath}/showbook/returnDelay/${book.bid}">延期</a>
			</c:if>
			<c:if test="${state.equals('可借')}">
				<a href="${pageContext.request.contextPath}/showbook/borrowBook/${book.bid}">借书</a>
			</c:if>
		</td>
	</tr>
</table>

</body>
</html>
