<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    int projectId;
    if (session.getAttribute("projectId") != null) {
        projectId = (int) session.getAttribute("projectId");
    } else {
        projectId = -1;
    }
    System.out.println(projectId);
%>

<%@  include file="common/checkSessionExist.jspf" %>

<!DOCTYPE html>

<head>
    <%@ include file="common/meta.jspf" %>
    <link rel="stylesheet" href="<%=path%>static/css/NCC.css"/>
</head>

<body ng-app="main_app" id="main" ng-controller="controller"
      ng-init="get_ncc()">
<%@ include file="common/sidebar.jspf" %>
<section class="home_section">
    <div class="container-fluid contentWrapper">
        <div class="container content">
            <div class="row" style="padding: 0.5rem !important">
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
                            <a class="nav-link active" href="ncc_page">Non-contestable Costs Input</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="fim_page">FIM Input</a>
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
            <h2 style="margin: 2vh; text-align: center; font-weight: 600;">Non-contestable costs</h2>
            <div class="row">
                <form class="form container" name="newUser" action="" method="POST"
                      style="justify-content: center">
                    <Input type="hidden" value=<%=projectId%> ng-model="projectId">
                    <div class="row">
                        <h3>Project Type</h3>
                        <select id="position" ng-change="ncc_typeChanged()"
                                ng-model="selected_type">
                            <option ng-repeat="type in project_types" value="{{type.id}}">{{type.name}}</option>
                        </select>
                    </div>
                    <div class="projectComp">
                        <div class="row">
                            <h4 class="col-4">Project Component</h4>
                            <h4 class="col-2">Unit</h4>
                            <h4 class="col-2">Quantity</h4>
                            <h4 class="col-2">Cost ($)</h4>
                            <h4 class="col-2">Total ($)</h4>
                        </div>
                        <div class="row light" ng-repeat="comp in proj_comps">
                            <h4 class="col-4">{{comp.description}}</h4>
                            <h4 class="col-2">Hour</h4>
                            <input class="col-2" type="number" ng-model="comp.quantity"
                                   ng-change="ncc_projCompChanged(comp.id, comp.quantity, comp.quantity * comp.cost)">
                            <h4 class="col-2">{{comp.cost}}</h4>
                            <h4 class="col-2">{{comp.quantity * comp.cost}}</h4>
                        </div>

                    </div>


                    <div class="other">
                        <div class="row">
                            <h4 class="col-4"></h4>
                            <h4 class="col-2">Unit</h4>
                            <h4 class="col-2">Quantity</h4>
                            <h4 class="col-2">Rate</h4>
                            <h4 class="col-2">Total</h4>
                        </div>

                        <div ng-repeat="type in ncc_otherTypes">
                            <div class="row">
                                <h4 class="col-4">{{type.name}}</h4>
                                <h4 class="col-2"></h4>
                                <h4 class="col-2"></h4>
                                <h4 class="col-2"></h4>
                                <h4 class="col-2"></h4>
                            </div>


                            <div class="row light" ng-repeat="item in type.items">
                                <h4 class="col-4">{{item.description}}</h4>
                                <h4 class="col-2">{{item.unit}}</h4>
                                <input class="currency col-2" type="number"
                                       ng-model="item.quantity"
                                       ng-change="ncc_otherChanged(item.id, item.quantity, item.rate * item.quantity)">
                                <h4 class="col-2">{{item.rate}}</h4>
                                <h4 class="col-2">{{item.rate * item.quantity}}</h4>
                            </div>
                        </div>

                    </div>
                    <button type="button" class="btn btn-primary"
                            ng-click="ncc_submit_input()">submit
                    </button>
                </form>
            </div>
            <%--				<%--%>
            <%--					int curr_page = 3;--%>
            <%--				%>--%>
            <%--				<%@ include file="common/pagesBar.jspf"%>--%>
        </div>
    </div>
</section>
</body>
</html>
