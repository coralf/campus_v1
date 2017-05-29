<%@page import="com.campus.entity.News"%>
<%@page import="java.util.List"%>
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



<title>首页</title>

<script type="text/javascript">
	$().ready(function() {
		$(".hoverColor ").mouseover(function() {
			this.style = "background-color:gray;color: #abcdef;border-bottom:1px solid gray";
			/*this.style = "border-bottom:2px solid #ffffff";*/
			$(this).addClass('text-main');
		}).mouseout(function() {
			this.style = "none";
			$(this).addClass('text-main');
		});
	});

	  $(function(){
	 //当鼠标滑入时将div的class换成divOver
	 $('.hoverbox').hover(function(){
	 $(this).addClass('bg');
	 },function(){
	 //鼠标离开时移除divOver样式
	 $(this).removeClass('bg');
	 }
	 );
	 });
</script>
</head>
<body>



	<div class="layout bg hidden-l">
		<div class="container-layout ">
			<span class="float-right"><a
				href="${pageContext.request.contextPath }/WebApp/register.jsp">注册</a>
				<span class="text-little ">|</span> 
				
				<c:if test="${empty userInfo}">
					<a
					href="${pageContext.request.contextPath }/WebApp/login.jsp" class="text-dot">登录</a>
				</c:if>
				
				<c:if test="${not empty userInfo}">
					<a
					href="${pageContext.request.contextPath }/UserServlet?method=exit" class="text-mix">注销</a>
				</c:if>
				 <span
				class="text-little text-gray">|</span> <a href="#">联系</a> </span>
				${not empty userInfo? userInfo.username : '' }
			欢迎您访问此网站
		</div>
	</div>


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


	


	<div class="container">

			<!-- 焦点图 开始 -->
				<div class="banner">
					<ul class="carousel">
						<div class="item">
							<a href="#"><img
								src="${pageContext.request.contextPath }/WebApp/img/1.jpg"
								class="img-responsive" /> </a>
						</div>
						<div class="item">
							<a href="#"><img
								src="${pageContext.request.contextPath }/WebApp/img/2.jpg"
								class="img-responsive" /> </a>
						</div>
						<div class="item">
							<a href="#"><img
								src="${pageContext.request.contextPath }/WebApp/img/3.jpg"
								class="img-responsive" /> </a>
						</div>
					</ul>
				</div>
		</div>
		

		<br />

		<div class="container">
			<div class="padding border bg">
				<strong class="text-red">最新资讯</strong> | <a href="#">项目经理被多名设计师程序群殴</a>
			</div>
		</div>
		<br />

		<div class="container">
			<div class="line ">
				<div class="xm4 border">
					<div
						class="bg padding-small-top padding-small-bottom border-bottom">
						<strong class="padding text-blue text-big">旅游大事件</strong>
					</div>
					<c:forEach var="news" items="${newsData14}">
						<div class="padding">
							<img src="${news.newsImg }" style="width: 372px;height: 221px">
							<div class="padding-top">
								<a
									href="${pageContext.request.contextPath }/NewReadServlet?method=dInfo&newsId=${news.id}">
									<p class="h1 text-more">${news.newsTitle }</p>
									<p class="text-more">${news.newsContent }</p> </a>
							</div>
						</div>
						<div class="border-bottom"></div>
					</c:forEach>
				</div>

				<!--中部-->
				<div class="xm5 padding-left">
					<div
						class=" bg-white hidden-l border-left border-right border-top ">
						<div
							class="bg padding-small-top padding-small-bottom border-bottom">
							<strong class="padding text-blue text-big">旅游新闻</strong>
						</div>
						<div class="padding">
							<!--新闻列-->
							<c:forEach var="news" items="${newsData15 }">
								<div class="border-bottom line">
									<div class="xm4 text-big padding-bottom">
										<a
											href="${pageContext.request.contextPath }/NewReadServlet?method=dInfo&newsId=${news.id}">
											
											<c:if test="${not empty news.newsImg}">
											<img src="${news.newsImg}" class="margin-right"
											style="width:150px;height: 100px;"> 
											</c:if>
											<c:if test="${empty news.newsImg}">
												<div class="text-center bg-green padding-big">
													<span class="text-white h3">无法加载该图片</span>
												</div>
											</c:if>
											</a>
									</div>
									<div class="xm7 padding-left padding-top padding-bottom ">
										<p class="text-more h2">
											<a
												href="${pageContext.request.contextPath }/NewReadServlet?method=dInfo&newsId=${news.id}">${news.newsTitle}
											</a><br>
										<p>
										<p class="text-more">${news.newsContent }</p>
									</div>
								</div>
								<div class="margin-top"></div>

							</c:forEach>
						</div>
					</div>
				</div>
				<!--<div class="xm9 border"> xxx</div>-->


				<!--右侧-->
				<div class="xm3 padding-left">

					<!--今日热点-->
					<div class=" bg-white hidden-l border">
						<div
							class="bg padding-small-top padding-small-bottom border-bottom">
							<strong class="padding text-blue text-big">今日热点</strong>
						</div>
						<div class="padding">
							<div class="padding-small ">
								<ul class="list-unstyle height-large">
									<li><a href="#">十位CEO分享2016年工作总结和未来展</a></li>
									<li><a href="#">CES 2017智能硬件设备前瞻：智能手表</a></li>
									<li><a href="#">Waves Audio将在CES 2017展示VR录音</a></li>
									<li><a href="#">旗舰机外观：三星A3/A5（2017）渲染</a></li>
									<li><a href="#">谷歌放弃试验6年的超级宽带计划：“光</a></li>
									<li><a href="#">三星新款UHD蓝光播放器亮相：专为H</a></li>
								</ul>
							</div>
							<!--<div class="padding-small">
                        <strong>标签</strong>&nbsp;<span class="icon-angle-double-right"></span>&nbsp; <a
                            class="badge bg-red-light radius-none">项目</a> <a
                            class="badge bg-yellow-light radius-none">
                        代码</a> <a class="badge bg-blue-light radius-none">插件</a> <a
                            class="badge bg-green-light radius-none">
                        工具</a>
                    </div>-->
						</div>
					</div>

					<div class="margin-big-top">&nbsp;</div>

					<!--阅读推荐-->
					<div class=" bg-white hidden-l border ">
						<div
							class="bg padding-small-top padding-small-bottom border-bottom">
							<strong class="padding text-blue text-big">景点推荐</strong>
						</div>
						<div class="padding">
							<div class="padding-small ">
								<div class="bg">
									<img
										src="${pageContext.request.contextPath }/WebApp/img/news/11.jpg"
										class="margin-right float-left"
										style="width:100px;height: 65px;">

									<div class=" text-big clearfix ">
										<a href="#"> <span>2017年寒冬会过去吗：大佬们也迷茫</span> </a>
									</div>

								</div>

								<ul class="list-unstyle height-large">
									<li><a href="#">- 为什么别人创业越做越轻松 而你</a></li>
									<li><a href="#">- 柳传志：我没有马云那么阔 但是比</a></li>
									<li><a href="#">- 京华时报停刊 多少平媒已成京华烟</a></li>
									<li><a href="#">- 互联网大佬个性一览：马云热情 周鸿</a></li>
									<li><a href="#">- 大佬当年也很惨：刘强东开餐馆倒闭</a></li>
									<li><a href="#">- 快手 3亿用户 和他们的江湖</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="margin-big-top">&nbsp;</div>
					<!--科普-->
					<div class=" bg-white hidden-l border ">
						<div
							class="bg padding-small-top padding-small-bottom border-bottom">
							<strong class="padding text-blue text-big">其他</strong>
						</div>
						<div class="padding">
							<div class="padding-small ">
								<div class="">
									<div class="text-big">
										<a href="#"> <img
											src="${pageContext.request.contextPath }/WebApp/img/news/10.jpg"
											class="margin-right" style="width:250px;height: 150px;">
											<span>英伟达被做空机构盯上：后续股价</span> </a>
									</div>
								</div>
								<ul class="list-unstyle height-large text-big margin-top">
									<li><span class="text-gray">• </span><a href="#">微信小程序和原生APP有哪些?</a>
									</li>
									<li><span class="text-gray">• </span><a href="#">微信小程序是什么？小程序有</a>
									</li>
									<li><span class="text-gray">• </span><a href="#">自动挡和手动挡哪一个更省油</a>
									</li>
									<li><span class="text-gray">• </span><a href="#">汽车档位越多久越好吗?</a>
									</li>
									<li><span class="text-gray">• </span><a href="#">最近很火的引力波到底是什么?</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
		<!--附近推荐-->
		<!-- 
    <div class="container">
        <div class=" padding-small text-big"
             style="padding-left: 0;background-color: #FFFFFF">
            <strong class="bg-blue  text-white" style="padding:3px;"></strong> <span
                class="padding-left"><strong>附近推荐</strong> </span> <span
                class="float-right"><a href="#" class="text-gray ">更多 <span
                class="icon-caret-right"></span> </a> </span>
        </div>
        <hr>

        <div class="float-left margin-big-right bg">
            <a class="text-center" href="#"> <img src="img/near/2.jpg"
                                                  class="img-responsive" style="width:215px;height: 180px">

                <div class="media-body margin-small-bottom text-default">糖醋豹子胆</div>
            </a>
        </div>

        <div class="float-left margin-big-right bg">
            <a class="text-center" href="#"> <img src="${pageContext.request.contextPath }/WebApp/img/near/5.jpg"
                                                  class="img-responsive" style="width:215px;height: 180px">

                <div class="media-body margin-small-bottom text-default">火爆雪糕</div>
            </a>
        </div>

        <div class="float-left margin-big-right bg">
            <a class="text-center" href="#"> <img src="${pageContext.request.contextPath }/WebApp/img/near/27.jpg"
                                                  class="img-responsive" style="width:215px;height: 180px">

                <div class="media-body margin-small-bottom text-default">七彩斌机灵</div>
            </a>
        </div>

        <div class="float-left margin-big-right bg">
            <a class="text-center" href="#"> <img src="${pageContext.request.contextPath }/WebApp/img/near/22.jpg"
                                                  class="img-responsive" style="width:215px;height: 180px">

                <div class="media-body margin-small-bottom text-default">爱斯可轮</div>
            </a>
        </div>

        <div class="float-left margin-big-right bg">
            <a href="#" class="text-center" href="#"> <img
                    src="${pageContext.request.contextPath }/WebApp/img/near/28.jpg" class="img-responsive"
                    style="width:215px;height: 180px">

                <div class="media-body margin-small-bottom text-default">火爆龙肉</div>
            </a>
        </div>

    </div>

    <br> <br>

    <div class="container">
        <h2 class="padding-bottom border-bottom icon-caret-right">友情链接</h2>
        <br/> <a href="#" target="_blank" title="校园社区">无情项目经理强制为程序员1:1配置美女鼓励师</a>
    </div>
    <br/> <br/>
</div>
 -->
		<!--底栏-->
		<div class="layout" style="background-color: DimGray">
			<div class=" padding text-center" style="color: LightGrey">
				<h6>版权所有 Copyright © All Rights Reserved 粤ICP备zxcv15465a4f号</h6>
			</div>
		</div>
</body>
</html>