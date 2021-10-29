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

<body ng-app="main_app" id="main" ng-controller="controller" ng-init="get_ac()">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content">
				<div class="row">
					<div class="col-12">
						<ul class="nav nav-pills"
							style="padding: 10px; border: 1px solid rgba(0,0,0,.125);border-radius: 15px;">
							<li class="nav-item">
								<a class="nav-link" href="project_home_page">Project Home</a>
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
								<a class="nav-link active" href="avoided_cost_page">Avoided Costs Input</a>
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
								<a class="nav-link" href="input_project_page">Inputs | Projects</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="approvals">Approvers</a>
							</li>
						</ul>
					</div>
				</div>
				<h1 style="margin: 2vh;">Avoided Cost Page</h1>
				<table class="table" ng-init="get_project_ac()">
					<thead>
						<tr>
							<th scope="col" colspan="11">JEN Avoided Cost Model</th>
						</tr>
						<tr>
							<th scope="col" colspan="2">AS per ESC Guideline 14 2014</th>
							<th scope="col" colspan="2">Version 9.01 August 2016</th>
							<th scope="col" colspan="7">Asset Replacement Cost</th>
						</tr>
						<tr>
							<th scope="col" colspan="2">Assumptions</th>
							<th scope="col">Source</th>
							<th scope="col">Constant</th>
							<th scope="col" colspan="7">Notes</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>WACC-Real pre-tax WACC (%)</td>
							<td>AER FD PTRM</td>
							<td>{{wacc}}</td>
							<td colspan="7">Ensure that WACC used reflects Price
								Determination in force at the time of calculation.</td>
						</tr>
						<tr>
							<td>Margin for overheads (%)</td>
							<td>Jemena</td>
							<td><input type="number" ng-model="overhead"
								ng-change="ac_update_overhead()"></td>
							<td colspan="7">Input is constrained up to 10% as per clause
								2.3.2(a)</td>
						</tr>
						<tr>
							<td colspan="2">Net Avoided Costs</td>
							<td>{{netCosts | number: 2 }}</td>
							<td colspan="7"></td>
						</tr>
					</tbody>

					<thead>
						<tr>
							<th scope="col">Asset replacement costs - Existing Asset
								Types</th>
							<th scope="col">Source</th>
							<th>Unit Cost</th>
							<th>Unit</th>
							<th>Quantity</th>
							<th>Total Cost</th>
							<th>Asset Age</th>
							<th>Std Life</th>
							<th>Rem Life</th>
							<th>Present Value RC</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="asset in exist_asset_data">
							<td colspan="1">
								<select
								ng-model="exist_asset_data[$index]"
								ng-change="ac_exist_select_item($index)"
								ng-options="item as item.name for item in ac_items">
								</select>
							</td>
							<td>Jemena</td>
							<td>{{exist_asset_data[$index].unitCost | number: 2 }}</td>
							<td>{{exist_asset_data[$index].unit}}</td>
							<td><input type="number"
								ng-model="exist_asset_data[$index].quantity"
								ng-change="ac_update_exist_item($index)"></td>
							<td>{{exist_asset_data[$index].totalCost | number: 2 }}</td>
							<td><input type="number"
								ng-model="exist_asset_data[$index].assetAge"
								ng-change="ac_update_exist_item($index)"></td>
							<td>{{exist_asset_data[$index].stdLife}}</td>
							<td>{{exist_asset_data[$index].remLife}}</td>
							<td>{{exist_asset_data[$index].presentValueRC | number: 2 }}</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-primary"
									ng-click="add_ex_asset()">add</button></td>
							<td><button type="button" class="btn btn-primary"
									ng-click="rm_ex_asset()">remove</button></td>
							<td colspan="5">Total</td>
							<td colspan="2">Total</td>
							<td colspan="2">{{ac_total[0] | number: 2 }}</td>
						</tr>
					</tbody>
					<thead>
						<tr>
							<th scope="col">Asset replacement costs - New Asset Types</th>
							<th scope="col">Source</th>
							<th>Unit Cost</th>
							<th>Unit</th>
							<th>Quantity</th>
							<th>Total Cost</th>
							<th>Asset Age</th>
							<th>Std Life</th>
							<th>Rem Life</th>
							<th>Present Value RC</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="asset in repl_asset_data">
							<td colspan="1"><select
								ng-model="repl_asset_data[$index]"
								ng-change="ac_repl_select_item($index)"
								ng-options="item as item.name for item in ac_items track by item.id">
							</select></td>
							<td>Jemena</td>
							<td>{{repl_asset_data[$index].unitCost | number: 2 }}</td>
							<td>{{repl_asset_data[$index].unit}}</td>
							<td><input type="number"
								ng-model="repl_asset_data[$index].quantity"
								ng-change="ac_update_repl_item($index)"></td>
							<td>{{repl_asset_data[$index].totalCost | number: 2 }}</td>
							<td>-</td>
							<td>{{repl_asset_data[$index].stdLife}}</td>
							<td>{{repl_asset_data[$index].remLife}}</td>
							<td>{{repl_asset_data[$index].presentValueRC | number: 2 }}</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-primary"
									ng-click="add_repl_asset()">add</button></td>
							<td><button type="button" class="btn btn-primary"
									ng-click="rm_repl_asset()">remove</button></td>
							<td colspan="4">Weighted Average Life of New Underground Cable Assets</td>
							<td colspan="1">{{ac_new_weighted_avg_age | number: 2 }}</td>
							<td colspan="2">Total</td>
							<td colspan="2">{{ac_total[1] | number: 2 }}</td>
						</tr>
					</tbody>


				</table>
				<button type="button" class="btn btn-primary"
					ng-click="ac_submit_input()">submit</button>
			</div>
		</div>
	</section>
</body>
</html>
