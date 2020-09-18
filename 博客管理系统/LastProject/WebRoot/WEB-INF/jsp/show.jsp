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

<title>My JSP 'show.jsp' starting page</title>

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
<script language="javascript">
	function checkForm() {
		var a = document.form1.textarea1;
		if (a.value.length > 50) {
			alert("输入的备注框长度不能超过50个字符!");
			return false;
		} else {
			return true;
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var form = document.getElementById("form1");
		$.showMessage();

		$("#tijiao").click(function() {
			var a = document.getElementById("textarea1").value;
			if (a.length > 50) {
				alert("输入的备注框长度不能超过50个字符!");
			} else {
				form.submit();
				$.showMessage();
			}
		});
	});
	// 	$.extend({
	// 		showMessage : function() {
	// 			$.ajax({
	// 				method : "post",
	// 				url : "${pageContext.request.contextPath}/message/messageList.do",
	// 				dataType : "json",
	// 				contentType : "application/json;charset=utf-8",
	// 				success : function(data) {
	// 					var messageList = data.messageList;
	// 					var ihtml = "";
	// 					$.each(messageList, function(i, message) {
	// 						ihtml += "<div class='media'>"
	// 							+ "<div class='media-left media-top'>"
	// 							+ "<a href='#'> <img class='media-object' src='" + message.userImageUrl + "' width='70' height='70'></a>"
	// 							+ "<a class='deletea' href='message/deleteMessage.do?id=" + message.id + "'>删除</a>"
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
	// 					});
	// 					$("#ihtmlDiv").html(ihtml);
	// 					$.checkUserMode();
	// 				}
	// 			});
	// 		}
	// 	});
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
	$.extend({ //定义方法
		showMessage : function(currentPage) { //方法名showGoods 形参currentPage，根据当前页显示物品
			var data1 = {
				"currentPage" : currentPage
			}; //取controller中的page参数中的currentPage
			$.ajax({
				method : "post", //请求方式
				data : JSON.stringify(data1), //把字符串转成json对象
				url : "${pageContext.request.contextPath}/message/messageList.do", //地址
				dataType : "json", //传参类型
				contentType : "application/json;charset=utf-8", //作用域，编码集
				success : function(data) { //如果运行成功执行的代码
					var totalPageCount = data.page.totalPageCount; //定义变量接收controller返回的responseMap中键为page的值的totalPageCount属性值
					var currentPage = data.page.currentPage;
					var messageList = data.messageList;
					var pageStr = "";
					var ihtml = "";
					var cp = data.page.currentPage;
					for (j = 1; j <= totalPageCount; j++) { //循环所有页码
						if (cp == j) { //如果当前页已选就禁止点击当前页页码
							pageStr += "<li><a class='page' id='aaa' href='#' style='color:red;font-weight:bold'>" + j + "</a></li>";
						} else { //否则正常可以点击
							pageStr += "<li><a class='page' href='#'>" + j + "</a></li>";
						}
					}
					$("#page1").html(pageStr); //将页码加到页面上
					$.each(messageList, function(i, message) { //循环从controller传来的数据集合并显示属性
						ihtml += "<div class='media'>"
							+ "<div class='media-left media-top'>"
							+ "<a class='deletea'><image src='/LastProject/WebRoot/images/1.jpg'/></a>"
							+ "<a class='deletea' href='message/deleteMessage.do?id=" + message.id + "'>删除</a>"
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
					$("#ihtmlDiv").html(ihtml);
					$.showPage();
					$.checkUserMode();
				}
			});
		}
	});
	$.extend({ //定义方法
		showPage : function() {
			var as = $(".page"); //去class属性等于page的那些在页面上的页码超链接，取到的是一个集合
			$.each(as, function(i, aa) { //遍历这个取到的页码集合，从0开始
				$(this).click(function() { //如果这个页码被点击了，那么就给showGoods（currentPage）方法传值，因为从开始所以要+1
					$.showMessage(i + 1);
					return false;
				});
			});
		}
	});
</script>
</head>

<body>
	<center>
		<div class="jumbotron">
			<h1>
				<font id="showName">欢迎${loginUserName}</font>
			</h1>

			
			<p>
				<a class="btn btn-danger btn-lg" href="user/logout.do" role="button">Logout
				</a>
			</p>
		</div>
		<form id="form1" name="form1" action="message/add.do" method="post">
			<textarea id="textarea1" name="message" class="form-control" rows="3"
				placeholder="请在此输入留言"></textarea>
			<button id="tijiao" type="button" class="btn btn-default">留言</button>
		</form>
		<p class="help-block bg-primary">Your message will be show under
			the line.</p>
		<div id="ihtmlDiv"></div>
		<nav aria-label="Page navigation">
		<ul class="pagination" id="page1">
		</ul>
		</nav>
	</center>
</body>
</html>
