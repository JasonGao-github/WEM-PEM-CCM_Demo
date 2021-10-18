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
			<div class="container content">
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
								<a class="nav-link active" href="fim_page">FIM Input</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="avoided_cost_page">Avoided Costs Input</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="financials_page">Financials</a>
							</li>
							<li class="nav-item">
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
							<h4 class="col-2">Cost ($)</h4>
							<h4 class="col-1">Actuals ($)</h4>
							<h4 class="col-1">JEN Funded ($)</h4>
							<h4 class="col-1">LCTA ($)</h4>
						</div>
					</div>

					<div ng-repeat="fim_type in fim_types">
						<div class="row">
							<h4 class="col-12">{{fim_type.name}}</h4>
						</div>

						<div ng-repeat="sub_type in fim_type.sub_types">
							<div class="row">
								<h4 class="col-3">{{sub_type.name}}</h4>
								<h4 class="col-9"></h4>
							</div>
							<div class="light" ng-repeat="item in sub_type.items">
								<div class="row">
									<h4 class="col-1">{{item.id}}</h4>
									<h4 class="col-2">{{item.description}}</h4>
									<input class="currency col-1" type="number"
										ng-model="item.actual"
										ng-change="fim_input_changed(item.id,item.actual,item.jen,item.lcta, 
										item.actual * item.unitCost, item.jen * item.unitCost, item.lcta * item.unitCost, fim_type.id)">
									<input class="currency col-1" type="number" ng-model="item.jen"
										ng-change="fim_input_changed(item.id,item.actual,item.jen,item.lcta, 
										item.actual * item.unitCost, item.jen * item.unitCost, item.lcta * item.unitCost, fim_type.id)">
									<input class="currency col-1" type="number"
										ng-model="item.lcta"
										ng-change="fim_input_changed(item.id,item.actual,item.jen,item.lcta, 
										item.actual * item.unitCost, item.jen * item.unitCost, item.lcta * item.unitCost, fim_type.id)">
									<h4 class="col-1">{{item.currency}}</h4>
									<h4 class="col-2">{{item.unitCost | number: 2 }}</h4>

									<h4 class="col-1">{{item.actual * item.unitCost | number: 2 }}</h4>
									<h4 class="col-1">{{item.jen * item.unitCost | number: 2 }}</h4>
									<h4 class="col-1">{{item.lcta * item.unitCost | number: 2 }}</h4>

								</div>
							</div>
						</div>
						
						<div class="row">
							<h4 class="col-3">{{fim_type.name}}</h4>
							<h4 class="col-6">Total</h4>
							<h4 class="col-1">{{fim_type_total[fim_type.id].actTotal | number: 2 }}</h4>
							<h4 class="col-1">{{fim_type_total[fim_type.id].jenTotal | number: 2 }}</h4>
							<h4 class="col-1">{{fim_type_total[fim_type.id].lctaTotal | number: 2 }}</h4>
						</div>
					</div>
					<br>
					<button type="button" class="btn btn-primary"
						ng-click="fim_submit_input()">submit</button>
				</form>
			</div>
		</div>
	</section>
</body>
</html>
