<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">

<!-- 表示响应式支持-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- start-->
<!-- 引入pintuer前端框架的js和CSS样式-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/WebApp/css/pintuer.css">
<link href="${pageContext.request.contextPath }/WebApp/css/news.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/WebApp/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/WebApp/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath }/WebApp/js/respond.js"></script>
<!-- end-->
<title>首页</title>

<style type="text/css">
.height_space {
	height: 130px;
}
</style>

</head>
<body>

	<div class="bg-inverse bg-gray border">
		<div class="container">
			<ul class="xm1-move nav-inline  clearfix nav-navicon  ">
				<li class=""><a
					href="${pageContext.request.contextPath }/IndexServlet">首页</a>
				</li>
			</ul>
		</div>
	</div>

	<div class="container margin-large-top">
		<div class="layout">
			<div class="line-middle">
				<div class="content_layout">
					<div class="xm8 x1-move  content_height">
						<!--顶部标题导航-->
						<div>
							<p>
								<a href="${pageContext.request.contextPath }/WebApp/index.jsp"
									class="margin text-big text-gray">校园新闻</a>> <a href="#"
									class="margin text-big">${news.newsType.newsType }</a> <a
									href="#" class="margin text-big">正文</a>
							</p>

							<h1 class="padding-small-top padding-small-bottom">${news.newsTitle
								}</h1>

							<p class="margin-small-top border-bottom padding-big-bottom">
								<time class="text-small text-gray">${ news.publishDate}</time>
								<a href="#" class="margin-left text-small text-gray">来源:</a> <a
									href="#" class="text-small text-gray float-right">举报</a>
							</p>
							<div class="clearfix"></div>
						</div>
						<!--正文-->
						<div class="small-container padding">
							<h2 class="text-center padding">${news.newsTitle }</h2>

							<div style="text-align:center">
								<!--插图，图片高度自动-->
								<div class="bg padding"
									style="display:inline-block;min-width:60%">
									<c:if test="${not empty news.newsImg}">
										<img src="${news.newsImg }" height="" width=""
										style="height:100%;width:100%;" alt="Alternate Tex" />
											</c:if>
											<c:if test="${empty news.newsImg}">
												<div class="text-center bg-green padding-big">
													<span class="text-white h3">无法加载该图片</span>
									</div>
									</c:if>
								</div>
							</div>
							<p class="text-big text-indent margin-big height-big">
								${news.newsContent }</p>

							<!--脚注-->
							<abbr class="text-right text-gray" style="display:block;">
								<i>作者：${news.userInfo.username }</i> </abbr>


							<div class="clearfix"></div>
							<hr class="bg-black margin-big-bottom" style="height:4px" />
							<!--评论区-->
							<div class="layout margin">
								<!--导航-->
								<div class="container-layout">
									<span class="bg-mix radius-big padding float-left">${news.newsCommentSize
										}条评论</span>
									<div class="clearfix"></div>
								</div>
								<!--网友评论块-->
								<div class="container-layout margin-big-top margin-big-bottom">
									<div class="border margin radius-big padding">
										<c:forEach var="newsComment" items="${news.newsComment }">
										<p>
											<span>${newsComment.userInfo.username }:${newsComment.content }</span>
										</p>
										<hr/>
										</c:forEach>
									</div>
								</div>
							</div>

							<div class="clearfix"></div>
						</div>

						<hr class="bg-black margin-big-top" style="height:4px" />
						<!--评论盒子-->
						<h2 class="float-left">新闻跟帖</h2>

						<div class="float-right">
							<span>跟帖:<em class="text-large text-dot">121</em> </span> <span>浏览:<em
								class="text-large text-dot">13131</em> </span>
						</div>
						<div class="clearfix"></div>
						<div
							class="margin-small-top margin-small-bottom padding-big border border-gray radius-big">
							<form action="/" method="post">
								<textarea class="layout padding margin-bottom"
									placeholder="亲爱的赶紧跟帖吧！" style="letter-spacing:1px;"></textarea>

								<div class="layout bg">
									<input type="text" name="name" value="" placeholder="用户名"
										class="padding-small" /> <input type="password" name="pwd"
										value="" placeholder="密码" class="padding-small" /> <a
										href="#" class="padding-left text-main">注册</a> <a href="#"
										class="padding-left text-main">忘记密码</a> <input
										class="float-right bg-main text-white padding-big-left padding-big-right"
										type="submit" name="name" value="登录并发帖"
										style="height:40px;border:none;" />

									<div class="clearfix"></div>
								</div>
							</form>
						</div>
						<!--强调版权-->
						<abbr class="text-gray">网友评论仅供其表达个人看法，并不表明本站点立场。</abbr>
						<hr class="bg-black margin-big-top" style="height:4px" />
					</div>
					<!--右边部分，副队长看着办-->

					<div class="height_space"></div>
					<div class="xm3">
						<div class="panel">
							<div class="head text-center bg-red padding">
								<h3>热门新闻</h3>
							</div>
							<div class="panel-body">
								<li><p>
										<a href="">网友吐槽最丑家装 原来这样的背景墙让人最不能忍</a>
									</p></li>
								<li><p>
										<a href="">不求风格只求随心自在 个性美女的90平混搭两居</a>
									</p></li>
								<li><p>
										<a href="">90后摄影师爆改农村祖宅 仅5万让父母比住城里舒坦</a>
									</p></li>
								<li><p>
										<a href="">阳台到底要不要贴墙砖 当初没注意现在超后悔</a>
									</p></li>
								<li><p>
										<a href="">赵丽颖遭导演抓手叮嘱 收视率靠你啦！</a>
									</p></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
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