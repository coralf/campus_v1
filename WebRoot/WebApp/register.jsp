<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta content="telephone=no" name="format-detection">
<link rel="stylesheet" href="${pageContext.request.contextPath }/WebApp/css/pintuer.css">
<script src="${pageContext.request.contextPath }/WebApp/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/WebApp/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath }/WebApp/js/respond.js"></script>
<title>注册</title>
<style type="text/css">
.passcode {
	position: absolute;
	right: 0;
	top: 0;
	height: 45px;
	margin: 1px;
	border-left: solid 1px #ddd;
	text-align: center;
	line-height: 45px;
	border-radius: 0 4px 4px 0;
}
</style>
</head>
<body>
	<div class=" bg-gray bg-inverse">
		<button class="button icon-navicon float-right"
			data-target="#nav-link1"></button>
		<div class="clearfix"></div>
		<ul class="list-unstyle nav nav-navicon" id="nav-link1">
			<!--<li class="float-right" style="margin-left: 10%">&nbsp;</li>-->
			<li class="xm1 xs3-move text-center float-left"><a
				href="${pageContext.request.contextPath }/IndexServlet">首页</a></li>
			<li class="xm1 text-center">
			</li>
			<div class="clearfix"></div>
		</ul>
	</div>

	<div class="bg"></div>
	<div class="container">
		<div class="xs6 xm4 xs3-move xm4-move">
			<div style="height:150px;"></div>
			<!--<div class="media media-y margin-big-bottom">
        </div>-->
			<form
				action="${pageContext.request.contextPath }/UserServlet?method=register"
				method="post">
				<div class="panel">
					<div class="text-center margin padding-top">
						<h2>用户注册</h2>
					</div>
					<div class="panel-body"
						style="padding:30px; padding-bottom:10px; padding-top:10px;">
						
						<div class="form-group">
							<div class="field field-icon-right">
								<input type="text" class="input input-big" name="user" id="user"
									placeholder="用户名"
									data-validate="required:请填写账号" /> <span
									class="icon icon-user margin-small"></span>

							</div>
						</div>
						<div class="form-group">
							<div class="field field-icon-right">
								<input type="text" class="input input-big" name="eml" id="eml"
									placeholder="邮箱地址"
									data-validate="required:请填写" /> <span
									class="icon icon-user margin-small"></span>

							</div>
						</div>
						<div class="form-group">
							<div class="field field-icon-right">
								<input type="password" class="input input-big" name="pwd" id="pwd"
									placeholder="登录密码"
									data-validate="required:请填写密码" /> <span
									class="icon icon-unlock-alt margin-small"></span>
							</div>
						</div>

						<div class="form-group">
							<div class="field field-icon-right">
								<input type="password" class="input input-big" name="cpwd" id="cpwd"
									placeholder="请再次输入"
									data-validate="required:请填写密码" /> <span
									class="icon icon-unlock-alt margin-small"></span>
							</div>
						</div>

						<div class="form-group">
							<div class="field">
								<input type="text" class="input input-big" name="passcode" id="checkC"
									placeholder="右侧验证码" data-validate="required:请填写验证码" /><a
									href="javascript:refresh();"> <img id="checkCode"
									src="${pageContext.request.contextPath }/UserServlet?method=checkCode"
									width="80" class="passcode" /> </a>
							</div>
						</div>
						
						<div class="text-right">
							<span id="returninfo"  class="text-dot"></span>
							<a href="${pageContext.request.contextPath }/WebApp/login.jsp">已有账户直接登录？</a>
						</div>
						<br />
						<div style="padding:0px 30px 10px 30px;">
							<input type="button" id="infoSub" 
								class="button button-block bg-main text-big input-big"
								value="注册">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
	
	
		$(function(){
			$("#infoSub").click(function(){
			
				var username=$("#user").val();
				var eml=$("#eml").val();
				var pwd=$("#pwd").val();
				var code=$("#checkC").val();
				var rePwd=$("#cpwd").val();
				if(pwd!=rePwd){
					$("#returninfo").html("两次输入密码不一致");
					return;
				}
				
				$("#returninfo").load("${pageContext.request.contextPath }/UserServlet?method=register",{"username":username,"eml":eml,"pwd":pwd,"checkC":code});
				
			});
		});
		
		function refresh() {
			$("#checkCode").attr("src","${pageContext.request.contextPath }/UserServlet?method=checkCode&"+Math.random());
		}
	</script>


</body>
</html>