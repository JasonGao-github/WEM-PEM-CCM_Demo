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
<link rel="stylesheet" href="<%=path%>static/css/NCC.css" />
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content d-flex flex-column">
				<h2>Non-Contestable Costs</h2>
				<form class="form container" name="newUser" action="" method="POST"
					style="justify-content: center">
					<div class="row">
						<h3>
							Project Type
							</h2>
							<select id="position" placeholder="Select position">
								<option value="" selected disabled hidden>Select</option>
								<option value="typeA">Type A</option>
								<option value="typeB">Type B</option>
							</select>
					</div>

					<div class="row">
						<h4 class="col-4">Project Component</h4>
						<h4 class="col-2">Unit</h4>
						<h4 class="col-2"></h4>
						<h4 class="col-2">Cost</h4>
						<h4 class="col-2">Total</h4>
					</div>

					<div class="row light">
						<h4 class="col-4">Type A - Project Management (Delivery)</h4>
						<h4 class="col-2">Hour</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">Type A - Design</h4>
						<h4 class="col-2">Hour</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">Type A - Project Management (Offer)</h4>
						<h4 class="col-2">Hour</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row">
						<h4 class="col-4">Other Design Services</h4>
						<h4 class="col-2">Unit</h4>
						<h4 class="col-2">Quantity</h4>
						<h4 class="col-2">Rate</h4>
						<h4 class="col-2">Total</h4>
					</div>

					<div class="row light">
						<h4 class="col-4">Survey - Small (1 to 3Poles)</h4>
						<h4 class="col-2">Project</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">Survey - Medium (4 to 7Poles)</h4>
						<h4 class="col-2">Preojct</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">Survey - Large (above 7 poles) 2 man crew
							per hour</h4>
						<h4 class="col-2">Hour</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">Drafting - New Drawing</h4>
						<h4 class="col-2">Drawing</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>
					<div class="row light">
						<h4 class="col-4">Drafting - Ament existing drawing or
							As-build markup drawing</h4>
						<h4 class="col-2">Drawing</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">Substation lease creation and registration</h4>
						<h4 class="col-2">Each</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">Substation Eastement Leases-JEN Initiated</h4>
						<h4 class="col-2">Each</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">Detailing of UG project</h4>
						<h4 class="col-2">Drawing</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">Constrution Quality Audits (4 staged audit)</h4>
						<h4 class="col-2">Estate</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">UG Cable Detailing (URD)</h4>
						<h4 class="col-2">Hour</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">Install/Remove LV Load Logger (Includes
							Voltage report)</h4>
						<h4 class="col-2">Set</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">Safety Observer (for REC works in
							pillar/kiosk/GTS))</h4>
						<h4 class="col-2">Day</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

					<div class="row light">
						<h4 class="col-4">As built drawing into EDMS (& GIS as
							planned)</h4>
						<h4 class="col-2">Drawing</h4>
						<h4 class="col-2"></h4>
						<input class="currency col-2" type="number"> <input
							class="currency col-2" type="number">
					</div>

				</form>
				<% int curr_page = 3; %>
				<%@ include file="common/pagesBar.jspf"%>
			</div>
		</div>
	</section>
</body>
</html>
