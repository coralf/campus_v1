<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/WebApp/css/pintuer.css">
    <script src="${pageContext.request.contextPath }/WebApp/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/WebApp/js/pintuer.js"></script>
    <script src="${pageContext.request.contextPath }/WebApp/js/respond.js"></script>
</head>
<body>

<div class="bg-inverse bg-gray border">
    <div class="container">
        <ul class="xm1-move nav-inline  clearfix nav-navicon  ">
            <li class=""><a
                    href="${pageContext.request.contextPath}/IndexServlet">首页</a></li>
            <li class=""><a
                    href="${pageContext.request.contextPath }/ActivitiServlet?method=list">游玩中心</a>
            </li>
        </ul>
    </div>
</div>


<div class="container">
    <div class="padding-big-top">
        <h2 class="text-green">发起一场旅行</h2>
    </div>
    <hr>
    <div class="padding-large-left padding-large-right">
        <form action="${pageContext.request.contextPath }/ActivitiServlet?method=userPublishAct" id="cfrom" class="form form-block" method="post" enctype="multipart/form-data">
            <div class="form-group margin-big-top">
                <label for="title">
                    这次游玩，旅行的标题</label>
                <div class="field">
                    <input type="text" class="input" id="title" name="title" size="50" data-validate="required:必填"
                           placeholder=" 带上游玩，旅行的标题！"/>
                </div>
            </div>

            <div class="form-group margin-big-top">
                <label for="title">
                    来一张图吧！</label>
                <div class="field">
                    <input size="100" type="file" id="upload"  name="icon" class="hidden"/>
                    <img src="${pageContext.request.contextPath}/WebApp/img/community/default_photo.jpg" id="pic"  width="200" height="150"   class="img-border radius-small"/>
                </div>
            </div>
            <div class="form-group margin-big-top">
                <label for="content">
                    游玩，旅行的具体内容</label>
                <div class="field">
                    <textarea rows="5" class="input" name="content" id="content" placeholder=" 游玩，旅行的具体内容！"></textarea>
                </div>
            </div>

            <div class="line">
                <div class="x2 x10-move">
                    <input class="button border-main radius-none" type="submit" value="发布游玩旅行活动"/>
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