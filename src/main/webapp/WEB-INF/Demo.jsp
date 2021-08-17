<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%
	String path = request.getContextPath(); 
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DemoPage</title>

    <script src="<%=path%>static/angular/angular.js" /></script>
    <script src="<%=path%>static/angular/angular-route.js" /></script>
    <script src="<%=path%>static/angular/angular-touch.js" /></script>
    <script src="<%=path%>static/main_angular.js" /></script>
</head>
<body ng-app="main_app" id="main" ng-controller="controller">
<p>Jemena Home Page</p>

<div class="row">
	<h1>{{jsp_test}}</h1>
	<input ng-model="name" type="text" name="surname"/>
	<button ng-click="send_my_name()">Send my name</button>
</div>
	<%
	String username = (String) request.getAttribute("username");
	if (null == username) {
		username = "";
	}
	%>
	<form action="demoAction" method="post">
		<table border="0" align="center">

			<tr>
				<td align="right">userId:</td>
				<td><input type="text" name="userId" /></td>
			</tr>

			<tr>
				<td colspan="2" style="width: 100px; height: 50px;"><span
					id="msg"> </span> <input type="submit" value="login"
					style="width: 100px" /></td>
			</tr>
		</table>

		the user from db is :
		<%=username%>
		<%=basePath%>
		<%=path%>
		
	</form>

</body>
</html>