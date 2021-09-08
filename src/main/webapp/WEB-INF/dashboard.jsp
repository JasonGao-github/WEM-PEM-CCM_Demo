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
				<h1>Dashboard Page</h1>
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
