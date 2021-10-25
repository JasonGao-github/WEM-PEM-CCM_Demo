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
<section class="home_section">
    <div class="container-fluid contentWrapper">
        <div class="container content">
            <div class="row">
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
                            <a class="nav-link active" href="contract_schedule_page">Contract Schedule</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Inputs | Projects</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="approvals">Approvals</a>
                        </li>
                    </ul>
                </div>
            </div>
            <h2 style="margin: 2vh; text-align: center; font-weight: 600;">Contract Schedule</h2>
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mb-4" style="border-radius: 15px">
                        <div class="card-body">
                            <div class="col-12">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="urd-tab" data-toggle="tab"
                                           href="#urd"
                                           role="tab"
                                           aria-controls="exclusions" aria-selected="true">URD</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="negotiatedConnection-tab" data-toggle="tab" href="#negotiatedConnection"
                                           role="tab"
                                           aria-controls="assumptions" aria-selected="false">Negotiated Connection</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="assetRelocation-tab" data-toggle="tab" href="#assetRelocation"
                                           role="tab"
                                           aria-controls="assumptions" aria-selected="false">Asset Relocation</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="urd" role="tabpanel"
                                         aria-labelledby="urd-tab">
                                        <div class="col-xl-12 col-lg-12">
                                            <div class="card shadow mt-5 mb-4">
                                                <!-- Card Header - Dropdown -->
                                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                                    <h6 class="m-0 font-weight-bold text-primary">Underground Development Offer Schedule</h6>
                                                    <div class="dropdown no-arrow">
                                                        <a class="dropdown-toggle" href="#" role="button"
                                                           id="dropdownMenuLink"
                                                           data-toggle="dropdown" aria-haspopup="true"
                                                           aria-expanded="false">
                                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <!-- Card Body -->
                                                <div class="card-body">
                                                    <form>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="form-group">
                                                                    <label for="scopeExclusionItemDescription">Scope
                                                                        exclusion item
                                                                        description</label>
                                                                    <input id="scopeExclusionItemDescription"
                                                                           ng-model="scopeExclusionItemDescription"
                                                                           type="text"
                                                                           class="form-control"
                                                                           placeholder="Enter scope exclusion item description"/>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row"
                                                             ng-show="scopeExclusionItemDescriptionDataError">
                                                            <div class="col">
                                                                <h6 style="color: red">Error in data!</h6>
                                                            </div>
                                                        </div>
                                                        <div class="row"
                                                             ng-show="scopeExclusionItemDescriptionDataSuccess">
                                                            <div class="col">
                                                                <h6 style="color: green">Item added successfully!</h6>
                                                            </div>
                                                        </div>

                                                        <div class="row mt-3">
                                                            <div class="col">
                                                                <button type="button" class="btn btn-primary"
                                                                        ng-click="add_scope_exclusion_item()">Submit
                                                                    Data
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="negotiatedConnection" role="tabpanel"
                                         aria-labelledby="negotiatedConnection-tab">
                                        <div class="col-xl-12 col-lg-12">
                                            <div class="card shadow mt-5 mb-4">
                                                <!-- Card Header - Dropdown -->
                                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                                    <h6 class="m-0 font-weight-bold text-primary">Negotiated Connection Offer Schedule</h6>
                                                    <div class="dropdown no-arrow">
                                                        <a class="dropdown-toggle" href="#" role="button"
                                                           id="dropdownMenuLink"
                                                           data-toggle="dropdown" aria-haspopup="true"
                                                           aria-expanded="false">
                                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <!-- Card Body -->
                                                <div class="card-body">
                                                    <form>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="form-group">
                                                                    <label for="scopeAssumptionItemDescription">Assumption
                                                                        item
                                                                        description</label>
                                                                    <input id="scopeAssumptionItemDescription"
                                                                           ng-model="scopeAssumptionItemDescription"
                                                                           type="text"
                                                                           class="form-control"
                                                                           placeholder="Enter assumption item description"/>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row"
                                                             ng-show="scopeAssumptionItemDescriptionDataError">
                                                            <div class="col">
                                                                <h6 style="color: red">Error in data!</h6>
                                                            </div>
                                                        </div>
                                                        <div class="row"
                                                             ng-show="scopeAssumptionItemDescriptionDataSuccess">
                                                            <div class="col">
                                                                <h6 style="color: green">Item added successfully!</h6>
                                                            </div>
                                                        </div>

                                                        <div class="row mt-3">
                                                            <div class="col">
                                                                <button type="button" class="btn btn-primary"
                                                                        ng-click="add_assumption_item()">Submit
                                                                    Data
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="assetRelocation" role="tabpanel"
                                         aria-labelledby="assetRelocation-tab">
                                        <div class="col-xl-12 col-lg-12">
                                            <div class="card shadow mt-5 mb-4">
                                                <!-- Card Header - Dropdown -->
                                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                                    <h6 class="m-0 font-weight-bold text-primary">Distribution Works Offer Schedule</h6>
                                                    <div class="dropdown no-arrow">
                                                        <a class="dropdown-toggle" href="#" role="button"
                                                           id="dropdownMenuLink"
                                                           data-toggle="dropdown" aria-haspopup="true"
                                                           aria-expanded="false">
                                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <!-- Card Body -->
                                                <div class="card-body">
                                                    <form>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="form-group">
                                                                    <label for="scopeAssumptionItemDescription">Assumption
                                                                        item
                                                                        description</label>
                                                                    <input id="scopeAssumptionItemDescription"
                                                                           ng-model="scopeAssumptionItemDescription"
                                                                           type="text"
                                                                           class="form-control"
                                                                           placeholder="Enter assumption item description"/>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row"
                                                             ng-show="scopeAssumptionItemDescriptionDataError">
                                                            <div class="col">
                                                                <h6 style="color: red">Error in data!</h6>
                                                            </div>
                                                        </div>
                                                        <div class="row"
                                                             ng-show="scopeAssumptionItemDescriptionDataSuccess">
                                                            <div class="col">
                                                                <h6 style="color: green">Item added successfully!</h6>
                                                            </div>
                                                        </div>

                                                        <div class="row mt-3">
                                                            <div class="col">
                                                                <button type="button" class="btn btn-primary"
                                                                        ng-click="add_assumption_item()">Submit
                                                                    Data
                                                                </button>
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
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
