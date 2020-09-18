<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<%-- <base href="<%=basePath%>"> --%>

<title>My JSP 'index.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- <link rel="stylesheet" type="text/css" href="styles.css"> -->
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript">
	function isName() {
		var name = document.getElementById("name1").value;
		if (name.length == 0) {
			document.getElementById("messageName").innerText = "用户名不能为空";
			return false;
		} else if (name.length < 3) {
			document.getElementById("messageName").innerText = "用户名必须3-6个字符";
			return false;
		} else if (name.length > 10) {
			document.getElementById("messageName").innerText = "用户名必须3-6个字符";
			return false;
		} else {
			document.getElementById("messageName").innerText = "";
			return true;
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
	function isFile() {
		var file = document.getElementById("file").value;
		if (file.length == 0) {
			return false;
		} else {
			return true;
		}
	}
</script>
<script type="text/javascript">
	var flag = "";
	$(document).ready(function() {
		var form = document.getElementById("form1");
		$("#email1").blur(function() {
			var email = $("#email1").val();
			$.checkEmail(email);
		});

		$("#btn1").click(function() {
			if (isName() & isKey() & isFile()) {
				if ("ok" == flag) {
					form.submit();
				}
			}
		});
	});
	$.extend({
		checkEmail : function(email) {
			var e = {
				"email" : email
			};
			$.ajax({
				method : "post",
				data : JSON.stringify(e),
				url : "${pageContext.request.contextPath}/user/checkEmail.do",
				dataType : "JSON",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					var checkEmail = data.checkEmail;
					var inputEmail = $("#email1").val();
					if (inputEmail.length == 0) {
						$("#messageEmail").text("邮箱不能为空");
					} else {
						var reg = /^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g;
						if (!(reg.test(inputEmail))) {
							$("#messageEmail").text("邮箱格式不正确");
						} else {
							if ("success" == checkEmail) {
								$("#messageEmail").text("邮箱可用");
								flag = "ok";
							} else {
								$("#messageEmail").text("邮箱已存在");
							}
						}
					}
				}
			});
		}
	});
</script>
</head>

<body>
	<center>
		<div class="jumbotron">
			<h1>用户注册界面！</h1>
			<p>...</p>
			<p>
				<a class="btn btn-primary btn-lg" href="login.jsp" role="button">To
					Login </a>
			</p>
		</div>
		<form id="form1" action="user/add.do" method="post" name="form1"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="exampleInputEmail1">User Name</label> <br> <input
					type="text" class="form-control" id="name1" placeholder="Name"
					name="username" onblur="isName()"><font id="messageName"
					color="red"></font>
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label> <br> <input
					type="text" class="form-control" id="email1" placeholder="Email"
					name="email"><font id="messageEmail" color="red"></font>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label> <br> <input
					type="password" class="form-control" id="password1"
					placeholder="Password" name="password" onblur="isKey()"> <font
					id="messagePassword" color="red"></font>
			</div>
			<div class="form-group">
				<label for="exampleInputFile">File input</label> <br> <input
					type="file" id="file" name="img">
				<div class="radio">
					<label> <input type="radio" name="usermode"
						id="optionsRadios1" value="普通用户" checked> 普通用户
					</label> <label> <input type="radio" name="usermode"
						id="optionsRadios2" value="注册用户"> 注册用户
					</label> <label> <input type="radio" name="usermode"
						id="optionsRadios3" value="管理员"> 管理员
					</label>
					<p class="help-block bg-primary">Please affirm your
						information,then click the button of submit.</p>
				</div>
			</div>
			<button id="btn1" type="button" class="btn btn-default">Register</button>
		</form>

	</center>
</body>
</html>
