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
			<div class="container content">
				<h1 style="margin: 2vh;">Avoided Cost Page</h1>
				<table class="table" ng-init="get_ac()">
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
							<td colspan="1"><select
								ng-model="exist_asset_data[asset.id].avoidedCostassetReplacementItermId"
								ng-change="ac_exist_select_item(asset.id)">
									<option ng-repeat="item in ac_items" value="{{item.id}}">{{item.name}}</option>
							</select></td>
							<td>Jemena</td>
							<td>{{exist_asset_data[asset.id].unitCost | number: 2 }}</td>
							<td>{{exist_asset_data[asset.id].unit}}</td>
							<td><input type="number"
								ng-model="exist_asset_data[asset.id].quantity"
								ng-change="ac_update_exist_item(asset.id)"></td>
							<td>{{exist_asset_data[asset.id].totalCost | number: 2 }}</td>
							<td><input type="number"
								ng-model="exist_asset_data[asset.id].assetAge"
								ng-change="ac_update_exist_item(asset.id)"></td>
							<td>{{exist_asset_data[asset.id].stdLife}}</td>
							<td>{{exist_asset_data[asset.id].remLife}}</td>
							<td>{{exist_asset_data[asset.id].presentValueRC | number: 2 }}</td>
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
								ng-model="repl_asset_data[asset.id].avoidedCostassetReplacementItermId"
								ng-change="ac_repl_select_item(asset.id)">
									<option ng-repeat="item in ac_items" value="{{item.id}}">{{item.name}}</option>
							</select></td>
							<td>Jemena</td>
							<td>{{repl_asset_data[asset.id].unitCost | number: 2 }}</td>
							<td>{{repl_asset_data[asset.id].unit}}</td>
							<td><input type="number"
								ng-model="repl_asset_data[asset.id].quantity"
								ng-change="ac_update_repl_item(asset.id)"></td>
							<td>{{repl_asset_data[asset.id].totalCost | number: 2 }}</td>
							<td>-</td>
							<td>{{repl_asset_data[asset.id].stdLife}}</td>
							<td>{{repl_asset_data[asset.id].remLife}}</td>
							<td>{{repl_asset_data[asset.id].presentValueRC | number: 2 }}</td>
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
				<%
					int curr_page = 5;
				%>
				<%@ include file="common/pagesBar.jspf"%>
			</div>
		</div>
	</section>
</body>
</html>
