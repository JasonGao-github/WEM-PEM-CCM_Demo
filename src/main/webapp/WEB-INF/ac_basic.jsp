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

<body ng-app="main_app" id="main" ng-controller="controller"
	ng-init="get_fim()">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content">
				<h3>Avoided cost - Add basic data</h3>
				<nav>
					<div>
						<span class="Group"> Asset </span> <input class="testing"
							type="text" placeholder="Type" ng-model="asset">

					</div>
				</nav>
				<div>
					<span class="item">Asset Life</span> <input class="testing"
						type="number" placeholder="Type" ng-model="life">
				</div>

				<div>
					<span class="item">Units</span> <input class="testing" type="text"
						placeholder="Type" ng-model="unit">
				</div>
				<div>
					<span class="item">New Asset Cost</span> <input class="testing"
						type="number" placeholder="Type" ng-model="new_asset_cost">
				</div>
				<div>
					<span class="item">Maintenance Cost</span> <input class="testing"
						type="number" placeholder="Type" ng-model="main_cost">
				</div>
				<div>
					<span class="item">Vegetation Management Cost</span> <input
						class="testing" type="number" placeholder="Type"
						ng-model="veg_cost">
				</div>




				<a data-toggle="modal" data-target="#exampleModalCenter">
					<button class="savebtn" ng-click="ac_submit_basic()">Save
					</button>
				</a>

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

			</div>
		</div>
	</section>
</body>
</html>
