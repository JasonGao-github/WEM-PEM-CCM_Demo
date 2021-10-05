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
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content">
				<h1>Project List Page</h1>

				<nav>
					<div class="search_wrap search_wrap_1">
						<div class="search_box">
							<input type="text" class="input" placeholder="search...">
							<div class="btn btn_common">
								<i class='bx bx-search'></i>
							</div>
						</div>
					</div>
				</nav>

				<table class="table">
					<thead>
						<tr>
							<th scope="col">Project Title</th>
							<th scope="col">User</th>
							<th scope="col">Status</th>
							<th scope="col">Date</th>
							<th scope="col">Share</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">Test</th>
							<td>Yun-Tung</td>
							<td>Working</td>
							<td>4 Oct 2021</td>
							<td><button class="share">Share</button></td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Jacob</td>
							<td>Working</td>
							<td>4 Oct 2021</td>
							<td><button class="share">Share</button></td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Jacob</td>
							<td>Working</td>
							<td>4 Oct 2021</td>
							<td><button class="share">Share</button></td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>Jacob</td>
							<td>Working</td>
							<td>4 Oct 2021</td>
							<td><button class="share">Share</button></td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>Jacob</td>
							<td>Working</td>
							<td>4 Oct 2021</td>
							<td><button class="share">Share</button></td>
						</tr>
						<tr>
							<th scope="row">6</th>
							<td>Jacob</td>
							<td>Working</td>
							<td>4 Oct 2021</td>
							<td><button class="share">Share</button></td>
						</tr>
					</tbody>
				</table>

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
