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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/WebApp/css/pintuer.css">
<script src="${pageContext.request.contextPath}/WebApp/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/WebApp/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath}/WebApp/js/respond.js"></script>
<title>活动</title>
</head>
<body style="background-color: #F1F2F6">


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

	<div class="container ">
		<div class="xm10 xm1-move">
			<div class="banner" data-style="border-green">
				<ul class="carousel">
					<div class="item">
						<a href="#"><img
							src="${pageContext.request.contextPath}/WebApp/img/4.jpg"
							class="img-responsive" /> </a>
					</div>
					<div class="item">
						<a href="#"><img
							src="${pageContext.request.contextPath}/WebApp/img/5.jpg"
							class="img-responsive" /> </a>
					</div>
					<div class="item">
						<a href="#"><img
							src="${pageContext.request.contextPath}/WebApp/img/6.jpg"
							class="img-responsive" /> </a>
					</div>
				</ul>
			</div>
			<div class="margin-big-top"></div>
			<hr>
			<div class="line">
				<!--左侧-->
				<div class="xm8 padding-right">
					<div class="bg-white">
						<!--主要内容-->
						<div class="padding-big">
							<c:forEach var="id1" items="${activitiesId1}">
								<a
									href="${pageContext.request.contextPath }/ActivitiServlet?method=dActiviti&id=${id1.id}">
									<h2>${id1.activitiesTitle }</h2> </a>
								<div
									class="text-small button button-small radius-none float-right"
									disabled="disabled">${id1.isEnd==0? "正在进行": "已结束" }</div>

								<div
									class="margin-top margin-bottom padding-bottom border-bottom ">
									<a
										href="${pageContext.request.contextPath }/ActivitiServlet?method=dActiviti&id=${id1.id}"><img
										src="${id1.actImg }" style="width: 300px;height:160px"
										class="float-left margin-big-right" /> </a>
									<div class="clearfix  text-small text-gray">
										<a href="#"><span>XX攻城狮</span> </a> | <span>${id1.actIssueTime}</span>
										<p>
											<span class="icon-eye">点击量：${id1.readCount }</span>
										</p>
										<div class="margin-top"></div>
										<div class="text-default text-black height">
											<p>
												${id1.activitiesContent } <a
													href="${pageContext.request.contextPath }/ActivitiServlet?method=dActiviti&id=${id1.id}"
													class="float-right text-small"> 全文》 </a>
											</p>
										</div>

									</div>
								</div>
							</c:forEach>
							<div class="clearfix  margin-big-top " style="color:#696969;">

								<c:forEach var="id2" items="${activitiesId2}">
									<div style="width:191px;" class="float-left margin-right">
										<a
											href="${pageContext.request.contextPath }/ActivitiServlet?method=dActiviti&id=${id2.id}"><img
											src="${id2.actImg }" style="width: 191px;height: 110px"
											class="margin-bottom radius-big img-responsive"> </a><a
											href="${pageContext.request.contextPath }/ActivitiServlet?method=dActiviti&id=${id2.id}">${id2.activitiesTitle
											}</a><br> <span class="icon-eye text-gray text-small">${id1.readCount}</span>
										<span class="icon-thumbs-up float-right text-gray text-small">
											${id1.praiseCount}</span>
									</div>
								</c:forEach>



							</div>

							<c:forEach var="id3" items="${pageBean.pageData}">
								<div class="margin-top height border-bottom">
									<a
										href="${pageContext.request.contextPath }/ActivitiServlet?method=dActiviti&id=${id3.id}"><h2>${id3.activitiesTitle
											}</h2> </a>
									<div class="text-small margin-top text-gray ">
										<a href="#"><span>XX攻城狮</span> </a> | <span>${id3.actIssueTime
											}</span> <span class="icon-eye float-right"> ${id3.readCount
											} </span> <span class="icon-thumbs-up float-right padding-right">
											${id3.praiseCount }</span>
									</div>
									<a
										href="${pageContext.request.contextPath }/ActivitiServlet?method=dActiviti&id=${id3.id}">
										<img src="${id3.actImg }"
										class="margin-bottom radius-big margin-top img-responsive" />
									</a>
									<p>
										${id3.activitiesContent } <a
											href="${pageContext.request.contextPath }/ActivitiServlet?method=dActiviti&id=${id3.id}"
											class="float-right">全文》</a>
									</p>
								</div>
							</c:forEach>
							<div class="bg-main text-center padding-small" id="iLoadMore">
								<a class="text-white " id="iSpan"
									href="${pageContext.request.contextPath }/ActivitiServlet?method=list&currentPage=${pageBean.currentPage+1}">加载更多</a>
							</div>
						</div>
					</div>
				</div>


				<!--右侧-->
				<div class="xm4">
					<div class="bg-white border bg-inverse text-center padding-big">

						<c:if test="${not empty  userInfo }">
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath }/WebApp/userMakeActivity.jsp'"
								class="button bg-green">我要发起一场游玩，旅行</button>
						</c:if>
						<c:if test="${empty userInfo  }">
							<button type="button"
								onclick="location.href='${pageContext.request.contextPath }/WebApp/login.jsp?url=/ActivitiServlet?method=list'"
								class="button bg-green">登陆->发起游玩，旅行</button>
						</c:if>
					</div>
					<div class="margin-big-top bg-white bg-inverse">
						<div
							class="bg-dot padding-small-top padding-small-bottom border-bottom">
							<strong class="padding text-big">热门活动</strong>
						</div>
						<br> <br> <br> <br> <br> <br> <br>
						<br> <br> <br> <br> <br> <br> <br>
						<br> <br>
					</div>

					<div class="margin-big-top bg-white bg-inverse">
						<div
							class="bg-dot padding-small-top padding-small-bottom border-bottom">
							<strong class="padding text-big">活跃排行</strong>
						</div>
						<br> <br> <br> <br> <br> <br> <br>
						<br> <br> <br> <br> <br> <br> <br>
						<br> <br>
					</div>

					<div class="margin-big-top bg-white bg-inverse">
						<div
							class="bg-dot padding-small-top padding-small-bottom border-bottom">
							<strong class="padding text-big">精彩瞬间</strong>
						</div>
						<br> <br> <br> <br> <br> <br> <br>
						<br> <br> <br> <br> <br> <br> <br>
						<br> <br>
					</div>

				</div>
			</div>

		</div>
	</div>


</body>
</html>