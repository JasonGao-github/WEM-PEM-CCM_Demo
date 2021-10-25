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
<link rel="stylesheet"
	href="<%=path%>static/css/addBasicData_AvoidedCost.css" />
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content">
				<h1 style="margin: 2vh;">Avoided Cost -Basic Data</h1>
				<div class="row">
					<div class="col-xl-12 col-lg-12">
						<div class="card shadow mt-5 mb-4">
							<!-- Card Header - Dropdown -->
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">Avoided Cost
									- Add Basic Data</h6>
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
												<label for="asset">Asset</label> <input type="text"
													ng-model="asset" id="asset" class="form-control">
											</div>
										</div>
										<div class="col">
											<div class="form-group">
												<label for="life">Asset Life</label> <input type="number"
													ng-model="life" id="life" class="form-control">
											</div>
										</div>
									</div>


									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="life">Units</label> <input type="text"
													ng-model="unit" id="unit" class="form-control">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="life">New Asset Cost</label> <input
													type="number" ng-model="new_asset_cost" id="new_asset_cost"
													class="form-control">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="life">Maintenance Cost</label> <input
													type="number" ng-model="main_cost" id="main_cost"
													class="form-control">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col">
											<div class="form-group">
												<label for="life">Vegetation Management Cost</label> <input
													type="number" ng-model="veg_cost" id="veg_cost"
													class="form-control">
											</div>
										</div>
									</div>

									<a data-toggle="modal" data-target="#exampleModalCenter">
										<button type="button" class="btn btn-primary"
											ng-click="ac_submit_basic()">submit</button>
									</a>

								</form>
							</div>

							<!-- Card Body -->
							<div class="card-body">
								<div class="table-responsive" ng-init="get_ac()">
									<table
										class="table table-striped table-light table-bordered table-hover dom-jQuery-events"
										style="text-align: center; margin: 0">
										<thead class="thead-light">
											<tr>
												<th>Asset</th>
												<th>Asset Life</th>
												<th>Units</th>
												<th>New Asset Cost</th>
												<th>Maintenance Cost</th>
												<th>Vegetation Management Cost</th>
												<th>Remove</th>
											</tr>
										</thead>
										<tbody>
											<tr ng-repeat="item in ac_items track by $index">
												<td>{{item.name}}</td>
												<td>{{item.stdLife}}</td>
												<td>{{item.unit}}</td>
												<td>{{item.unitCost | number : 2}}</td>
												<td>{{item.maintenanceCost| number : 2}}</td>
												<td>{{item.vegetationManagementCost | number : 2}}</td>
												<td>
													<button type="button" class="btn btn-danger"
														ng-click="ac_remove_basic(item.id)">Remove</button>
												</td>
											</tr>
										</tbody>
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
					<h5 class="modal-title" id="exampleModalLongTitle">NCC Basic
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
