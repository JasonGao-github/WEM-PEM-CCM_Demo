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
			<div class="container content d-flex flex-column">
				<h1 style="margin: 2vh;">Avoided Cost Page</h1>
				<table class="table">
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
							<td>WACC-Real pre-tax WACC</td>
							<td>AER FD PTRM</td>
							<td>4.72%</td>
							<td colspan="7">Ensure that WACC used reflects Price
								Determination in force at the time of calculation.</td>
						</tr>
						<tr>
							<td>Margin for overheads</td>
							<td>Jemena</td>
							<td><input type="number"></td>
							<td colspan="7">Input is constrained up to 10% as per clause
								2.3.2(a)</td>
						</tr>
						<tr>
							<td colspan="2">Net Avoided Costs</td>
							<td>$</td>
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
						<tr>
							<td colspan="2"><select>
									<option>Wooden Pole - HV</option>
									<option>Wooden Pole - LV</option>
									<option>Concrete Pole - HV</option>
									<option>Concrete Pole - LV</option>
									<option>Steel Pole -LV</option>
							</select></td>
							<td>Jemena</td>
							<td><input type="number"></td>
							<td><input type="number"></td>
							<td><input type="number"></td>
							<td><input type="number"></td>
							<td><input type="number"></td>
							<td><input type="number"></td>
							<td><input type="number"></td>

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

				</table>
				<%
					int curr_page = 5;
				%>
				<%@ include file="common/pagesBar.jspf"%>
			</div>
		</div>
	</section>
</body>
</html>
