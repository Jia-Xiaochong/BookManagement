<%--
  Created by IntelliJ IDEA.
  User: 16636
  Date: 2020/6/28
  Time: 7:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>登录</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.0.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="container-fluid">
	<div class="row" style="margin-top: 175px;">
		<div class="panel panel-default center-block" style="width: 300px;padding: 0;">
			<div class="panel-body text-center">
				用户登录
			</div>
			<div class="panel-footer">
				<p>${msg}</p>
				<form action="${pageContext.request.contextPath}/login" method="post">
					<div class="input-group" style="margin-bottom: 20px;">
						<span class="input-group-addon" id="basic-addon1">账号</span>
						<input type="text" name="username" class="form-control" aria-describedby="basic-addon1">
					</div>
					<div class="input-group" style="margin-bottom: 20px;">
						<span class="input-group-addon" id="basic-addon2">密码</span>
						<input type="password" name="password" class="form-control" aria-describedby="basic-addon1">
					</div>
					<div style="overflow: hidden;">
						<button type="submit" class="btn btn-primary center-block" style="width: 100%;">登录</button>
					</div>
				</form>
				<hr/>
				<%--
				<div style="text-align: center;">
					<a href="#" style="text-decoration: underline;">找回密码</a>
				</div>
				--%>
			</div>
		</div>
	</div>
</div>
</body>
</html>
