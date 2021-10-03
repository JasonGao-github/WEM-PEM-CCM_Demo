<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%@  include file="common/checkSessionExist.jspf"%>

<!DOCTYPE html>

<head>
<%@ include file="common/meta.jspf"%>
<link rel="stylesheet" href="<%=path%>static/css/ncc_basic.css" />
</head>

<body ng-app="main_app" id="main" ng-controller="controller"
	ng-init="get_ncc()">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content">
				<h2>Non-Contestable Costs</h2>
				<form class="form container" name="newUser" action="" method="POST"
					style="justify-content: center">

					<div class="row">
						<h3>Type</h3>
						<select id="position" ng-model="ncc_type">
							<option value="pc">Project Component</option>
							<option ng-repeat="type in ncc_otherTypes" value="{{type.id}}">{{type.name}}</option>
						</select>
					</div>

					<div class="row">
						<h3>Project Type</h3>
						<select id="position" ng-model="selected_type">
							<option ng-repeat="type in project_types" value="{{type.id}}">{{type.name}}</option>
						</select>
					</div>

					<div class="row">
						<h3>Description</h3>
						<Input type="text" ng-model="description">
					</div>
					<div class="row">
						<h3>Unit</h3>
						<Input type="text" ng-model="unit"> <br>
					</div>
					<div class="row">
						<h3>Rate</h3>
						<Input type="number" ng-model="rate"> <br>
					</div>
					<a data-toggle="modal" data-target="#exampleModalCenter">
						<button type="button" class="btn btn-primary"
							ng-click="add_ncc_basic()">submit</button>
					</a>

				</form>

				<!-- Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">NCC
									Basic Data</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>Submit successful!</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
