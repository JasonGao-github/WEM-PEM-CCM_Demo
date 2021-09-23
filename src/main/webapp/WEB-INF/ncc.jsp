<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<%-- @  include file="common/checkSessionExist.jspf"--%>

<!DOCTYPE html>

<head>
<%@ include file="common/meta.jspf"%>
<link rel="stylesheet" href="<%=path%>static/css/NCC.css" />
</head>

<body ng-app="main_app" id="main" ng-controller="controller"
	ng-init="get_ncc()">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content d-flex flex-column">
				<h2>Non-Contestable Costs</h2>
				<form class="form container" name="newUser" action="" method="POST"
					style="justify-content: center">
					<div class="row">
						<h3>Project Type</h3>
						<select id="position" ng-change="typeChanged()"
							ng-model="selected_type">
							<option ng-repeat="type in project_types" value="{{type.id}}">{{type.name}}</option>
						</select>
					</div>
					<div class="projectComp">
						<div class="row">
							<h4 class="col-4">Project Component</h4>
							<h4 class="col-2">Unit</h4>
							<h4 class="col-2">Quantity</h4>
							<h4 class="col-2">Cost</h4>
							<h4 class="col-2">Total</h4>
						</div>
						<div class="row light" ng-repeat="comp in proj_comps">
							<h4 class="col-4">{{comp.description}}</h4>
							<h4 class="col-2">unit</h4>
							<input class="col-2" type="number" ng-model="comp.quantity" value="0">
							<h4 class="col-2">{{comp.cost}}</h4>
							<h4 class="col-2">{{comp.quantity * comp.cost}}</h4>
						</div>

					</div>


					<div class="other">
						<div class="row">
							<h4 class="col-4">Other Design Services</h4>
							<h4 class="col-2">Unit</h4>
							<h4 class="col-2">Quantity</h4>
							<h4 class="col-2">Rate</h4>
							<h4 class="col-2">Total</h4>
						</div>

						<div ng-repeat="itm in ncc_items">
							<div class="row light">
								<h4 class="col-4">{{itm.name}}</h4>
								<h4 class="col-2">{{itm.unit}}</h4>
								<input class="currency col-2" type="number"
									value="{{itm.quantity}}">
								<h4 class="col-2">{{itm.rate}}</h4>
								<h4 class="col-2">{{itm.rate * itm.quantity}}</h4>
							</div>
						</div>

					</div>

				</form>
				<%
					int curr_page = 3;
				%>
				<%@ include file="common/pagesBar.jspf"%>
			</div>
		</div>
	</section>
</body>
</html>
