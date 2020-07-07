<%--
  Created by IntelliJ IDEA.
  User: 16636
  Date: 2020/6/29
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>管理员-添加用户</title>

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
<!-- 表格 -->
<p>${msg}</p>
<form action="${pageContext.request.contextPath}/addUser" method="post">
    <table class="table">
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>密  码：</td>
            <td>初始密码“123456”</td>
        </tr>
        <tr>
            <td>类别：</td>
            <td>
                <select name="level">
                    <option value="user">普通用户</option>
                    <option value="admin">管理员</option>
                </select>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="reset" value="重置">
                <input type="submit" value="添加">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
