<%@ page language="java" contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta content="telephone=no" name="format-detection">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/WebApp/css/pintuer.css">
    <script src="${pageContext.request.contextPath }/WebApp/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/WebApp/js/pintuer.js"></script>
    <script src="${pageContext.request.contextPath }/WebApp/js/respond.js"></script>
    <title>登录</title>
</head>
<body>

<div class=" bg-gray bg-inverse">
    <button class="button icon-navicon float-right" data-target="#nav-link1"></button>
    <div class="clearfix"></div>
    <ul class="list-unstyle nav nav-navicon" id="nav-link1">
        <!--<li class="float-right" style="margin-left: 10%">&nbsp;</li>-->
        <li class="xm1 xs3-move text-center float-left"><a href="${pageContext.request.contextPath }/IndexServlet">首页</a></li>
        <li class="xm1 text-center"><a href="${pageContext.request.contextPath }/WebApp/community.jsp">社区</a></li>
        <div class="clearfix"></div>
    </ul>
</div>
<div class="bg"></div>
<div class="container">
    <div class="xs6 xm4 xs3-move xm4-move">
        <div style="height:150px;"></div>
        <!--<div class="media media-y margin-big-bottom">
        </div>-->
        <form action="#" method="post">
            <div class="panel">
                <div class="text-center margin padding-top"><h2>用户登录</h2></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                
                	<input type="hidden" name="url" value=""/>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="user" id="user" placeholder="用户名或邮箱"
                                   data-validate="required:请填写账号"/>
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="pwd" id="pwd" placeholder="登录密码"
                                   data-validate="required:请填写密码"/>
                            <span class="icon icon-unlock-alt margin-small"></span>
                        </div>
                    </div>
                </div>
                <div class="text-right" style="margin-right: 30px">
                    <span id="returninfo"  class="text-dot"></span>
                    <a href="#">忘记密码？</a>
                </div>
                <br/>
                <div style="padding:0px 30px 10px 30px;">
                    <input type="button" id="infoSub" class="button button-block bg-main text-big input-big" value="登录">
                </div>
                <div style="padding:0px 30px 10px 30px;">
                    <input type="button" class="button button-block bg text-big input-big" value="注册新账号"
                           onclick="location.href='register.html'">
                </div>
            </div>
        </form>
    </div>
    
    
    
    <script type="text/javascript">
    	$(function(){
    	
			$("#infoSub").click(function(){
				var username=$("#user").val();
				var pwd=$("#pwd").val();
				//$("#returninfo").load("${pageContext.request.contextPath }/UserServlet?method=login",{"username":username,"pwd":pwd});
				$.post("${pageContext.request.contextPath }/UserServlet?method=login",
				  {
				    "username":username,
				    "pwd":pwd,
				    "url":"${param.url}"
				  },
					  function(data,status){
					    if(data=="0"){
					    	$("#returninfo").html("登录失败，请检查密码或账户！");
					    }else{
					    	if(data=="1"){
								location.href="${pageContext.request.contextPath }/IndexServlet";			    		
					    	}else{
								location.href="${pageContext.request.contextPath }"+data;			    		
					    	}
					    }
				  });
			});
		});
    
    </script>
    
</div>
</body>
</html>