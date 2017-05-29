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
	href="${pageContext.request.contextPath}/WebApp/css/pintuer.css">
<script src="${pageContext.request.contextPath}/WebApp/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/WebApp/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath}/WebApp/js/respond.js"></script>
<title>闲换</title>

<style type="text/css">
.margin_auto {
	margin-left: auto;
	margin-right: auto;
}

.b_layout {
	width: 1000px;
}

.bg_1 {
	background-color: #F0F0F0;
}
</style>

</head>
<body>


<div class="layout bg-naver bg-inverse  bg-blue" >
    <div class=" container">
        <ul class="  nav nav-inline nav-menu nav-justified  nav-big clearfix nav-navicon" id="naver">
        <img alt=".." src="${pageContext.request.contextPath }/WebApp/logo/logo.png" width="140" height="50">
            <li class=""><a href="${pageContext.request.contextPath }/IndexServlet">首页</a></li>
            <li class=""><a href="${pageContext.request.contextPath }/ActivitiServlet?method=list">约伴同游</a></li>
            <li class=""><a href="${pageContext.request.contextPath }/WebApp/gambit.jsp">摄影天地</a></li>
            <li class=""><a href="${pageContext.request.contextPath }/CommunityServlet?method=communities">跳蚤闲换</a></li>
            <c:if test="${not empty userInfo }">
            <li class=""><a href="${pageContext.request.contextPath }/WebApp/personalCenter.jsp">个人中心</a></li>
            </c:if>
        </ul>
    </div>
