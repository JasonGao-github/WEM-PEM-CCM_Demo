<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ include file="common/checkSessionExist.jspf" %>

<!DOCTYPE html>

<head>
    <%@ include file="common/meta.jspf" %>
    <link rel="stylesheet" href="<%=path%>static/css/CCF.css"/>
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
<%@ include file="common/sidebar.jspf" %>
<section class="home_section" ng-init="getApproversData()">
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
                            <a class="nav-link active" href="approvals">Approvals</a>
                        </li>
                    </ul>
                </div>
            </div>
            <h2 style="margin: 2vh; text-align: center; font-weight: 600;">Approvals</h2>
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mt-5 mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Approvals</h6>
                            <div class="dropdown no-arrow">
                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                </a>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <h4>Approver 01</h4>
                                </div>
                                <div class="col-12">
                                    <form>
                                        <div class="row d-flex align-items-center">
                                            <label for="approverOnePost" class="col-sm-2 col-form-label">Set
                                                Approver: </label>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="approverOnePost">Approver Post</label>
                                                    <select class="form-control" id="approverOnePost"
                                                            ng-model="approver_one_post">
                                                        <option value=0" selected disabled hidden>Select
                                                            job role
                                                        </option>
                                                        <option value="1">Super Administrator</option>
                                                        <option value="2">Financial Administrator</option>
                                                        <option value="3">Tariff Administrator</option>
                                                        <option value="4">Pricing Administrator</option>
                                                        <option value="5">Commercial & Operational Administrator
                                                        </option>
                                                        <option value="6">Final Approver</option>
                                                        <option value="7">Senior Project Manager</option>
                                                        <option value="8">Project Manager</option>
                                                        <option value="9">Estimator</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="approverOneName">Approver Name</label>
                                                    <select class="form-control" id="approverOneName"
                                                            ng-show="approverOneNameSelector"
                                                            ng-model="approver_one_name">
                                                        <option ng-repeat="name in approver_one_name_list"
                                                                value="{{name.id}}"
                                                                ng-selected="name.selected == true">{{name.name}}
                                                        </option>
                                                    </select>
                                                    <h4 ng-show="approverOneNameText">{{approver_one_name}}</h4>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <button type="button" class="btn btn-primary" ng-click="setApprover(0)"
                                                        id="setApprovalBtn1">
                                                    Set Approval
                                                </button>
                                            </div>
                                        </div>
                                        <div class="row d-flex align-items-center">
                                            <label for="approverOnePost"
                                                   class="col-sm-2 col-form-label">Approver: </label>
                                            <div class="col">
                                                <button type="button" class="btn btn-success"
                                                        ng-click="approveProject(0)">Approve
                                                </button>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="approverOneStatus">Approval Status</label>
                                                    <h4 ng-model="approverOneStatus">{{approverOneStatus}}</h4>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="approverOneDate">Approval Date</label>
                                                    <h4 ng-model="approverOneDate">{{approverOneDate}}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <hr/>
                            <div class="row">
                                <div class="col-12">
                                    <h4>Approver 02</h4>
                                </div>
                                <div class="col-12">
                                    <form>
                                        <div class="row d-flex align-items-center">
                                            <label for="approverTwoPost" class="col-sm-2 col-form-label">Set
                                                Approver: </label>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="approverTwoPost">Approver Post</label>
                                                    <select class="form-control" id="approverTwoPost"
                                                            ng-model="approver_two_post">
                                                        <option value="0" selected disabled hidden>Select
                                                            job role
                                                        </option>
                                                        <option value="1">Super Administrator</option>
                                                        <option value="2">Financial Administrator</option>
                                                        <option value="3">Tariff Administrator</option>
                                                        <option value="4">Pricing Administrator</option>
                                                        <option value="5">Commercial & Operational Administrator
                                                        </option>
                                                        <option value="6">Final Approver</option>
                                                        <option value="7">Senior Project Manager</option>
                                                        <option value="8">Project Manager</option>
                                                        <option value="9">Estimator</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="approverTwoName">Approver Name</label>
                                                    <select class="form-control" id="approverTwoName"
                                                            ng-show="approverTwoNameSelector"
                                                            ng-model="approver_two_name">
                                                        <option ng-repeat="name in approver_two_name_list"
                                                                value="{{name.id}}"
                                                                ng-selected="name.selected == true">{{name.name}}
                                                        </option>
                                                    </select>
                                                    <h4 ng-show="approverTwoNameText">{{approver_two_name}}</h4>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <button type="button" class="btn btn-primary" ng-click="setApprover(1)"
                                                        id="setApprovalBtn2">
                                                    Set Approval
                                                </button>
                                            </div>
                                        </div>
                                        <div class="row d-flex align-items-center">
                                            <label for="approverOnePost"
                                                   class="col-sm-2 col-form-label">Approver: </label>
                                            <div class="col">
                                                <button type="button" class="btn btn-success"
                                                        ng-click="approveProject(1)">Approve
                                                </button>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="approverTwoStatus">Approval Status</label>
                                                    <h4 ng-model="approverTwoStatus">{{approverTwoStatus}}</h4>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="approverTwoDate">Approval Date</label>
                                                    <h4 ng-model="approverTwoDate">{{approverTwoDate}}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <hr/>
                            <div class="row">
                                <div class="col-12">
                                    <h4>Approver 03</h4>
                                </div>
                                <div class="col-12">
                                    <form>
                                        <div class="row d-flex align-items-center">
                                            <label for="approverTwoPost" class="col-sm-2 col-form-label">Set
                                                Approver: </label>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="approverThreePost">Approver Post</label>
                                                    <select class="form-control" id="approverThreePost"
                                                            ng-model="approver_three_post">
                                                        <option value="0" selected disabled hidden>Select
                                                            job role
                                                        </option>
                                                        <option value="1">Super Administrator</option>
                                                        <option value="2">Financial Administrator</option>
                                                        <option value="3">Tariff Administrator</option>
                                                        <option value="4">Pricing Administrator</option>
                                                        <option value="5">Commercial & Operational Administrator
                                                        </option>
                                                        <option value="6">Final Approver</option>
                                                        <option value="7">Senior Project Manager</option>
                                                        <option value="8">Project Manager</option>
                                                        <option value="9">Estimator</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="approverThreeName">Approver Name</label>
                                                    <select class="form-control" id="approverThreeName"
                                                            ng-show="approverThreeNameSelector"
                                                            ng-model="approver_three_name">
                                                        <option ng-repeat="name in approver_three_name_list"
                                                                value="{{name.id}}"
                                                                ng-selected="name.selected == true">{{name.name}}
                                                        </option>
                                                    </select>
                                                    <h4 ng-show="approverThreeNameText">{{approver_three_name}}</h4>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <button type="button" class="btn btn-primary" ng-click="setApprover(2)"
                                                        id="setApprovalBtn3">
                                                    Set Approval
                                                </button>
                                            </div>
                                        </div>
                                        <div class=" row d-flex align-items-center
                                                ">
                                            <label for="approverThreePost"
                                                   class="col-sm-2 col-form-label">Approver: </label>
                                            <div class="col">
                                                <button type="button" class="btn btn-success"
                                                        ng-click="approveProject(2)">Approve
                                                </button>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="approverThreeStatus">Approval Status</label>
                                                    <h4 ng-model="approverThreeStatus">{{approverThreeStatus}}</h4>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                    <label for="approverThreeDate">Approval Date</label>
                                                    <h4 ng-model="approverThreeDate">{{approverThreeDate}}</h4>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Modal -->
<div class="modal fade" id="approvalDataModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><b>Approvals - Status</b></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h5>Operation successful!</h5>
            </div>
            <div class="modal-footer">
                <%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
