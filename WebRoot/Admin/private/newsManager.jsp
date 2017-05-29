<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Admin/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/Admin/css/admin.css">
    <script src="${pageContext.request.contextPath }/Admin/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/Admin/js/pintuer.js"></script>
</head>
<body>
    <div class="container-layout">
        <h2>新闻管理</h2>
        <hr/>
        <table class="table">
            <tr>
                <th>编号</th>
                <th>新闻类型</th>
                <th>新闻标题</th>
                <th>新闻发布时间</th>
                <th>阅读量</th>
            </tr>
            
            <c:forEach var="i" items="${pageBean.pageData}">
            <tr>
                <td>${i.id }</td>
                <td>${i.newsType.newsType }</td>
                <td>${i.newsTitle }</td>
                <td>${i.publishDate }</td>
                <td>${i.readCount }</td>
            </tr>
            </c:forEach>
            
             <tr>
                <td colspan="8">
                    <div class="pagelist"><a href="${pageContext.request.contextPath}/NewsServlet?method=newsInfoList&currPage=${pageBean.currentPage-1}">上一页</a> <span class="current">1</span><a href="">2</a><a
                            href="">3</a><a href="${pageContext.request.contextPath}/NewsServlet?method=newsInfoList&currPage=${pageBean.currentPage+1}">下一页</a><a href="">尾页</a></div>
                </td>
            </tr>
        </table>
        <p class="text-right">
            <a href="${pageContext.request.contextPath}/Admin/private/add.jsp">
                <button class="button border-red">添加新闻</button>
            </a>
        </p>
    </div>
</body>
</html>