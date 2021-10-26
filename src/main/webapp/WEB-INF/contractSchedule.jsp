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
<section class="home_section" ng-init="getContractScheduleData()">
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
                                        <a class="nav-link" id="negotiatedConnection-tab" data-toggle="tab"
                                           href="#negotiatedConnection"
                                           role="tab"
                                           aria-controls="assumptions" aria-selected="false">Negotiated Connection</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="assetRelocation-tab" data-toggle="tab"
                                           href="#assetRelocation"
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
                                                    <h6 class="m-0 font-weight-bold text-primary">Underground
                                                        Development Offer Schedule</h6>
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
                                                            <div class="table-responsive">
                                                                <table class="table table-striped table-light table-bordered table-hover dom-jQuery-events"
                                                                       style="text-align: center; margin: 0">
                                                                    <thead class="thead-light">
                                                                    <tr>
                                                                        <th>Item #</th>
                                                                        <th>Title</th>
                                                                        <th>Terms of Offer</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            1
                                                                        </td>
                                                                        <td>
                                                                            Inquiry Number
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdInquiryNumber"
                                                                                   ng-change="contractSchedule_update_row(urdInquiryNumber, 'urdInquiryNumber')"
                                                                                   class="form-control"
                                                                                   value="{{urdInquiryNumber}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            2
                                                                        </td>
                                                                        <td>
                                                                            Supply Address
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdSupplyAddress"
                                                                                   ng-change="contractSchedule_update_row(urdSupplyAddress, 'urdSupplyAddress')"
                                                                                   class="form-control"
                                                                                   value="{{urdSupplyAddress}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            3
                                                                        </td>
                                                                        <td>
                                                                            Subdivision
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdSubdivision"
                                                                                   ng-change="contractSchedule_update_row(urdSubdivision, 'urdSubdivision')"
                                                                                   class="form-control"
                                                                                   value="{{urdSubdivision}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            4
                                                                        </td>
                                                                        <td>
                                                                            Statutory and Other Approvals
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdStatOtherApprovals"
                                                                                   ng-change="contractSchedule_update_row(urdStatOtherApprovals, 'urdStatOtherApprovals')"
                                                                                   class="form-control"
                                                                                   value="{{urdStatOtherApprovals}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            5
                                                                        </td>
                                                                        <td>
                                                                            Supply Capacity per Lot
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdSupplyCapacity"
                                                                                   ng-change="contractSchedule_update_row(urdSupplyCapacity, 'urdSupplyCapacity')"
                                                                                   class="form-control"
                                                                                   value="{{urdSupplyCapacity}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            6
                                                                        </td>
                                                                        <td>
                                                                            Number of lots
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdNumLots"
                                                                                   ng-change="contractSchedule_update_row(urdNumLots, 'urdNumLots')"
                                                                                   class="form-control"
                                                                                   value="{{urdNumLots}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            7
                                                                        </td>
                                                                        <td>
                                                                            Lot numbers
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdLotNumbers"
                                                                                   ng-change="contractSchedule_update_row(urdLotNumbers, 'urdLotNumbers')"
                                                                                   class="form-control"
                                                                                   value="{{urdLotNumbers}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            8
                                                                        </td>
                                                                        <td>
                                                                            Lease or Easement
                                                                        </td>
                                                                        <td>
                                                                            <select id="urdLeaseOrEasement"
                                                                                    placeholder="Select position"
                                                                                    class="form-control"
                                                                                    ng-model="urdLeaseOrEasement">
                                                                                <option value="" selected disabled>
                                                                                    Please select from drop down list
                                                                                </option>
                                                                                <option value="yes">Yes</option>
                                                                                <option value="No">No</option>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            9
                                                                        </td>
                                                                        <td>
                                                                            Validity Period
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdValidityPeriod"
                                                                                   ng-change="contractSchedule_update_row(urdValidityPeriod, 'urdValidityPeriod')"
                                                                                   class="form-control"
                                                                                   value="{{urdValidityPeriod}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            10
                                                                        </td>
                                                                        <td>
                                                                            Security
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdSecurity"
                                                                                   ng-change="contractSchedule_update_row(urdSecurity, 'urdSecurity')"
                                                                                   class="form-control"
                                                                                   value="{{urdSecurity}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            11
                                                                        </td>
                                                                        <td>
                                                                            Planned Construction Period
                                                                        </td>
                                                                        <td>
                                                                            <select id="urdPlannedConstructionPeriod"
                                                                                    placeholder="Select position"
                                                                                    class="form-control"
                                                                                    ng-model="urdPlannedConstructionPeriod">
                                                                                <option value="" selected disabled>
                                                                                    Please select from drop down list
                                                                                </option>
                                                                                <option value="To be determined by customer">
                                                                                    To be determined by customer
                                                                                </option>
                                                                                <option value="12 weeks from date of acceptance (or the agreed site readiness date)">
                                                                                    12 weeks from date of acceptance (or
                                                                                    the agreed site readiness date)
                                                                                </option>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            12
                                                                        </td>
                                                                        <td>
                                                                            Description of Connection Works to be
                                                                            undertaken by Jemena
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdConnectionWorksJemena"
                                                                                   ng-change="contractSchedule_update_row(urdConnectionWorksJemena, 'urdConnectionWorksJemena')"
                                                                                   class="form-control"
                                                                                   value="{{urdConnectionWorksJemena}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            13
                                                                        </td>
                                                                        <td>
                                                                            Description of Connection Works to be
                                                                            undertaken by Developer
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdConnectionWorksDeveloper"
                                                                                   ng-change="contractSchedule_update_row(urdConnectionWorksDeveloper, 'urdConnectionWorksDeveloper')"
                                                                                   class="form-control"
                                                                                   value="{{urdConnectionWorksDeveloper}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            14
                                                                        </td>
                                                                        <td>
                                                                            Connection Assets and Connection Point
                                                                        </td>
                                                                        <td>
                                                                            <select id="urdAssetsAndConnectionPoint"
                                                                                    placeholder="Select position"
                                                                                    class="form-control"
                                                                                    ng-model="urdAssetsAndConnectionPoint">
                                                                                <option value="" selected disabled>
                                                                                    Please select from drop down list
                                                                                </option>
                                                                                <option value="LV Underground Service Pit">
                                                                                    LV Underground Service Pit
                                                                                </option>
                                                                                <option value="LV Underground Service to customer installed pillar">
                                                                                    LV Underground Service to customer
                                                                                    installed pillar
                                                                                </option>
                                                                                <option value="LV Overhead Connection">
                                                                                    LV Overhead Connection
                                                                                </option>
                                                                                <option value="LV Weber Strip">LV Weber
                                                                                    Strip
                                                                                </option>
                                                                                <option value="HV Switching Cabinet">HV
                                                                                    Switching Cabinet
                                                                                </option>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            15
                                                                        </td>
                                                                        <td>
                                                                            Premises Connection Assets and Parties
                                                                            Responsible for Installation
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdPremisesConnectionAssets"
                                                                                   ng-change="contractSchedule_update_row(urdPremisesConnectionAssets, 'urdPremisesConnectionAssets')"
                                                                                   class="form-control"
                                                                                   value="{{urdPremisesConnectionAssets}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            16
                                                                        </td>
                                                                        <td>
                                                                            Network Extension or Augmentation (if
                                                                            required)
                                                                        </td>
                                                                        <td>
                                                                            <select id="urdLeaseOrEasement"
                                                                                    placeholder="Select position"
                                                                                    class="form-control"
                                                                                    ng-model="urdNetworkExtension">
                                                                                <option value="" selected disabled>
                                                                                    Please select from drop down list
                                                                                </option>
                                                                                <option value="Yes">Yes</option>
                                                                                <option value="No">No</option>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            17
                                                                        </td>
                                                                        <td>
                                                                            Cost of Network Extension of Augmentation
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdCostOfNewtworkExtension"
                                                                                   ng-change="contractSchedule_update_row(urdCostOfNewtworkExtension, 'urdCostOfNewtworkExtension')"
                                                                                   class="form-control"
                                                                                   value="{{urdCostOfNewtworkExtension}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            18
                                                                        </td>
                                                                        <td>
                                                                            Meter Information
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdMeterInfo"
                                                                                   ng-change="contractSchedule_update_row(urdMeterInfo, 'urdMeterInfo')"
                                                                                   class="form-control"
                                                                                   value="{{urdMeterInfo}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            19
                                                                        </td>
                                                                        <td>
                                                                            Tender Fee (if applicable)
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdTenderFee"
                                                                                   ng-change="contractSchedule_update_row(urdTenderFee, 'urdTenderFee')"
                                                                                   class="form-control"
                                                                                   value="{{urdTenderFee}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            20
                                                                        </td>
                                                                        <td>
                                                                            Applicable Interest Rate
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdApplicableInterestRate"
                                                                                   ng-change="contractSchedule_update_row(urdApplicableInterestRate, 'urdApplicableInterestRate')"
                                                                                   class="form-control"
                                                                                   value="{{urdApplicableInterestRate}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            21
                                                                        </td>
                                                                        <td>
                                                                            Developer Responsible Officer
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdDeveloperResponsibleOfficer"
                                                                                   ng-change="contractSchedule_update_row(urdDeveloperResponsibleOfficer, 'urdDeveloperResponsibleOfficer')"
                                                                                   class="form-control"
                                                                                   value="{{urdDeveloperResponsibleOfficer}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            22
                                                                        </td>
                                                                        <td>
                                                                            Jemena Responsible Officer
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdJemenaResponsibleOfficer"
                                                                                   ng-change="contractSchedule_update_row(urdJemenaResponsibleOfficer, 'urdJemenaResponsibleOfficer')"
                                                                                   class="form-control"
                                                                                   value="{{urdJemenaResponsibleOfficer}}">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            23
                                                                        </td>
                                                                        <td>
                                                                            Other Job Specific Requirements
                                                                        </td>
                                                                        <td>
                                                                            <input type="text"
                                                                                   ng-model="urdOtherJobSpecific"
                                                                                   ng-change="contractSchedule_update_row(urdOtherJobSpecific, 'urdOtherJobSpecific')"
                                                                                   class="form-control"
                                                                                   value="{{urdOtherJobSpecific}}">
                                                                        </td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-3">
                                                            <div class="col d-flex justify-content-end">
                                                                <button type="button" class="btn btn-success"
                                                                        ng-click="submitUrdData()">Submit
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
                                                    <h6 class="m-0 font-weight-bold text-primary">Negotiated Connection
                                                        Offer Schedule</h6>
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
                                                    <h6 class="m-0 font-weight-bold text-primary">Distribution Works
                                                        Offer Schedule</h6>
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

<!-- Modal -->
<div class="modal fade" id="contractScheduleDataModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><b>Contract Schedule - Status</b></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h5>Data saved successfully!</h5>
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
