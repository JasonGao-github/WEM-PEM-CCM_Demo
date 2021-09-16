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

<body ng-app="main_app" id="main" ng-controller="controller">
	<%@ include file="common/sidebar.jspf"%>
	<section class="home_section">
		<div class="container-fluid contentWrapper">
			<div class="container content d-flex flex-column">
				<h2>FIM Input</h2>
				<form class="form container" name="newUser" action="" method="POST"
					style="justify-content: center">

					<div class="basic">
						<div class="row">
							<h4 class="col-12">Pole TX Estimates</h4>
						</div>

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


						<div class="row">
							<h4 class="col-3">Transformer 22k V</h4>
							<h4 class="col-1"></h4>
							<h4 class="col-1"></h4>
							<h4 class="col-1"></h4>
							<h4 class="col-1"></h4>
							<h4 class="col-2"></h4>
							<h4 class="col-1"></h4>
							<h4 class="col-1"></h4>
							<h4 class="col-1"></h4>
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>

					<div class="light">
						<div class="row">
							<h4 class="col-1">11004799</h4>
							<h4 class="col-2">TRANSFORMER 22Kv, 500KVA, 433-250V</h4>
							<input class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-2" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number"> <input
								class="currency col-1" type="number">
						</div>
					</div>
				</form>
				<% int curr_page = 4; %>
				<%@ include file="common/pagesBar.jspf"%>
			</div>
		</div>
	</section>
</body>
</html>
