<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: 16636
  Date: 2020/6/28
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>个人页面</title>

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
<!-- 图书列表 -->
<div>
	<table class="table">
		<thead>
		<tr>
			<th>图书名称</th>
			<th>借阅者名称</th>
			<th>借阅时间</th>
			<th>截止时间</th>
			<th>状态</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${actions}" var="action">
			<tr>
				<td>${action.book.bookname}</td>
				<td>${action.user.username}</td>
				<td><fmt:formatDate value="${action.starttime}" type="both"/></td>
				<td><fmt:formatDate value="${action.deadline}" type="both"/></td>
				<td>${action.state}</td>
				<td>
					<c:if test="${action.state.equals('待还')}">
						<a href="${pageContext.request.contextPath}/mypage/returnBook/${action.book.bid}">归还</a> | <a href="${pageContext.request.contextPath}/mypage/returnDelay/${action.book.bid}">延期</a>
					</c:if>

				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

</body>
</html>
