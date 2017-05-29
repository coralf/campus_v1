<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Admin/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Admin/css/admin.css">
    <script src="${pageContext.request.contextPath }/Admin/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/Admin/js/pintuer.js"></script>
</head>
<body>
	<div class="container-layout">
		<h2>新闻类型管理</h2>
		<hr />
		<table class="table">
			<tr>
				<th>编号</th>
				<th>新闻类型</th>
				<th>操作</th>
			</tr>
			<c:forEach var="i" items="${allNewsType}">
				<tr>
					<td>${i.id}</td>
					<td>${i.newsType}</td>
					<td>
						<button class="button">
							<a href="">修改</a>
						</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>