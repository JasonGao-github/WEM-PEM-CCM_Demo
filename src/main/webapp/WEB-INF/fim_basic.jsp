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
	ng-init="get_fim()">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content">
				<h2>FIM Basic Data Page</h2>
				<form class="form container" name="newFim" action="" method="POST"
					style="justify-content: center">

					<div class="row">
						<h3>Type</h3>
						<select id="position" ng-model="fim_type"
							ng-change="basic_change_fim_type()">
							<option ng-repeat="ft in fim_types" value="{{ft.id}}">{{ft.name}}</option>
						</select>
					</div>

					<div class="row">
						<h3>Subtype</h3>
						<select id="position" ng-model="selected_sub_type">
							<option ng-repeat="type in sub_types" value="{{type.id}}">{{type.name}}</option>
						</select>
					</div>

					<div class="row">
						<h3>Description</h3>
						<Input type="text" ng-model="description">
					</div>
					<div class="row">
						<h3>Currency</h3>
						<Input type="text" ng-model="currency"> <br>
					</div>
					<div class="row">
						<h3>unitCost</h3>
						<Input type="number" ng-model="unitCost"> <br>
					</div>

					<a data-toggle="modal" data-target="#exampleModalCenter">
						<button type="button" class="btn btn-primary"
							ng-click="fim_basic_submit()">submit</button>
					</a>

				</form>

				<!-- Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">FIM
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
