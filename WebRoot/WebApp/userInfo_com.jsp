<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath }/WebApp/css/pintuer.css">
<script src="${pageContext.request.contextPath }/WebApp/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/WebApp/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath }/WebApp/js/respond.js"></script>
</head>
<body>
	<div class="container">
		<div class="panel">
			<div class="panel-head bg-green text-center text-green border-none">
				<h3>
					<b>我的闲换</b>
				</h3>
			</div>
			<c:forEach var="com" items="${list}">
				<div class="padding-large border-bottom border-green">
					<p><span class="text-green">标题：</span>${com.title} </p>
					<p><span class="text-green h4">内容：</span>${com.content}</p>
					<p><img src="${com.imgs}" width="200px" height="150px"></p>
					<p><span class="text-green h4">时间：</span>${com.addtime}</p>
				</div>	
			</c:forEach>
		</div>
	</div>
</body>
</html>