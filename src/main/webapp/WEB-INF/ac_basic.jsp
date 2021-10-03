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
<link rel="stylesheet" href="<%=path%>static/css/addBasicData_AvoidedCost.css" />
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
            <span class="Group">
              Description
            </span>
            <input class="testing" type="text" placeholder="Type">
            
          </div>
        </nav>
        <div>
          <span class="item">Unit Cost</span>
          <input class="testing" type="text" placeholder="Type">
        </div>

        <div>
          <span class="item">Unit</span>
          <input class="testing" type="text" placeholder="Type">
        </div>

        <div>
          <span class="item">Total cost</span>
          <input class="testing" type="text" placeholder="Type">
        </div>

        <div>
          <span class="item">Asset Age</span>
          <input class="testing" type="text" placeholder="Type">
        </div>

        <div>
          <span class="item">Std Life</span>
          <input class="testing" type="text" placeholder="Type">
        </div>

        <div>
          <span class="item">Rem Life</span>
          <input class="testing" type="text" placeholder="Type">
        </div>

        <div>
          <span class="item">Present Value RCExist</span>
          <input class="testing" type="text" placeholder="Type">
        </div>

        <div>
          <span class="item">UintRate</span>
          <input class="testing" type="text" placeholder="Type">
        </div>

        <div>
          <span class="item">Manhours</span>
          <input class="testing" type="text" placeholder="Type">
        </div>


        <div>
          <span class="Total">
            Total
          </span>
          <div class="total">
          </div>
          <button class="savebtn">
            Save
          </button>
          <button class="draft">
            Cancel
          </button>
        </div>

      </div>
    </div>
	</section>
</body>
</html>
