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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>
<script type="text/javascript"
	src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
</head>



<body ng-app="main_app" id="main" ng-controller="controller">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content" id="content">
				<h2>Connection Handover</h2>
				<button onclick="javascript:demoFromHTML()">Print this page</button>

				<div class="form container" name="newUser"
					style="justify-content: center">

					<div class="basic">
						<div class="row">
							<div class="c">
								<h3>Project Ref :</h3>
							</div>
							<div class="col-2">
								<input ng-model="projectRef" type="text" id="projectRef" />
							</div>
							<div class="col-1">
								<h3>Portal No :</h3>
							</div>
							<div class="col-2">
								<input ng-model="portalNo" type="text" id="portalNo" />
							</div>
							<div class="col-1">
								<h3>Date :</h3>
							</div>
							<div class="col-2">
								<input ng-model="data" type="date" id="portalNo" />
							</div>
						</div>

						<div class="row">
							<h3>Section 1 - Customer Details</h3>
						</div>


						<div class="row">
							<div class="c">
								<h3>Customer / Business Name :</h3>
							</div>
							<div class="col-lg-7">
								<input ng-model="coustomerBusinessName" type="text"
									id="coustomerBusinessName" />
							</div>
						</div>

						<div class="row">
							<div class="c">
								<h3>Project Address :</h3>
							</div>
							<div class="col-lg-8">
								<input ng-model="projectAddress" type="text" id="projectAddress" />
							</div>
						</div>

						<div class="row">
							<div class="c">
								<h3>Customer Contact :</h3>
							</div>
							<div class="col-lg-1">
								<h3>Name :</h3>
							</div>
							<div class="col-2">
								<input ng-model="customerContactName" type="text"
									id="customerContactName" />
							</div>
							<div class="col-lg-1">
								<h3>Number :</h3>
							</div>
							<div class="col-2">
								<input ng-model="customerContactNumber" type="text"
									id="customerContactNumber" />
							</div>
							<div class="col-lg-1">
								<h3>Email :</h3>
							</div>
							<div class="col-lg-3">
								<input ng-model="customerContactEmail" type="text"
									id="customerContactEmail" />
							</div>
						</div>


						<div class="row">
							<h3>Section 2 - Project Details (Completed by Project
								Manager)</h3>
						</div>

						<div class="row">
							<div class="c">
								<h3>Maximum Allocated Capacity</h3>
							</div>
							<div class="col-lg-1">
								<h3>Phases :</h3>
							</div>
							<div class="col-2">
								<input ng-model="maximumAllocatedCapacityPhases" type="text"
									id="maximumAllocatedCapacityPhases" />
							</div>
							<div class="col-lg-1">
								<h3>Amps :</h3>
							</div>
							<div class="col-2">
								<input ng-model="maximumAllocatedCapacityAmps" type="text"
									id="maximumAllocatedCapacityAmps" />
							</div>
							<div class="col-lg-1">
								<h3>kVA :</h3>
							</div>
							<div class="col-2">
								<input ng-model="maximumAllocatedCapacitykVA" type="text"
									id="maximumAllocatedCapacitykVA" />
							</div>
						</div>

						<div class="row">
							<div class="c">
								<h3>Existing Connection? :</h3>
							</div>
							<div>
								<select id="connection" placeholder="Select"
									ng-model="existingConnection">
									<option value="" selected disabled hidden>Select</option>
									<option value="YES">YES</option>
									<option value="NO">NO</option>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="c">
								<h3>Embedded Network? :</h3>
							</div>
							<div>
								<select id="connection" placeholder="Select"
									ng-model="embeddedNetwork">
									<option value="" selected disabled hidden>Select</option>
									<option value="YES">YES</option>
									<option value="NO">NO</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="c">
								<h3>REC advised of CT arrangement? :</h3>
							</div>
							<div>
								<select id="connection" placeholder="Select"
									ng-model="reCadvisedofCTarrangement">
									<option value="" selected disabled hidden>Select</option>
									<option value="YES">YES</option>
									<option value="NO">NO</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="c">
								<h3>Property Requirement (Easement or Lease)</h3>
							</div>
							<div>
								<select id="propertyRequirement" placeholder="Select"
									ng-model="propertyRequirement">
									<option value="" selected disabled hidden>Select</option>
									<option value="YES">YES</option>
									<option value="NO">NO</option>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="c">
								<h3>Project Manager</h3>
							</div>
							<div class="col-lg-1">
								<h3>Name :</h3>
							</div>
							<div class="col-2">
								<input ng-model="projectManagerName" type="text"
									id="projectManagerName" />
							</div>
							<div class="col-lg-1">
								<h3>Phone :</h3>
							</div>
							<div class="col-2">
								<input ng-model="projectManagerPhone" type="text"
									id="projectManagerPhone" />
							</div>
						</div>

						<div class="row">
							<div class="c">
								<h3>U/G Crew Required? :</h3>
							</div>
							<div>
								<select id="ugCrewRequired" placeholder="Select"
									ng-model="ugCrewRequired">
									<option value="" selected disabled hidden>Select</option>
									<option value="YES">YES</option>
									<option value="NO">NO</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="c">
								<h3>Network Operator Required? :</h3>
							</div>
							<div>
								<select id="networkOperatorRequired" placeholder="Select"
									ng-model="networkOperatorRequired">
									<option value="" selected disabled hidden>Select</option>
									<option value="YES">YES</option>
									<option value="NO">NO</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="c">
								<h3>Compliance Reviewed Design? :</h3>
							</div>
							<div>
								<select id="complianceReviewedDesign" placeholder="Select"
									ng-model="complianceReviewedDesign">
									<option value="" selected disabled hidden>Select</option>
									<option value="YES">YES</option>
									<option value="NO">NO</option>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="c">
								<h3>Supply Point Details</h3>
							</div>
							<div class="col-2">
								<input ng-model="supplyPointDetails" type="text"
									id="supplyPointDetails" />
							</div>
							<div class="col-lg-1">
								<h3>Comments</h3>
							</div>
							<div class="col-5">
								<input ng-model="supplyPointComments" type="text"
									id="supplyPointComments" />
							</div>
						</div>

						<div class="row">
							<div class="c">
								<h3>SILV on issue</h3>
							</div>
							<div>
								<select id="silVonissue" placeholder="Select"
									ng-model="silVonissue">
									<option value="" selected disabled hidden>Select</option>
									<option value="YES">YES</option>
									<option value="NO">NO</option>
									<option value="N/A">N/A</option>
								</select>
							</div>
							<div>
								<div class="c">
									<h3>Comments</h3>
								</div>
							</div>
							<textarea id="silVonissueComments" rows="10"
								ng-model="silVonissueComments"></textarea>
						</div>
						<div class="row">
							<div class="c" ng-init="conn_handover_getAllAttachments()">
								<h3>Attachements (Photos or Designs)</h3>
							</div>
							<form method="post" action="/uplaodedFiles"
								enctype="multipart/form-data" id="uploadForm">
								<input type="file" name="file" multiple> <input
									type="submit" value="submit">
							</form>
						</div>
						<div ng-repeat="attachment in conn_handover_attachment_list">
						</div>
						<a href="{{conn_handover_attachment_list.s3URL}}" download>{{conn_handover_attachment_list.fileName}}</a>

					</div>
					<script>
						var form = document.getElementById("uploadForm");
						function handleForm(event) {
							event.preventDefault();
						}
						form.addEventListener('submit', handleForm);
					</script>


					<button type="button" class="btn btn-primary"
						ng-click="conn_handover_submit()">submit</button>

					<%
						int curr_page = 8;
					%>
					<%@ include file="common/pagesBar.jspf"%>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
