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
<link rel="stylesheet" href="<%=path%>static/css/ncc_basic.css" />
</head>

<body ng-app="main_app" id="main" ng-controller="controller"
	ng-init="get_fim()">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content">
				<h2>Non-Contestable Costs</h2>
				<form class="form container" name="newUser" action="" method="POST"
					style="justify-content: center">

					<div class="row">
						<h3>Type</h3>
						<select id="position" ng-model="fim_type">
							<option value="pc">FIM Input Type</option>
							<option ng-repeat="ft in fim_types" value="{{type.id}}">{{type.name}}</option>
						</select>
					</div>

					<div class="row">
						<h3>Project Type</h3>
						<select id="position" ng-model="selected_type">
							<option ng-repeat="type in project_types" value="{{type.id}}">{{type.name}}</option>
						</select>
					</div>

					<div class="row">
						<h3>Description</h3>
						<Input type="text" ng-model="description">
					</div>
					<div class="row">
						<h3>Unit</h3>
						<Input type="text" ng-model="unit"> <br>
					</div>
					<div class="row">
						<h3>Rate</h3>
						<Input type="number" ng-model="rate"> <br>
					</div>

					<button type="button" class="btn btn-primary"
						ng-click="add_ncc_basic()">submit</button>

				</form>
			</div>
		</div>
	</section>
</body>
</html>
