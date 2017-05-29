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
	href="${pageContext.request.contextPath }/WebApp/css/pintuer.css">
<script src="${pageContext.request.contextPath }/WebApp/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/WebApp/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath }/WebApp/js/respond.js"></script>
<title>活动详细</title>
</head>
<body style="background-color: #F1F2F6">

	<div class="bg-inverse bg-gray">
		<div class="container">
			<ul class="xm1-move nav-inline  clearfix nav-navicon  ">
				<li class=""><a
					href="${pageContext.request.contextPath }/IndexServlet">首页</a>
				</li>
				<li class=""><a href="${pageContext.request.contextPath }/ActivitiServlet?method=list">活动中心</a>
				</li>

			</ul>
		</div>
	</div>

	<div class="margin-big-top"></div>

	<div class="container ">
		<div class="xm10 xm1-move">
			<div class="margin-big-top"></div>
			<hr>
			<div class="line">
				<!--左侧-->
				<div class="xm9 padding-right">
					<div class="bg-white">
						<!--主要内容-->
						<div class="padding-big ">
							<h1>${activities.activitiesTitle }</h1>
							<div class="text-right">
							
							
								<c:if test="${not empty userInfo}">
									<c:if test="${not empty ua}">
											<button class="button bg-sub radius-none dialogs">我已报名</button>
									</c:if>
									<c:if test="${empty ua}">									
											<button class="button bg-sub radius-none dialogs"
										data-toggle="click" data-target="#ok" data-mask="1"
										data-width="15%">我要报名</button>
									</c:if>
								</c:if>
								
								
								<c:if test="${empty userInfo}">
									<button class="button bg-sub radius-none" onclick="location.href='${pageContext.request.contextPath}/WebApp/login.jsp?url=/ActivitiServlet?method=list'">登录报名</button>
								</c:if>
								
							</div>
							<div id="ok">
								<div class="dialog">
									<div class="dialog-head">
										<span class="close rotate-hover"></span><strong>消息提示</strong>
									</div>
									<div class="dialog-body">是否确定参加该活动?</div>
									<div class="dialog-foot">
										<button class="button dialog-close">取消</button>
										<button class="button bg-green" onclick="location.href='${pageContext.request.contextPath}/ActivitiServlet?method=tpi&id=${activities.id}'">确认</button>
									</div>
								</div>
							</div>
							<div
								class="text-small margin-big-top border-bottom padding-bottom margin-big-bottom">
								<span class="text-yellow"> 顶置 </span>&nbsp; <span
									class="text-blue"> 精华 </span>&nbsp; <span class="text-gray">发表在</span>&nbsp;
								<span class="text-gray">${activities.actIssueTime}</span> <span
									class="icon-comment text-gray float-right ">${activities.praiseCount}</span>
								<span class="icon-eye text-gray float-right margin-right">
									${activities.readCount} </span>
							</div>

							<div class="text-big height-big padding-big-bottom border-bottom">
								<img src="${activities.actImg }"
									class="margin-big-top margin-big-bottom" with="500" height="350"><br>
								<p class="margin-big-left">${activities.activitiesContent }
								</p>

							</div>
							<!--  <div class="container text-center xm10 margin-big-top">
                            <button class="button bg-red dialogs radius-none">
                                我要报名</button>
                        </div>-->

						</div>
						<br>
						<!--自己评论-->
						<div class="margin-big">
							<img src="${pageContext.request.contextPath }/WebApp/img/t6.png"
								class="radius-circle float-left margin-right"
								style="width: 60px;height: 60px;">
							<form method="post">
								<div class=" clearfix form-group" style="padding-top:3px">
									<input type="text" placeholder="阁下有何高见"
										class="radius-none input margin-top float-left margin-big-right"
										size="30" style="width:65%" /> <input type="submit"
										value="    发 表    "
										class="button radius-none bg-green margin-top " />
								</div>
							</form>
						</div>
						<!--用户评论-->
						<div class="margin-big">
							<h4>
								<strong>点评</strong>
							</h4>
							<div class="margin-big-top border-top ">
								<c:forEach var="ac" items="${activities.activityComment }">
									<img
										src="${ac.userInfo.userIcon}"
										style="width: 40px;height: 40px;vertical-align:middle"
										class="radius-circle margin-big-top float-left">
									<div class="margin-big-top padding-top ">
										<span class="margin-left text-yellow">${ac.userInfo.username }</span> <span
											class="">${ac.content }</span> <span
											class="text-small text-gray">${ac.addtime }</span>
									</div>
									<br>
								</c:forEach>
							</div>
						</div>




					</div>

					<div class="margin-big-top bg-white">
						<div class="margin">
							<div class="margin-big text-gray">
								<br> <span class="text-big text-yellow">最新评论 </span>
							</div>
							
							
							
							<c:forEach var="i" items="${laterComment}">
								<div class="margin-big border-bottom  padding-bottom">
									<img src="${i.userInfo.userIcon}"
										style="width: 60px;height: 60px;vertical-align:middle"
										class="radius-circle float-left margin-big-right"> <span
										class="text-yellow margin-right text-big">${i.userInfo.username}</span> <span
										class="text-small text-gray">${i.addtime }</span>
									<p class="margin-big-top text-big">${i.content}</p>
									<span class="float-right margin-left text-gray"> 回复 </span> <span
										class="float-right text-gray"> 举报 </span><br />
								</div>
							</c:forEach>
			

							<div class="text-center container xm11">

								<ul class="pagination">
									<li><a href="#" class="">上一页</a>
									</li>
									<li><a href="#"> 下一页</a></li>
								</ul>
							</div>
						</div>
						<br>
						<br>
						<br>
					</div>
					<br>
					<br>
				</div>

				<!--右侧-->
				<div class="xm3">
					<div class="bg-white border ">
						<div style="margin-left: 30%;margin-top:20px;"
							class="margin-bottom">
							<img src="${empty activities.userInfo.userIcon ? '/campus_v1/WebApp/img/community/user.jpg' : activities.userInfo.userIcon }"
								class="radius-circle margin-right padding border"
								style="width: 100px;height: 100px;">
						</div>
						<div class="text-black text-center">
							<span class="text-center">召集人：${activities.userInfo.username }</span>
						</div>
						<div class="text-gray margin-big-top text-center">
							<span>积分：</span> <span>${activities.userInfo.score }</span> | <span>经验：</span> <span>${activities.userInfo.experience}</span>
							<br> <br>
							<!--<a class="button text-white bg-main radius-none margin-right">他的信息</a>
                        <a class="button text-white bg-dot radius-none">发送消息</a>-->
							<button class="button bg-main dialogs radius-none"
								data-toggle="click" data-target="#mydialog" data-mask="1"
								data-width="30%">给Ta留言</button>
							<div id="mydialog">
								<div class="dialog">
									<div class="dialog-head">
										<span class="close rotate-hover"></span><strong>给ta留言</strong>
									</div>
									<div class="dialog-body">
										<input type="text" class="button-big border-none"
											style="width: 100%" placeholder="请输入留言">
									</div>
									<div class="dialog-foot">
										<button class="button dialog-close">取消</button>
										<button class="button bg-green">确认</button>
									</div>
								</div>
							</div>
						</div>
						<br>
					</div>

					<div class="margin-big-top bg-white ">
						<br>
						<div class="margin-big-left padding-bottom border-bottom xm10">
							<strong>最新发表</strong>
						</div>
						<br> <br>
						<ul class="margin-big-left height list-unstyle">
							<li><span class="text-gray text-small">● &nbsp;</span>小米将在CES上发布新品：将</li>
							<li><span class="text-gray text-small">● &nbsp;</span>三国里诸葛亮老婆黄月英
								到</li>
							<li><span class="text-gray text-small">● &nbsp;</span>外国女大学生被害
								尸体被强</li>
							<li><span class="text-gray text-small">● &nbsp;</span>霍金再发警告：人类将迎来</li>
							<li><span class="text-gray text-small">● &nbsp;</span>前苏联曾秘密研究外星人尸</li>
							<li><span class="text-gray text-small">● &nbsp;</span>全铝材质/触摸开关，普菱</li>
							<li><span class="text-gray text-small">● &nbsp;</span>嫌本土品牌续航里程短：德</li>
							<li><span class="text-gray text-small">● &nbsp;</span>港媒：内地“黄牛”技术流</li>
							<li><span class="text-gray text-small">● &nbsp;</span>外媒评选2016最烂的20台电</li>
							<li><span class="text-gray text-small">● &nbsp;</span>青春、荷尔蒙、色情、性AN</li>
						</ul>
						<br>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>