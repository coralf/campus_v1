<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="css/pintuer.css">
    <script src="${pageContext.request.contextPath }/WebApp/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/WebApp/js/pintuer.js"></script>
    <script src="${pageContext.request.contextPath }/WebApp/js/respond.js"></script>
    <title>剪影</title>
    <style type="text/css">


        .opacity {
            opacity: 1;
            transition: opacity 1s;
            -moz-transition: opacity 1s; /* Firefox 4 */
            -webkit-transition: opacity 1s; /* Safari 和 Chrome */
            -o-transition: opacity 1s;
        }

        .opacity:hover {
            opacity: 0.8;
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

<div class="container margin-big-top">

    <div class="line-middle ">
        <div class="xm6 x1-move ">
            <div class="media border border-big opacity">
                <a href="#">
                    <img src="img/gambit/sman.jpg"/>
                </a>

                <div class="media-body margin-big-top margin-small-bottom">
                    <strong class="h3"> &nbsp;&nbsp;超凡蜘蛛侠是如何追女朋友的</strong>
                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>
        </div>
        <div class="xm4 ">
            <div class="media  layout  border border-small opacity">
                <a href="#">
                    <img src="img/gambit/content1.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;2016年科技都取得了那些进步？</strong></h4>

                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>
            <div class="media  layout  border border-small opacity">
                <a href="#">
                    <img src="img/gambit/content2.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;宇宙究竟有多大？</strong></h4>

                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>


        </div>
    </div>
    <hr/>

    <div class="line-middle margin-big-top margin-large-bottom">
        <div class="xm1 x1-move">
            <p class="h2 text-red">
                <strong>热门话题</strong>
            </p>
        </div>
        <div class="xm3">
            <div class="media  layout  border border-middle opacity">
                <a href="#">
                    <img src="img/gambit/c8.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;怎样拍，才是正确的构图？</strong></h4>

                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>
        </div>
        <div class="xm3">
            <div class="media  layout  border border-middle opacity">
                <a href="#">
                    <img src="img/gambit/content4.jpg" alt=""/>
                </a>
                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;如何用PS修出一张漂亮的图？</strong></h4>
                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>
        </div>
        <div class="xm3">

            <div class="media  layout  border border-middle opacity">
                <a href="#">
                    <img src="img/gambit/content5.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;你都错过了那些人和事？</strong></h4>
                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>

        </div>

    </div>
    <hr/>
    <div class="line-middle margin-big-top margin-large-bottom">
        <div class="xm1 x1-move">
            <p class="h2 text-green">
               <strong>关于学习</strong>
            </p>
        </div>
        <div class="xm3">
            <div class="media  layout  border border-middle opacity">
                <a href="#">
                    <img src="img/gambit/c15.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;学习英语要走好哪三步？!</strong></h4>

                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>
        </div>
        <div class="xm3">
            <div class="media  layout  border border-middle opacity">
                <a href="#">
                    <img src="img/gambit/c16.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;怎样练得一首好字？</strong></h4>
                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>
        </div>
        <div class="xm3">

            <div class="media  layout  border border-middle opacity">
                <a href="#">
                    <img src="img/gambit/c17.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;你喜欢记笔记吗？</strong></h4>
                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>


        </div>


    </div>
    <hr/>
    <div class="line-middle margin-big-top margin-large-bottom">
        <div class="xm1 x1-move">
            <p class="h2 text-yellow">
                <strong>关于生活</strong>
            </p>
        </div>
        <div class="xm3">
            <div class="media  layout  border border-middle opacity">
                <a href="#">
                    <img src="img/gambit/c10.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;美景</strong></h4>

                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>
        </div>
        <div class="xm3">
            <div class="media  layout  border border-middle opacity">
                <a href="#">
                    <img src="img/gambit/c11.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;风景</strong></h4>
                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>
        </div>
        <div class="xm3">

            <div class="media  layout  border border-middle opacity">
                <a href="#">
                    <img src="img/gambit/c12.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;你错过的人和事！</strong></h4>
                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>

        </div>


    </div>
    <hr/>
    <div class="line-middle  margin-big-top margin-large-bottom">
        <div class="xm1 x1-move">
            <p class="h2 text-sub">
               <strong>游戏</strong>
            </p>
        </div>
        <div class="xm3">
            <div class="media  layout  border border-middle opacity">
                <a href="#">
                    <img src="img/gambit/content3.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;游戏</strong></h4>

                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>
        </div>
        <div class="xm3">
            <div class="media  layout  border border-middle opacity">
                <a href="#">
                    <img src="img/gambit/c14.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;游戏2</strong></h4>
                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>
        </div>
        <div class="xm3">

            <div class="media  layout  border border-middle opacity">
                <a href="#">
                    <img src="img/gambit/c13.jpg" alt=""/>
                </a>

                <div class="media-body margin-small-bottom">
                    <h4><strong>&nbsp;&nbsp;游戏3</strong></h4>
                    <p class="">&nbsp;&nbsp;2017-01-03</p>
                </div>
            </div>


        </div>


    </div>

</div>

<br/>
<br/>
<br/>
<!--底栏-->
<div class="  nav-big" style="background-color: DimGray">
    <div class="container padding text-center" style="color: LightGrey">
        <h6>版权所有 Copyright © All Rights Reserved 粤ICP备zxcv15465a4f号</h6>
    </div>
</div>


</body>
</html>