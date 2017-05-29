<%@ page language="java" contentType="text/html; charset=UTF-8"%>

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
<title>修改信息</title>

</head>
<body>

	<div class="container margin-small-top">
		<form action="${pageContext.request.contextPath }/UserServlet?method=update" method="post" class="form form-block">
			<div class="form-group margin-big-top">

				<label for="username"> 用户名：</label>

				<div class="field">

					<input type="text" class="input" id="username" name="username"
						size="50" value="${userInfo.username}" data-validate="required:必填"
						placeholder="请输入用户名！" />
				</div>
			</div>
			<!--         <div class="form-group margin-big-top">

            <label for="nickname">
                昵称：</label>

            <div class="field">

                <input type="text" class="input" id="nickname" name="nickname" size="50"
                       data-validate="required:必填"
                       placeholder="请输入昵称！"/>
            </div>
        </div> -->
			<div class="form-group margin-big-top">
				<label for="pwd"> 密码：</label>

				<div class="field">

					<input type="text" class="input" id="pwd" name="pwd" size="50"
						data-validate="required:必填" value="${userInfo.pwd}"
						placeholder="请输入密码！" />
				</div>
			</div>

			<div class="form-group margin-big-top">

				<div class="field">
					<label for="sex"> 你是：</label>

					<div class="button-group radio">
						<label    ${userInfo.sex eq '男' ? 'class="button active"' : 'class="button"' }> 
							<input name="sex" value="男" type="radio"/>男
						</label>
						<label  ${userInfo.sex eq '女' ? 'class="button active"' : 'class="button"' }> 
							<input name="sex" value="女"  type="radio"/>女
						</label>
					</div>
				</div>
			</div>

			<div class="form-group margin-big-top">
				<label for="content"> 个性描述</label>

				<div class="field">
					<textarea rows="5" class="input" name="contents" id="content"
						placeholder="带上个性描述内容吧！">${!empty userInfo.userDes ? userInfo.userDes:'' }</textarea>
				</div>
			</div>

			<p class="text-right">
					<button class="button border-main radius-none" type="submit">确认修改</button> 
			</p>

		</form>


	</div>


</body>
</html>