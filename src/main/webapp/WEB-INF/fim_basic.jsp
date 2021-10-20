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
<link rel="stylesheet" href="<%=path%>static/css/addUser.css" />
</head>

<body ng-app="main_app" id="main" ng-controller="controller"
	ng-init="get_fim()">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content">
				<h1 style="margin: 2vh;">FIM - Basic Data</h1>
				<div class="row">
					<div class="col-xl-12 col-lg-12">
						<div class="card shadow mt-5 mb-4">
							<!-- Card Header - Dropdown -->
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">FIM - Add
									Basic Data</h6>
								<div class="dropdown no-arrow">
									<a class="dropdown-toggle" href="#" role="button"
										id="dropdownMenuLink" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> <i
										class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
									</a>
								</div>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<form class="form container" name="newFim" action=""
									method="POST" style="justify-content: center">
									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="fim_type">Type </label> 
												<select id="fim_type" ng-model="fim_type" ng-change="basic_change_fim_type()" class="form-control">
													<option ng-repeat="ft in fim_types" value="{{ft.id}}">{{ft.name}}</option>
												</select>
											</div>
										</div>
										<div class="col">
											<div class="form-group">
												<label for="selected_sub_type">Subtype</label> 
												<select id="position" ng-model="selected_sub_type" class="form-control">
													<option ng-repeat="type in sub_types" value="{{type.id}}">{{type.name}}</option>
												</select>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="description">Description</label> 
												<Input type="text" ng-model="description" id="description" class="form-control">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="currency">Currency</label> 
												<Input type="text" ng-model="currency" id="currency" class="form-control">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="unitCost">UnitCost</label> 
												<Input type="text" ng-model="unitCost" id="unitCost" class="form-control">
											</div>
										</div>
									</div>

									<a data-toggle="modal" data-target="#exampleModalCenter">
										<button type="button" class="btn btn-primary"
											ng-click="fim_basic_submit()">submit</button>
									</a>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">FIM Basic
						Data</h5>
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
</body>
</html>
