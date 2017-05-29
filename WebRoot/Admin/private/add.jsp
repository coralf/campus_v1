<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Admin/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Admin/css/admin.css">
    <script src="${pageContext.request.contextPath }/Admin/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/Admin/js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>增加内容</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="${pageContext.request.contextPath }/NewsServlet?method=publish" enctype="multipart/form-data">
				<div class="form-group">
					<div class="label">
						<label>标题：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="title"
							data-validate="required:请输入标题" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>图片：</label>
					</div>

					<div class="field">
						<input size="100" type="file" id="upload" name="icon"
							class="hidden" /> <img
							src="${pageContext.request.contextPath}/WebApp/img/community/default_photo.jpg"
							id="pic" width="200" height="150" class="img-border radius-small" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>分类标题：</label>
					</div>
					<div class="field">
						<select name="cid" class="input w50">
							<option value="14">大事件</option>
							<option value="15">要闻</option>
							<option value="1">科普新闻</option>
						</select>
						<div class="tips"></div>
					</div>
				</div>
			
				<div class="form-group">
					<div class="label">
						<label>内容：</label>
					</div>
					<div class="field">
						<textarea name="content" class="input"
							style="height:450px; border:1px solid #ddd;"></textarea>
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	
	<script type="text/javascript">
				
				    $(function() {
				        $("#pic").click(function () {
				            $("#upload").click(); //隐藏了input:file样式后，点击头像就可以本地上传
				            $("#upload").on("change",function(){
				                var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
				                if (objUrl) {
				                    $("#pic").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
				                }
				            });
				        });
				    });
				
				    //建立一個可存取到該file的url
				    function getObjectURL(file) {
				        var url = null ;
				        if (window.createObjectURL!=undefined) { // basic
				            url = window.createObjectURL(file) ;
				        } else if (window.URL!=undefined) { // mozilla(firefox)
				            url = window.URL.createObjectURL(file) ;
				        } else if (window.webkitURL!=undefined) { // webkit or chrome
				            url = window.webkitURL.createObjectURL(file) ;
				        }
				        return url ;
				    }

				</script>

</body>
</html>