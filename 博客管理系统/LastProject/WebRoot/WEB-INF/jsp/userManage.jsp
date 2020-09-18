<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'userManage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.showUser();
	});
	$.extend({
		showUser : function() {
			$.ajax({
				method : "post",
				url : "${pageContext.request.contextPath}/user/showUser.do",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					var userList = data.userList;
					var ihtml = "<tr><td>序号</td><td>username</td>"
						+ "<td>密码</td>"
						+ "<td>头像</td>"
						+ "<td>权限</td>"
						+ "<td>邮箱</td>"
						+ "<td>操作</td></tr>";
					$.each(userList, function(i, user) {
						ihtml += "<tr><td>" + (i + 1) + "</td>"
							+ "<td>" + user.username + "</td>"
							+ "<td>" + user.password + "</td>"
							+ "<td>" + user.imageurl + "</td>"
							+ "<td>" + user.usermode + "</td>"
							+ "<td>" + user.email + "</td>"
							+ "<td><a href='user/deleteUser.do?id=" + user.id + "'><button type='button' class='btn btn-danger'>删除</button></a></td></tr>";
					});
					$("#userTable").html(ihtml);
				}
			});
		}
	});
</script>
</head>

<body>
	<center>
		<div class="jumbotron">
			<h1>
				<font id="showName" color="gray">用户管理页面</font>
			</h1>

			<p>
			<h2>
				<font>${loginUserName}</font>
			</h2>





			<img alt="" src="${imageUrl}" width="70" height="70" />
			</p>
			<p>
				<a class="btn btn-danger btn-lg" href="user/logout.do" role="button">Logout
				</a>
			</p>
		</div>

	</center>
	<table id="userTable" class="table table-bordered">
	</table>
</body>
</html>
