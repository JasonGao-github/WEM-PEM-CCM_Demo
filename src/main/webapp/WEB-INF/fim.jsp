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
<link rel="stylesheet" href="<%=path%>static/css/FIM.css" />
</head>

<body ng-app="main_app" id="main" ng-controller="controller"
	ng-init="get_fim()">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content d-flex flex-column">
				<h2>FIM Input</h2>
				<form class="form container" name="newUser" action="" method="POST"
					style="justify-content: center">

					<div class="basic">

						<div class="row">
							<h4 class="col-6"></h4>
							<h4 class="col-3">General</h4>
							<h4 class="col-1"></h4>
							<h4 class="col-1"></h4>
							<h4 class="col-1"></h4>
						</div>

						<div class="row">
							<h4 class="col-1">Item</h4>
							<h4 class="col-2">Description</h4>
							<h4 class="col-3">Quantity</h4>
							<h4 class="col-1">Currency</h4>
							<h4 class="col-2">Unit Cost</h4>
							<h4 class="col-3">Subtotal</h4>
						</div>

						<div class="row">
							<h4 class="col-1"></h4>
							<h4 class="col-2"></h4>
							<h4 class="col-1">Actuals</h4>
							<h4 class="col-1">JEN Funded</h4>
							<h4 class="col-1">LCTA</h4>
							<h4 class="col-1"></h4>
							<h4 class="col-2">Cost</h4>
							<h4 class="col-1">Actuals</h4>
							<h4 class="col-1">JEN Funded</h4>
							<h4 class="col-1">LCTA</h4>
						</div>

					</div>

					<div ng-repeat="fim_type in fim_types">
						<div class="row">
							<h4 class="col-12">{{fim_type.name}}</h4>
						</div>

						<div ng-repeat="sub_type in fim_type.sub_types">
							<div class="row">
								<h4 class="col-12">{{sub_type.name}}</h4>
							</div>
							<div class="light" ng-repeat="item in sub_type.items">
								<div class="row">
									<h4 class="col-1">{{item.id}}</h4>
									<h4 class="col-2">{{item.description}}</h4>
									<input class="currency col-1" type="number"
										ng-model="item.actual"> <input
										class="currency col-1" type="number" ng-model="item.JEM">
									<input class="currency col-1" type="number"
										ng-model="item.LCTA">
									<h4 class="col-1">{{item.currency}}</h4>
									<h4 class="col-2">{{item.unitCost}}</h4>
									<input class="currency col-1" type="number"> <input
										class="currency col-1" type="number"> <input
										class="currency col-1" type="number">
								</div>
							</div>
						</div>

					</div>


				</form>
				<%
					int curr_page = 4;
				%>
				<%@ include file="common/pagesBar.jspf"%>
			</div>
		</div>
	</section>
</body>
</html>
