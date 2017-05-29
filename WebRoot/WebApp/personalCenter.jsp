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
<title>个人中心</title>

<script type="text/javascript">
	$().ready(function() {
		$(".hoverColor ").mouseover(function() {
			/*this.style = "background-color:gray;color: #ffffff;border-bottom:1px solid gray";*/
			this.style = "border-bottom:2px solid #0a8";
			$(this).addClass('text-white');
		}).mouseout(function() {
			this.style = "none";
			$(this).removeClass('text-white');
		});
	});

	/*  $(function(){
	 //当鼠标滑入时将div的class换成divOver
	 $('.hoverbox').hover(function(){
	 $(this).addClass('bg');
	 },function(){
	 //鼠标离开时移除divOver样式
	 $(this).removeClass('bg');
	 }
	 );
	 });*/
</script>


<style type="text/css">

/*   .content_layout{
               width: 1000px;
           }*/

/*   .nvg_layout{
               height: 500px;
           }*/
</style>


</head>
<body>



	<div class="layout bg hidden-l">
		<div class="container-layout height-big">
			<span class="float-right"><a
				href="${pageContext.request.contextPath }/WebApp/register.jsp">注册</a>
				<span class="text-little ">|</span> <c:if test="${empty userInfo}">
					<a href="${pageContext.request.contextPath }/WebApp/login.jsp"
						class="text-dot">登录</a>
				</c:if> <c:if test="${not empty userInfo}">
					<a href="${pageContext.request.contextPath }/UserServlet?method=exit"
						class="text-mix">注销</a>
				</c:if> <span class="text-little text-gray">|</span> <a href="#">联系</a> </span>
			${not empty userInfo? userInfo.username : '' } 欢迎您访问此网站
		</div>
	</div>

	<div class="bg-inverse bg-gray border">
		<div class="container">
			<ul class="xm1-move nav-inline  clearfix nav-navicon  ">
				<li class=""><a
					href="${pageContext.request.contextPath}/IndexServlet">首页</a></li>
			</ul>
		</div>
	</div>




	<div class="container">
		<!--左边导航栏--------------------------------------------------------------->
		<div class="container">
			<hr />
			<span class="h2 text-green">个人中心</span>
			<hr />
		</div>
		<div class="container">
			<div class="layout content_layout">
				<div class="line-small">
					<div class="xm2 x1-move nvg_layout">
						<ul class="nav nav-pills border-green text-center h4"
							id="nav-link1">
							<li class="active"><a
								href="${pageContext.request.contextPath }/WebApp/userInfo.jsp"
								target="content">个人资料</a></li>
							<hr />
							<li><a
								href="${pageContext.request.contextPath }/CommunityServlet?method=act"
								target="content">我的闲换</a></li>
							<hr />
							<li><a
								href="${pageContext.request.contextPath }/ActivitiServlet?method=userJoinAct"
								target="content">我参加的活动</a></li>
							<hr />
						</ul>
					</div>
					<div class="xm7" style="height: 700px">
						<iframe seamless="seamless" rameborder="0" name="content"
							width="100%" height="100%"
							src="${pageContext.request.contextPath }/WebApp/userInfo.jsp"></iframe>
					</div>
					<div class="xm2 border border-main"></div>
				</div>

			</div>

		</div>

		<!------------------------------------------------------------------>
		<div class="container">
			<h2 class="padding-bottom border-bottom icon-caret-right">友情链接</h2>
			<br /> <a href="#" target="_blank" title="校园社区">无情项目经理强制为程序员1:1配置美女鼓励师</a>
		</div>
		<br /> <br />

		<!--底栏-->
		<div class="  nav-big" style="background-color: DimGray">
			<div class="container padding text-center" style="color: LightGrey">
				<h6>版权所有 Copyright © All Rights Reserved 粤ICP备zxcv15465a4f号</h6>
			</div>
		</div>

	</div>
</body>
</html>