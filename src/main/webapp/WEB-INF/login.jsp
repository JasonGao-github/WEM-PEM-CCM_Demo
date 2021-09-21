<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link href='https://fonts.googleapis.com/css?family=Abhaya Libre'
	rel='stylesheet'>

<!-- bootstrap-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>


<script src="<%=path%>static/angular/angular.js" /></script>
<script src="<%=path%>static/angular/angular-route.js" /></script>
<script src="<%=path%>static/angular/angular-touch.js" /></script>
<script src="<%=path%>static/main_angular.js" /></script>
<link href="<%=path%>static/css/login.css" rel="stylesheet" />
<title>Login Page</title>
</head>
<body ng-app="main_app" id="main" ng-controller="controller">
	<div class="login-container container-fluid">
		<div class="banner">
			<div class="logo">
				<img src="<%=path%>static/images/jemena-logo.svg" alt="logo" style="width: 100%;"/>

				<div class="text">
					<p>Work Estimation Model</p>
				</div>
			</div>
		</div>

		<div class="login">
			<form class="email" name="signin" action="" method="POST">
				<div class="title">
					<h1>{{welcome}}</h1>
					<p>Sign in your account</p>
				</div>
				<h2>Email</h2>
				<input ng-model="email" type="text" name="email"
					placeholder="Enter your email" />
				<h2>Password</h2>
				<input ng-model="password" type="password" name="password"
					placeholder="Enter your password" /> <input type="checkbox"
					name="remember">Remember me</input>

				<h2 id="failMsg" style="visibility: hidden; color: red">Invalid
					email or password.</h2>
				<input ng-click="send_my_name()" type="button" name="submit"
					value="Sign in" />
			</form>
		</div>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalLong" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLongTitle"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Login Fail</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Invalid email or password.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>