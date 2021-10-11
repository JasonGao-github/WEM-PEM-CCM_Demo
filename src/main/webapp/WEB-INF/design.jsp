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
<link rel="stylesheet" href="<%=path%>static/css/CCF.css" />
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content d-flex flex-column">
				<h1 style="margin: 2vh;">Design Page</h1>
				<div class="row">
					<div class="col-12">
						<ul class="nav nav-pills"
							style="padding: 10px; border: 1px solid rgba(0,0,0,.125);border-radius: 15px;">
							<li class="nav-item">
								<a class="nav-link" href="project_page">Project Home</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="ccf_page">Customer Contribution</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="quantity_input_page">Quantity Input</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="ncc_page">Non-contestable Costs Input</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="fim_page">FIM Input</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="avoided_cost_page">Avoided Costs Input</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="financials_page">Financials</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link" href="design_page">Design</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="conHandover_page">Connection Handover</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="contract_schedule_page">Contract Schedule</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">Inputs | Projects</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#">Approvers</a>
							</li>
						</ul>
					</div>
				</div>
				<% int curr_page = 7; %>
				<%@ include file="common/pagesBar.jspf"%>
			</div>
		</div>
	</section>
</body>
</html>
