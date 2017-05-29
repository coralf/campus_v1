<%@ page contentType="text/html; charset=UTF-8"  language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<form method="post" action="" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder">用户管理</strong>

            <a href="" style="float:right; display:none;">添加字段</a>
        </div>

        <table class="table table-hover text-center">
            <tr>
                <th width="100" style="text-align:left; padding-left:20px;">编号</th>
                <th width="10%">用户名</th>
                <th>邮箱</th>
                <th>激活状态</th>
                <th width="310">操作</th>
            </tr>
            
            
            <c:forEach var="i" items="${pageBean.pageData}">
	            <tr>
	            	<td>${i.id }</td>
	                <td>${i.username }</td>
	                <td>${i.email }</td>
	                <td>${i.state ==1? '激活':'未激活'}</td>
	                <td>
	                	<c:if test="${i.state ==0}">
	                    <div class="button-group"><a class="button border-main" href="${pageContext.request.contextPath }/UserServlet?method=activeUser&id=${i.id}"><span
	                            class="icon-edit"></span>激活该账号</a></div>
	                    </c:if>
	                   <c:if test="${i.state ==1}">
	                    <div class="button-group"><a class="button border-main" href="${pageContext.request.contextPath }/UserServlet?method=forbidUser&id=${i.id}"><span
	                            class="icon-edit"></span>禁用账号</a></div>
	                    </c:if>
	                </td>
	            </tr>
			</c:forEach>
            <tr>
                <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox"
                                                                                      id="checkall"/>
                    全选
                </td>
                <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)"
                                                                              class="button border-red icon-trash-o"
                                                                              style="padding:5px 15px;"
                                                                              onclick="DelSelect()"> 删除</a></td>
            </tr>
            <tr>
                <td colspan="8">
                    <div class="pagelist"><a href="${pageContext.request.contextPath}/UserServlet?method=userList&currPage=${pageBean.currentPage-1}">上一页</a> <span class="current">1</span><a href="">2</a><a
                            href="">3</a><a href="${pageContext.request.contextPath}/UserServlet?method=userList&currPage=${pageBean.currentPage+1}">下一页</a><a href="">尾页</a></div>
                </td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">

    //搜索
    function changesearch() {

    }

    //全选
    $("#checkall").click(function () {
        $("input[name='id[]']").each(function () {
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    //批量删除
    function DelSelect() {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var t = confirm("您确认要删除选中的内容吗？");
            if (t == false) return false;
            $("#listform").submit();
        }
        else {
            alert("请选择您要删除的内容!");
            return false;
        }
    }

    //批量排序
    function sorts() {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        }
        else {
            alert("请选择要操作的内容!");
            return false;
        }
    }


    //批量首页显示
    function changeishome(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        }
        else {
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量推荐
    function changeisvouch(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {


            $("#listform").submit();
        }
        else {
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量置顶
    function changeistop(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        }
        else {
            alert("请选择要操作的内容!");

            return false;
        }
    }


    //批量移动
    function changecate(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        }
        else {
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量复制
    function changecopy(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var i = 0;
            $("input[name='id[]']").each(function () {
                if (this.checked == true) {
                    i++;
                }
            });
            if (i > 1) {
                alert("只能选择一条信息!");
                $(o).find("option:first").prop("selected", "selected");
            } else {

                $("#listform").submit();
            }
        }
        else {
            alert("请选择要复制的内容!");
            $(o).find("option:first").prop("selected", "selected");
            return false;
        }
    }

</script>
</body>
</html>