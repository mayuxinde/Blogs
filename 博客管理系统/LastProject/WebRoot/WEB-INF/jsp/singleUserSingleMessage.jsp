<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'singleUserSingleMessage.jsp' starting page</title>

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
		$.checkUserMode();
		var replyMessageId = $("#replyMessageId").val();
		$.showReplyMessage(replyMessageId);
		$("#tijiao").click(function() {
			$.showReplyMessage(replyMessageId);
		});
	});
	// 	$.extend({
	// 		singleMessage : function() {
	// 			$.ajax({
	// 				method : "post",
	// 				url : "${pageContext.request.contextPath}/message/singleUserSingleMessage.do",
	// 				dataType : "json",
	// 				contentType : "application/json;charset=utf-8",
	// 				success : function(data) {
	// 					var singleMessageList = data.singleMessageList;
	// 					var ihtml = "";
	// 					$.each(singleMessageList, function(i, message) {
	// 						ihtml += "<div class='media'>"
	// 							+ "<div class='media-left media-top'>"
	// 							+ "<a href='#'> <img class='media-object' src='" + message.userImageUrl + "' width='70' height='70'></a>"
	// 							+ "</div>"
	// 							+ "<div class='media-body'>"
	// 							+ "<h4 class='media-heading'>"
	// 							+ "<a href='message/singleUser.do?userId=" + message.userId + "'>" + message.userName + "</a>"
	// 							+ "</h4>"
	// 							+ "<h6>" + message.time + "</h6>"
	// 							+ "<font>" + message.message + "</font>"
	// 							+ "</div>"
	// 							+ "</div>"
	// 							+ "<hr>";
	// 						$("#replyMessageId").val(message.id);
	// 						$("#replyUserId").val(message.userId);
	// 						$("#replyUserName").val(message.userName);
	// 					});
	// 					$("#ihtmlDiv").html(ihtml);
	// 				}
	// 			});
	// 		}
	// 	});
	$.extend({
		showReplyMessage : function(replyMessageId) {
			var replyMessage = {
				"replyMessageId" : replyMessageId
			};
			$.ajax({
				method : "post",
				data : JSON.stringify(replyMessage),
				url : "${pageContext.request.contextPath}/replyMessage/showReplyMessage.do",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					var replyMessageList = data.replyMessageList;
					var ihtml = "";
					$.each(replyMessageList, function(i, message) {
						ihtml += "<div class='media'>"
							+ "<div class='media-left media-top'>"
							+ "<a href='#'> <img class='media-object' src='" + message.userImageUrl + "' width='70' height='70'></a>"
							+ "<a class='deletea' href='replyMessage/deleteReplyMessage.do?id=" + message.id + "'>删除</a>"
							+ "</div>"
							+ "<div class='media-body'>"
							+ "<h4 class='media-heading'>"
							+ "<a href='message/singleUser.do?userId=" + message.userId + "'>" + message.userName + "</a>"
							+ "</h4>"
							+ "<h6>" + message.time + "</h6>"
							+ "<font>" + message.message + "</font>"
							+ "</div>"
							+ "</div>"
							+ "<hr>";
					});
					$("#ihtmlDiv2").html(ihtml);
					$.checkUserMode();
				}
			});
		}
	});
	$.extend({
		checkUserMode : function() {
			$.ajax({
				method : "post",
				url : "${pageContext.request.contextPath}/user/checkUserMode.do",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					var userMode = data.userMode;
					if ("普通用户" == userMode) {
						$("#tijiao").hide();
					}
				}
			});
		}
	});
	$.extend({
		checkUserMode : function() {
			$.ajax({
				method : "post",
				url : "${pageContext.request.contextPath}/user/checkUserMode.do",
				dataType : "json",
				contentType : "application/json;charset=utf-8",
				success : function(data) {
					var userMode = data.userMode;
					if ("普通用户" == userMode) {
						$("#tijiao").hide();
						var as = $(".deletea");
						$.each(as, function(i, aa) {
							$(this).hide();
						});
					}
					if ("注册用户" == userMode) {
						var as = $(".deletea");
						$.each(as, function(i, aa) {
							$(this).hide();
						});
					}
				}
			});
		}
	});
</script>
</head>

<body>
	<%
		Object count = application.getAttribute("count");
		if (count == null) {
			application.setAttribute("count", new Integer(1));
		} else {
			Integer i = (Integer) count;
			application.setAttribute("count", i.intValue() + 1);
		}
		Integer icount = (Integer) application.getAttribute("count");
	%>
	<center>
		<div class="page-header">
			<h1>
				本话题浏览次数 <small><font id="viewCount" color="gray"></font>${count}次</small>
			</h1>
		</div>
	</center>
	<c:forEach items="${singleMessageList }" var="message">
		<div id="ihtmlDiv">
			<div class="media">
				<div class="media-left media-top">
					<a href="#"> <img class="media-object"
						src="../../images/2.png"  width="70" height="70">
					</a>
				</div>
				<div class="media-body">
					<h4 class="media-heading">
						<a href="message/singleUser.do?userId=${message.userId}">${message.userName}</a>
					</h4>
					<h6>${message.time}</h6>
					<font>${message.message}</font>
				</div>
			</div>
		</div>

		<center>
			<form id="form1" name="form1" action="replyMessage/reply.do"
				method="post">
				<input type="hidden" id="replyMessageId" name="replyMessageId"
					value="${message.id}"> <input type="hidden"
					id="replyUserId" name="replyUserId" value="${message.userId}">
				<input type="hidden" id="replyUserName" name="replyUserName"
					value="${message.userName}">
				<textarea id="textarea1" name="message" class="form-control"
					rows="3" placeholder="请在此输入留言"></textarea>
				<button id="tijiao" type="submit" class="btn btn-default">回复</button>
			</form>
			<hr>
		</center>
	</c:forEach>
	<div id="ihtmlDiv2"></div>
</body>
</html>
