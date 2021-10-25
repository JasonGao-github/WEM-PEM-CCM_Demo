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
	ng-init="ncc_get_all_basic()">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content">
			
				<h1 style="margin: 2vh;">Non-Contestable Cost - Basic Data</h1>
				<div class="row">
					<div class="col-xl-12 col-lg-12">
						<div class="card shadow mt-5 mb-4">
							<!-- Card Header - Dropdown -->
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">Non-Contestable Cost - Add
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
												<label for="ncc_type">Type</label> 
												<select id="ncc_type" ng-model="ncc_type" class="form-control">
													<option value="pc">Project Component</option>
													<option ng-repeat="type in ncc_otherTypes" value="{{type.id}}">{{type.name}}</option>
												</select>
											</div>
										</div>
										<div class="col">
											<div class="form-group">
												<label for="selected_type">Project Type</label> 
												<select id="selected_type" ng-model="selected_type" class="form-control">
													<option ng-repeat="type in project_types" value="{{type.id}}">{{type.name}}</option>
												</select>
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="description">Description</label>
												<Input id="description" type="text" ng-model="description" class="form-control">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="unit">Unit</label>
												<Input id="unit" type="text" ng-model="unit" class="form-control">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="rate">Rate</label>
												<Input id="rate" type="number" ng-model="rate" class="form-control">
											</div>
										</div>
									</div>

									<a data-toggle="modal" data-target="#exampleModalCenter">
										<button type="button" class="btn btn-primary"
											ng-click="add_ncc_basic()">submit</button>
									</a>

								</form>
							</div>
							
							<!-- Card Body -->
							<div class="card-body">
								<div class="table-responsive">
									<table
										class="table table-striped table-light table-bordered table-hover dom-jQuery-events"
										style="text-align: center; margin: 0">
										<thead class="thead-light">
											<tr>
												<th>Description</th>
												<th>Unit</th>
												<th>Rate</th>
												<th>Remove</th>
											</tr>
										</thead>
										<tbody ng-repeat="proj_type in project_types">
											<tr>
												<td colspan="4">{{proj_type.name}}</td>
											</tr>
											<tr ng-repeat="item in proj_type.items">
												<td>{{item.description}}</td>
												<td>Hour</td>
												<td>{{item.cost | number : 2}}</td>
												<td>
													<button type="button" class="btn btn-danger"
														ng-click="ncc_remove_basic_pc(item.id)">Remove</button>
												</td>
											</tr>
										</tbody>
										<tbody ng-repeat="other_type in ncc_otherTypes">
											<tr>
												<td colspan="4">{{other_type.name}}</td>
											</tr>
											<tr ng-repeat="item in other_type.items">
												<td>{{item.description}}</td>
												<td>Hour</td>
												<td>{{item.rate | number : 2}}</td>
												<td>
													<button type="button" class="btn btn-danger"
														ng-click="ncc_remove_basic_other(item.id)">Remove</button>
												</td>
											</tr>
										</tbody>
									</table>
									</table>
								</div>

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
</body>
</html>
