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
<link href="<%=path%>static/css/createProject.css" rel="stylesheet" />
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
				<div class="container-fluid contentWrapper">
			<div class="container content">
				<div class="row" style="text-align: center; padding: 30vh 0 0;">
            <div class="col-6">
              <button class="Rectangle-107">PP</button>
            </div>
            <div class="col-6">
              <button class="Rectangle-108">New or Existing Connection</button>
            </div>
          </div>

          <div class="row" style="text-align: center; padding: 3vh 0 0;">
            <div class="col-6">
              <span class="Pole-to-Pit">
                Pole to Pit
              </span>
            </div>
            <div class="col-6">
              <span class="New-or-Existing-Connection">
                New or Existing
                Connection
              </span>
            </div>
          </div>
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