</div>	
	<div class="margin-big-top"></div>
	<div class="container">
		<div class="line-middle">
			<div class="x9">
				<div class="banner">
					<div class="carousel">
						<div class="item">
							<a href=""><img
								src="${pageContext.request.contextPath}/WebApp/img/community/bc1.jpg"
								alt="" /> </a>
						</div>
						<div class="item">
							<a href=""><img
								src="${pageContext.request.contextPath}/WebApp/img/community/bc2.jpg"
								alt="" /> </a>
						</div>
						<div class="item">
							<a href=""><img
								src="${pageContext.request.contextPath}/WebApp/img/community/bc3.jpg"
								alt="" /> </a>
						</div>
					</div>
				</div>


				<div class="layout margin-big-top">
					<div class="panel">
						<div class="panel-head">
							<h2 class="text-green">大家闲换</h2>
						</div>
						<div class="panel-body">
							<c:forEach var="community" items="${pageBean.pageData}">
								<div class="line-middle margin-big-top">
									<div class="xm1">
										<span><img
											src="${empty community.userInfo.userIcon ? '/campus_v1/WebApp/img/community/user.jpg'  : community.userInfo.userIcon }"
											alt="" class="radius-circle" height="50" width="50" /> </span>
									</div>
									<div class="xm11">
										<p>
											<span class="text-green text-big">${community.userInfo.username
												}</span>
										</p>

										<h3>${community.title }</h3>
										<br />

										<p class="text-big">${community.content }</p>
										<c:if test="${!empty community.imgs}">
											<div class="layout">
												<img src="${community.imgs }" alt="" width="200"
													height="150" />
											</div>
										</c:if>
										<div class="layout line margin-big-top">
											<div class="xm3">
												<span>${community.addtime }发布</span>
											</div>
											<div class="xm3"></div>
											<div class="xm6">
												<p class="text-right text-default">
													<a href=""><span class="icon-eye">&nbsp;${community.readCount
															}</span> </a>&nbsp;&nbsp;&nbsp;&nbsp;
													<c:if test="${not empty userInfo}">
														<a href="javascript:void(0);"> <span
															class="icon-pencil-square-o" id="ad${community.id }">
																&nbsp;评论一下吧！ </span> </a>
													</c:if>
													<c:if test="${empty userInfo}">
														<a
															href="${pageContext.request.contextPath}/WebApp/login.jsp?url=/CommunityServlet?method=communities">
															<span class="icon-pencil-square-o text-red"
															id="ad${community.id }"> &nbsp;登录评论 </span> </a>
													</c:if>
													&nbsp;&nbsp;&nbsp;&nbsp; <a href=""> <span
														class="icon-thumbs-o-up">&nbsp;${community.praiseCount}
													</span> </a>
												</p>
											</div>



											<hr class="bg-main" />
										</div>

										<form
											action="${pageContext.request.contextPath }/CommunityServlet?method=comment&id=${community.id }"
											method="post">
											<div class="layout margin-large-top "
												id="dcomment${community.id }">
												<textarea rows="5" class="input" placeholder="快来发表你的看法吧！"
													name="content"></textarea>

												<div class="line margin-small-top margin-small-bottom">
													<div class="x2 x10-move">
														<button type="submit"
															class="button button-block border-dot radius-rounded">
															发表</button>
													</div>
												</div>
											</div>
										</form>
										<c:forEach var="ccc"
											items="${community.communityCountComments }">
											<div class="layout ">
												<p>
													<span class="text-green">${ccc.userInfo.username }：</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>${ccc.content
														}</span>
												</p>
											</div>
										</c:forEach>


									</div>
									<hr />

								</div>
								<script>
									$(document)
											.ready(
													function() {
														$(
																"#dcomment${community.id }")
																.toggle();
														$("#ad${community.id }")
																.click(
																		function() {
																			$(
																					"#dcomment${community.id }")
																					.toggle();
																		});
													});
								</script>
							</c:forEach>
							<div class="bg-main text-center padding-small" id="iLoadMore">
								<a class="text-white " id="iSpan"
									href="${pageContext.request.contextPath }/CommunityServlet?method=communities&currentPage=${pageBean.currentPage+1}">加载更多</a>
							</div>
						</div>
					</div>
				</div>

			</div>




			<div class="x3">
				<div class="panel box-shadow-small ">

					<div class=" margin-big-bottom margin-small-top">
						<blockquote class="border-main">
							<p>${not empty userInfo ? '闲换中心':'注册登录，与更多小伙伴一起加入闲换社区吧！'}</p>
						</blockquote>
					</div>
					<div class="layout">
						<p class="text-center">
							<img
								src="${empty community.userInfo.userIcon ? '/campus_v1/WebApp/img/community/user.jpg'  : community.userInfo.userIcon }"
								width="80" height="80" id="useric" class="radius-circle" />
						</p>
					</div>
					<div class="layout">
						<p class="text-center">
							<c:choose>
								<c:when test="${not empty userInfo}">
									<span>欢迎你！</span>|
									<span>${userInfo.username}</span>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/WebApp/login.jsp?url=/CommunityServlet?method=communities">登录</a>|<a
										href="${pageContext.request.contextPath}/WebApp/register.jsp">注册</a>
								</c:otherwise>
							</c:choose>
						</p>
					</div>

				</div>
				<br />

				<div class="layout margin-big-top padding">
					<hr />
					<p class=" text-center">
						<span class="icon-file-text-o text-gray button-large"></span>&nbsp;&nbsp;&nbsp;
					</p>

					<p class="text-big text-center">
						<c:if test="${not empty userInfo}">
							<a
								href="${pageContext.request.contextPath}/WebApp/userPublish.jsp">
								<button
									class="button border-main button-block radius-none text-big">我要闲换</button>
							</a>
						</c:if>
						<c:if test="${empty userInfo}">
							<a
								href="${pageContext.request.contextPath}/WebApp/login.jsp?url=/CommunityServlet?method=communities">
								<button
									class="button border-main button-block radius-none text-big">登录->来闲换吧！</button>
							</a>
						</c:if>
					</p>
					<hr />
				</div>

				<div class="layout margin-big-top">
					<div class="panel">
						<div class="panel-head bg-red">
							<span class="h3 text-white">热门闲换</span>
						</div>
						<div class="panel-body">
							<p>
								<a href="">MacBookAir闲置交易-非诚勿扰</a>
							</p>

							<p>
								<a href="">小米5S 换Iphone 6s -欢迎私信 </a>
							</p>

							<p>
								<a href="">草稚京Cos play 95新 -有意私聊</a>
							</p>

							<p>
								<a href="">ThinkPad S2 9成新 在保 有意私聊</a>
							</p>
						</div>

					</div>

				</div>

			</div>
		</div>

	</div>


	<div id="mydialog" class="hidden">
		<div class="alert alert-blue">
			<span class="close rotate-hover"></span><strong>提示：</strong>没有登录是不能评论的哦!
			&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="${pageContext.request.contextPath}/WebApp/login.jsp?url=/CommunityServlet?method=communities">登录</a>
		</div>
	</div>

	<!--底栏-->
	<div class="  nav-big" style="background-color: DimGray">
		<div class="container padding text-center" style="color: LightGrey">
			<h6>版权所有 Copyright © All Rights Reserved 粤ICP备zxcv15465a4f号</h6>
		</div>
	</div>

</body>
</html>