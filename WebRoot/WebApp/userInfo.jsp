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
<link rel="stylesheet" href="css/pintuer.css">
<script src="${pageContext.request.contextPath }/WebApp/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/WebApp/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath }/WebApp/js/respond.js"></script>
</head>
<body>
	<div class="container-layout">
		<div class="panel ">
			<div class="panel-head text-center text-green border-none bg-green">
				<h3>
					<b>个人资料</b>
				</h3>
			</div>
			<div class="panel-body">
				<div class="layout">
					<p class="text-center">
						<img src="${empty community.userInfo.userIcon ? '/campus_v1/WebApp/img/community/user.jpg'  : community.userInfo.userIcon }"  width="80" height="80" id="useric"
							class="radius-circle" />
					</p>

					<p class="text-center">
						<form action="" id="tf" >
							<div class="field text-center">
								<a class="button input-file" href="javascript:void(0);">点我换头像<input size="100" type="file" id="iconImg"  name="icon"/></a>
							</div>
						</form>
					</p>
					
				</div>
				<script type="text/javascript">
					$(function(){
						$("#iconImg").change(function(){
							var form = new FormData(document.getElementById("tf"));
							$.ajax({
				                url:"${pageContext.request.contextPath}/UserServlet?method=upload",
				                type:"post",
				                data:form,
				                processData:false,
				                contentType:false,
				                success:function(data){
				                	$("#useric").attr("src",data);
				                    window.clearInterval(timer);
				                },
				                error:function(e){
				                    window.clearInterval(timer);
				                }
				         	 });        
					         //	get();//此处为上传文件的进度条
						});
					});
				</script>
				

				<div class="panel border-none">
					<div class="panel-body">
						<h4>个人信息</h4>
						<hr />


					<%-- 	<c:if test="${not empty userInfo.username }">

							<p>
								<span><strong>昵称：</strong> </span><span>${userInfo.username
									}</span>
							</p>

						</c:if> --%>

						<c:if test="${not empty userInfo.username }">

							<p>
								<span><strong>用户名：</strong> </span><span>${userInfo.username
									}</span>
							</p>

						</c:if>

						<c:if test="${not empty userInfo.sex }">
							<p>
								<span><strong>我是：</strong> </span><span>${userInfo.sex }</span>
							</p>
						</c:if>
						<c:if test="${not empty userInfo.email }">
							<p>
								<span><strong>邮箱：</strong> </span><span>${userInfo.email
									}</span>
							</p>
						</c:if>

						<c:if test="${not empty userInfo.phone }">
							<p>
								<span><strong>手机号码：</strong> </span><span>${userInfo.phone
									}</span>
							</p>
						</c:if>
						<p>
							<c:if test="${not empty userInfo.userDes }">
								<div>
									<span><strong>个性描述：</strong> </span>
									<p class="border padding">${userInfo.userDes }</p>
								</div>
							</c:if>
					</div>
				</div>
			</div>
			<div class="panel-foot border-none">
				<div class="layout text-right">
					<a href="${pageContext.request.contextPath }/WebApp/setUserInfo.jsp">
						<button class="button border-main">点我修改资料</button> </a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>