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
						<a data-toggle="modal" data-target="#exampleModalCenter">
							<button class="Rectangle-108">New or Existing Connection</button>
						</a>
					</div>
				</div>

				<div class="row" style="text-align: center; padding: 3vh 0 0;">
					<div class="col-6">
						<span class="Pole-to-Pit"> Pole to Pit </span>
					</div>
					<div class="col-6">
						<span class="New-or-Existing-Connection"> New or Existing
							Connection </span>
					</div>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">New Project</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="item">
									Project Name
								</div>
								<input type="text">
								<div class="item">
									Project Details
								</div>
								<input type="text">
							</div>
							<div class="modal-footer">
							<a href="/project_page">
								<button type="button" class="btn btn-primary">Create Project</button>
							</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</section>
</body>
</html>
