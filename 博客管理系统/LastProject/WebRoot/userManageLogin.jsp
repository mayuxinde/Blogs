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

<title>My JSP 'userManageLogin.jsp' starting page</title>

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
	// 	function lastCheck() {
	// 		var isEmailFlag = isEmail();
	// 		var isKeyFlag = isKey();
	// 		if (isEmailFlag & isKeyFlag) {
	// 			return true;
	// 		} else {
	// 			return false;
	// 		}
	// 	}
	function isEmail() {
		var email = document.getElementById("email1").value;
		var reg = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
		if (email.length == 0) {
			document.getElementById("messageEmail").innerText = "邮箱不能为空";
		} else if (reg.test(email)) {
			document.getElementById("messageEmail").innerText = "";
			return true;
		} else {
			document.getElementById("messageEmail").innerText = "邮箱格式不正确";
			return false;
		}

	}
	function isKey() {
		var key = document.getElementById("password1").value;
		if (key.length == 0) {
			document.getElementById("messagePassword").innerText = "密码不能为空";
			return false;
		} else if (key.length < 6) {
			document.getElementById("messagePassword").innerText = "密码必须6-20个字符";
			return false;
		} else if (key.length > 20) {
			document.getElementById("messagePassword").innerText = "密码必须6-20个字符";
			return false;
		} else {
			document.getElementById("messagePassword").innerText = "";
			return true;
		}
	}
</script>
<script type="text/javascript">
	var userMode = "";
	$(document).ready(function() {
		var form = document.getElementById("form1");
		$("#email1").blur(function() {
			var email = $("#email1").val();
			$.checkUserModeByEmail(email);
		});
		$("#tijiao").click(function() {
			if (isEmail() & isKey()) {
				if ("管理员" == userMode) {
					form.submit();
				} else {
					alert("你不是管理员不能进入用户管理页面");
				}
			}
		});
	});
	$.extend({
		checkUserModeByEmail : function(email) {
			var e = {
				"email" : email
			};
			$.ajax({
				method : "post",
				data : JSON.stringify(e),
				url : "${pageContext.request.contextPath}/user/checkUserModeByEmail.do",
				dataType : "JSON",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					var mode = data.userMode;
					userMode = mode;
				}
			});
		}
	});
</script>
</head>
<body>

	<center>
		<div class="jumbotron">
			<h1>用户管理登录</h1>
			<p>...</p>
			<p>
				<a class="btn btn-primary btn-lg" href="register.jsp" role="button">To
					Register </a>
			</p>
		</div>
		<font color="red">${userManageLoginError}</font>
		<form id="form1" class="form-inline" action="user/userManageLogin.do"
			method="post">
			<button type="button" class="btn btn-default btn-primary">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>

			</button>
			<div class="form-group">
				<label class="sr-only" for="exampleInputEmail3">Email
					address</label> <input type="email" class="form-control" id="email1"
					placeholder="Email" name="email" onblur="isEmail()"><font
					id="messageEmail" color="red"></font>
			</div>
			<br> <br> <br>
			<button type="button" class="btn btn-default btn-primary">
				<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>

			</button>
			<div class="form-group">

				<label class="sr-only" for="exampleInputPassword3">Password</label>
				<input type="password" class="form-control" id="password1"
					placeholder="Password" onblur="isKey()" name="password"><font
					id="messagePassword" color="red"></font>
			</div>
			<br>
			<!-- 			<div class="checkbox"> -->
			<!-- 				<label> <input type="checkbox"> Remember me -->
			<!-- 				</label> -->
			<!-- 			</div> -->
			<br> <br> <br>
			<button id="tijiao" type="button" class="btn btn-default">login</button>
		</form>
	</center>

</body>
</html>
