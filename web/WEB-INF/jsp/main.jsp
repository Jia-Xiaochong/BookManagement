<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.jiaxc.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>首页</title>

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
<!-- 搜索栏 -->
<div class="row">
    <div class="col-lg-2 col-lg-offset-6">
        <select class="form-control" id="tag">
            <option value="bookname" selected="selected">书名</option>
            <option value="author">作者</option>
            <option value="press">出版社</option>
            <option value="tag">类型</option>
        </select>
    </div>
    <div class="col-lg-4">
        <div class="input-group">
            <input type="text" class="form-control" aria-label="Text input with segmented button dropdown" name="search"/>
            <span class="input-group-btn"><button class="btn btn-default" type="button" onclick="search()">搜索</button></span>
        </div>
    </div>
</div>
<!-- 图书列表 -->
<div>
	<table class="table">
		<thead>
		<tr>
			<th>图书名称</th>
			<th>图书作者</th>
			<th>出版社</th>
			<th>类型</th>
			<th>总量</th>
			<th>存量</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody id="tbody">
		<c:forEach items="${booklist}" var="book">
			<tr>
				<td>${book.bookname}</td>
				<td>${book.author}</td>
				<td>${book.press}</td>
				<td>${book.tag}</td>
				<td>${book.total}</td>
				<td>${book.stock}</td>
				<td><a href="${pageContext.request.contextPath}/showbook/${book.bid}">查看详情</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<p style="text-align: center;">计算机172-贾笑冲</p>
</body>

<script type="text/javascript">
    function chanaga(string) {
        $('#changa').html(string);
    }
    function search() {
    	console.log("search()被调用！")
		var list = JSON.stringify({
			tag: $('#tag').val(),
			search: $('input[name="search"]').val(),
		});
		$.ajax({
			type : "POST",
			contentType: "application/json;charset=UTF-8",
			url : "${pageContext.request.contextPath}/search",
			data : list,
			success : function(result) {
				var html = null;
				for(index in result.books){
					html +=	"<tr>"
							+ "<td>" + result.books[index].bookname + "</td>"
							+ "<td>" + result.books[index].author + "</td>"
							+ "<td>" + result.books[index].press + "</td>"
							+ "<td>" + result.books[index].tag + "</td>"
							+ "<td>" + result.books[index].total + "</td>"
							+ "<td>" + result.books[index].stock + "</td>"
							+ "<td><a href='showbook/" + result.books[index].bid + "'>查看详情</a></td>"
							+ "</tr>";
				}
				$("#tbody").html(html);
			},
			error : function(e){
				console.log(e.status);
				console.log(e.responseText);
			}
		});
    }
</script>

</html>
