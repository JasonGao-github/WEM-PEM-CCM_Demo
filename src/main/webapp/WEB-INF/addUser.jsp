<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%
//String s = (String) request.getSession().getAttribute("username");
// String s1 = (String) session.getAttribute("username");
%>

<!DOCTYPE html>

<head>
<meta charset="UTF-8" />

<link rel="stylesheet" href="<%=path%>static/css/addUser.css" />
<link rel="stylesheet" href="<%=path%>static/css/sideBar.css" />
<!-- Boxicons CDN Link -->
<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<meta charset="UTF-8">
<!--<title> Responsive Sidebar Menu  </title>-->
<!-- Boxicons CDN Link -->
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Add User Page</title>
<link href='https://fonts.googleapis.com/css?family=Abhaya Libre'
	rel='stylesheet'>

<script src="<%=path%>static/angular/angular.js" /></script>
<script src="<%=path%>static/angular/angular-route.js" /></script>
<script src="<%=path%>static/angular/angular-touch.js" /></script>
<script src="<%=path%>static/main_angular.js" /></script>

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

</head>

<body ng-app="main_app" id="main" ng-controller="controller">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid newUserFormWrapper">
			<div class="container newUserForm">
				<h1 style="margin: 5vh;">Add new user</h1>
				<form class="newUser container" name="newUser" action=""
					method="POST" style="justify-content: center">

					<div class="row">
						<div class="col-md">
							<h2>First Name</h2>
							<input ng-model="fname" type="text" name="fname"
								placeholder="Enter first name" />
						</div>
						<div class="col-md">
							<h2>Last Name</h2>
							<input ng-model="lname" type="text" name="lname"
								placeholder="Enter last name" />
						</div>
					</div>
					<div class="row">
						<div class="col-" style="padding: 0 15px; width: 100%;">
							<h2>Email Address</h2>
							<input ng-model="email" type="email" name="email"
								placeholder="Enter email address" />
						</div>
					</div>
					<div class="row">
						<div class="col-md">
							<h2>Job Position</h2>
							<select id="position" placeholder="Select position">
								<option value="" selected disabled hidden>Select
									position</option>
								<option value="estimator">Estimator</option>
								<option value="pManager">Project Manager</option>
							</select>
						</div>
						<div class="col-md">
							<h2>Phone</h2>
							<input ng-model="fname" type="number" name="fname"
								placeholder="Enter phone" />
						</div>
					</div>
					<div class="row">
						<input ng-click="save" type="btn" name="save" value="save" /><input
							ng-click="cancel" type="btn" name="cancel" value="cancel" />
					</div>

				</form>
			</div>
		</div>
	</section>
	<script>
      let sidebar = document.querySelector(".sidebar");
      let closeBtn = document.querySelector("#btn");

      closeBtn.addEventListener("click", () => {
        sidebar.classList.toggle("open");
        menuBtnChange();
      });

      function menuBtnChange() {
        if (sidebar.classList.contains("open")) {
          closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
          document.getElementById("Jem-logo").style.visibility = "visible";
        } else {
          closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");
          document.getElementById("Jem-logo").style.visibility = "hidden";
        }
      }
    </script>
</body>
</html>
