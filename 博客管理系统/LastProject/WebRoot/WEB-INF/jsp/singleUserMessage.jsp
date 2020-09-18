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

<title>My JSP 'singleUserMessage.jsp' starting page</title>

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
		$.singleUserMessage();
	});
	$.extend({
		singleUserMessage : function() {
			$.ajax({
				method : "post",
				url : "${pageContext.request.contextPath}/message/singleUserMessage.do",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					var singleUserMessageList = data.singleUserMessageList;
					var ihtml = "";
					$.each(singleUserMessageList, function(i, message) {
						ihtml += "<div class='media'>"
							+ "<div class='media-left media-top'>"
							+ "<a href='#'> <img class='media-object' src='" + message.userImageUrl + "' width='70' height='70'></a>"
							+ "</div>"
							+ "<div class='media-body'>"
							+ "<h4 class='media-heading'>"
							+ "<a href='message/getSingleMessage.do?id="+message.id+"'>" + message.userName + "</a>"
							+ "</h4>"
							+ "<h6>" + message.time + "</h6>"
							+ "<font>" + message.message + "</font>"
							+ "</div>"
							+ "</div>"
							+ "<hr>";
					});
					$("#ihtmlDiv").html(ihtml);
				}
			});
		}
	});
</script>
</head>

<body>
	<div class="jumbotron">
		<h1 id="username">Welcome!</h1>
		<p>...</p>
		<p>
			<a class="btn btn-danger btn-lg" href="user/logout.do" role="button">Logout
			</a>
		</p>
	</div>

	<div id="ihtmlDiv">
		<!-- 			<div class="media"> -->
		<!-- 				<div class="media-left media-top"> -->
		<!-- 					<a href="#"> <img class="media-object" src="images/1.jpg" -->
		<!-- 						alt="..." width="70" height="70"> -->
		<!-- 					</a> -->
		<!-- 				</div> -->
		<!-- 				<div class="media-body"> -->
		<!-- 					<h4 class="media-heading"> -->
		<!-- 						<a href="#">username</a> -->
		<!-- 					</h4> -->
		<!-- 					<font>你好，我是张浩晗</font> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
	</div>

</body>
</html>
