<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/WebApp/css/pintuer.css">
<script src="${pageContext.request.contextPath }/WebApp/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/WebApp/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath }/WebApp/js/respond.js"></script>
</head>
<body>
	<div class="container">
		<div class="panel">
			<div class="panel-head bg-green text-center text-green border-none">
				<h3>
					<b>我参加的游玩，旅行</b>
				</h3>
			</div>
			<div class="line padding">
				<c:forEach var="act" items="${myJoinAct}">
					<div
						class="xs3 text-center ring-hover padding border-bottom border-main margin-big-bottom">
						<img src="${act.actImg }" width="350" height="200" class="radius" />
						<p class="text-center text-green padding-big-top">
							<span class="text-red h3">主题：</span>${act.activitiesTitle }
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>