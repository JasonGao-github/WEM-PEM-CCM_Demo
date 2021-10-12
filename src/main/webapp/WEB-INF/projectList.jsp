<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ include file="common/checkSessionExist.jspf"%>

<!DOCTYPE html>

<head>
<%@ include file="common/meta.jspf"%>
<link rel="stylesheet" href="<%=path%>static/css/viewProject.css" />
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content">
				<h3 style="margin: 1vh;">View all projects</h3>
				<nav>
					<div>
						<span class="Jemena-WBS"> Jemena WBS </span> <input class="try"
							type="text"> <span class="Jemena-WBS"> Project
							Title </span> <input class="try" type="text"> <span
							class="Jemena-WBS"> Project Type </span> <select
							class="form-select form-select-sm" aria-label=".form-select-sm ">
							<option selected></option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>
					<div>
						<span class="Jemena-WBS"> Zinfra WBS </span> <input class="try"
							type="text"> <span class="Jemena-WBS"> Inquiry
							Number </span> <input class="try" type="text"> <span
							class="Jemena-WBS"> Jemena SAP PM Order </span> <input
							class="try" type="text">
					</div>
				</nav>
				<div>
					<button class="search">Search</button>
				</div>
				<div class="test">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Inquiry Number</th>
								<th scope="col">Project Title</th>
								<th scope="col">Project Type</th>
								<th scope="col">User Created</th>
								<th scope="col">Status</th>
								<th scope="col">Jemena WBS</th>
								<th scope="col">Zinfra WBS</th>
								<th scope="col">Date</th>
								<th scope="col">Actions</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">#1</th>
								<td>Test</td>
								<td>Type A</td>
								<td>Yun</td>
								<td>Working</td>
								<td>test</td>
								<td>test</td>
								<td>4 Oct 2021</td>
								<td><button class="share">View</button></td>
							</tr>
							<tr>
								<th scope="row">#1</th>
								<td>Test</td>
								<td>Type A</td>
								<td>Yun</td>
								<td>Working</td>
								<td>test</td>
								<td>test</td>
								<td>4 Oct 2021</td>
								<td><button class="share">View</button></td>
							</tr>
							<tr>
								<th scope="row">#1</th>
								<td>Test</td>
								<td>Type A</td>
								<td>Yun</td>
								<td>Working</td>
								<td>test</td>
								<td>test</td>
								<td>4 Oct 2021</td>
								<td><button class="share">View</button></td>
							</tr>
							<tr>
								<th scope="row">#1</th>
								<td>Test</td>
								<td>Type A</td>
								<td>Yun</td>
								<td>Working</td>
								<td>test</td>
								<td>test</td>
								<td>4 Oct 2021</td>
								<td><button class="share">View</button></td>
							</tr>
							<tr>
								<th scope="row">#1</th>
								<td>Test</td>
								<td>Type A</td>
								<td>Yun</td>
								<td>Working</td>
								<td>test</td>
								<td>test</td>
								<td>4 Oct 2021</td>
								<td><button class="share">View</button></td>
							</tr>
							<tr>
								<th scope="row">#1</th>
								<td>Test</td>
								<td>Type A</td>
								<td>Yun</td>
								<td>Working</td>
								<td>test</td>
								<td>test</td>
								<td>4 Oct 2021</td>
								<td><button class="share">View</button></td>
							</tr>
						</tbody>
					</table>
				</div>


				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>








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
