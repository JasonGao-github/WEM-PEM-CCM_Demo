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
<%@ include file="common/meta.jspf"%>
<link rel="stylesheet" href="<%=path%>static/css/addUser.css" />
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content">
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
