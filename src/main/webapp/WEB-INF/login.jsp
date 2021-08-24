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
    <link href="./css/login.css" rel="stylesheet" />
    <title>Login Page</title>
</head>
<body ng-app="main_app" id="main" ng-controller="controller">
    <div class="container">
      <div class="banner">
        <div class="logo">
          <img src="./images/jemena-logo.svg" alt="logo" />

          <div class="text">
            <p>Work Estimation Model</p>
          </div>
        </div>
      </div>
      <div class="login">
        <form class="email" name="signin" action="" method="POST">
          <div class="title">
            <h1>Welcome to Jemena WEM</h1>
            <p>Sign in your account</p>
          </div>
          <h2>Email</h2>
          <input ng-model="usename" type="text" name="username" placeholder="Enter your email" />
          <h2>Password</h2>
          <input
            ng-model="password"
            type="password"
            name="password"
            placeholder="Enter your password"
          />
          <input type="checkbox" name="remember">Remember me</input>
          <input ng-click="send_my_name()" type="submit" name="submit" value="Sign in" />
        </form>
      </div>
    </div>
</body>
</html>