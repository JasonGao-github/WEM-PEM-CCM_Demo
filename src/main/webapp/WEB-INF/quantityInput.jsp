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
    <link rel="stylesheet" href="<%=path%>static/css/quantityInput.css"/>
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
<%@ include file="common/sidebar.jspf" %>
<section class="home_section" ng-init="getQuantityInputData()">
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
                            <a class="nav-link active" href="quantity_input_page">Quantity Input</a>
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
                            <a class="nav-link" href="approvals">Approvals</a>
                        </li>
                    </ul>
                </div>
            </div>
            <h2 style="margin: 2vh; text-align: center; font-weight: 600;">Quantity Input</h2>
            <div class="container-fluid">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <a class="nav-link active" id="nav-tab-66kVConstruction" data-toggle="tab" data-value="1"
                           href="#nav-66kVConstruction" role="tab" aria-controls="nav-66kVConstruction"
                           aria-selected="true">66kV Construction</a>
                        <a class="nav-link" id="nav-tab-HVConstruction" data-toggle="tab" href="#nav-HVConstruction"
                           role="tab" aria-controls="nav-HVConstruction" aria-selected="false">HV Construction</a>
                        <a class="nav-link" id="nav-tab-LVConstruction" data-toggle="tab" href="#nav-LVConstruction"
                           role="tab" aria-controls="nav-LVConstruction" aria-selected="false">LV Construction</a>
                        <a class="nav-link" id="nav-tab-HVlineSwitchesIsolation" data-toggle="tab"
                           href="#nav-HVlineSwitchesIsolation" role="tab" aria-controls="nav-HVlineSwitchesIsolation"
                           aria-selected="false">HV Line Switches, Isolators & Fuses</a>
                        <a class="nav-link" id="nav-tab-SubAssemblies" data-toggle="tab" href="#nav-SubAssemblies"
                           role="tab" aria-controls="nav-SubAssemblies" aria-selected="false">Sub Assemblies</a>
                        <a class="nav-link" id="nav-tab-StringBareConductor" data-toggle="tab"
                           href="#nav-StringBareConductor" role="tab" aria-controls="nav-StringBareConductor"
                           aria-selected="false">String Bare Conductor</a>
                        <a class="nav-link" id="nav-tab-StringInsulatedConductors" data-toggle="tab"
                           href="#nav-StringInsulatedConductors" role="tab"
                           aria-controls="nav-StringInsulatedConductors" aria-selected="false">String Insulated
                            Conductors</a>
                        <a class="nav-link" id="nav-tab-AdvancedMeteringInfrastructure" data-toggle="tab"
                           href="#nav-AdvancedMeteringInfrastructure"
                           role="tab" aria-controls="nav-AdvancedMeteringInfrastructure" aria-selected="false">Advanced
                            Metering Infrastructure</a>
                        <a class="nav-link" id="nav-tab-PoleSubstationStructure" data-toggle="tab"
                           href="#nav-PoleSubstationStructure" role="tab" aria-controls="nav-PoleSubstationStructure"
                           aria-selected="false">Pole Substation Structure</a>
                        <a class="nav-link" id="nav-tab-OverheadServicing" data-toggle="tab"
                           href="#nav-OverheadServicing"
                           role="tab" aria-controls="nav-OverheadServicing" aria-selected="false">Overhead Servicing</a>
                        <a class="nav-link" id="nav-tab-HVCableHeadPoles" data-toggle="tab" href="#nav-HVCableHeadPoles"
                           role="tab"
                           aria-controls="nav-HVCableHeadPoles" aria-selected="false">HV Cable Head Poles</a>
                        <a class="nav-link" id="nav-tab-StreetLighting,MajorRoad" data-toggle="tab"
                           href="#nav-StreetLighting,MajorRoad" role="tab"
                           aria-controls="nav-StreetLighting,MajorRoad" aria-selected="false">StreetLighting,Major
                            Road</a>
                        <a class="nav-link" id="nav-tab-StreetLighting,MinorRoad" data-toggle="tab"
                           href="#nav-StreetLighting,MinorRoad"
                           role="tab" aria-controls="nav-StreetLighting,MinorRoad" aria-selected="false">StreetLighting,Minor
                            Road</a>
                        <a class="nav-link" id="nav-tab-Lanterns,Globes,PECells" data-toggle="tab"
                           href="#nav-Lanterns,Globes,PECells"
                           role="tab" aria-controls="nav-Lanterns,Globes,PECells" aria-selected="false">Lanterns,
                            Globes, PE Cells</a>
                        <a class="nav-link" id="nav-tab-UndergroundCableConstruction-HVTermination&Joints"
                           data-toggle="tab" href="#nav-UndergroundCableConstruction-HVTermination&Joints"
                           role="tab" aria-controls="nav-UndergroundCableConstruction-HVTermination&Joints"
                           aria-selected="false">Underground Cable Construction - HV Termination & Joints</a>
                        <a class="nav-link" id="nav-tab-Subcontracts" data-toggle="tab"
                           href="#nav-Subcontracts" role="tab"
                           aria-controls="nav-Subcontracts" aria-selected="false">Subcontracts</a>

                        <li class="nav-item dropdown">
                            <a id="dropdown-more" class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
                               role="button" aria-haspopup="true" aria-expanded="false">More</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" id="nav-tab-UndergroundCableConstruction-LVTermination&Joints"
                                   data-toggle="tab"
                                   href="#nav-UndergroundCableConstruction-LVTermination&Joints" role="tab"
                                   aria-controls="nav-UndergroundCableConstruction-LVTermination&Joints"
                                   aria-selected="false">Underground Cable Construction - LV Termination & Joints</a>
                                <a class="dropdown-item" id="nav-tab-UndergroundCableOnly" data-toggle="tab"
                                   href="#nav-UndergroundCableOnly" role="tab"
                                   aria-controls="nav-UndergroundCableOnly" aria-selected="false">Underground Cable
                                    Only</a>
                                <a class="dropdown-item" id="nav-tab-CableInstallation" data-toggle="tab"
                                   href="#nav-CableInstallation" role="tab"
                                   aria-controls="nav-CableInstallation" aria-selected="false">Cable Installation</a>
                                <a class="dropdown-item" id="nav-tab-CableTesting" data-toggle="tab"
                                   href="#nav-CableTesting" role="tab"
                                   aria-controls="nav-CableTesting" aria-selected="false">Cable Testing</a>
                                <a class="dropdown-item" id="nav-tab-CivilReinstatementsandmiscellaneous"
                                   data-toggle="tab" href="#nav-CivilReinstatementsandmiscellaneous" role="tab"
                                   aria-controls="nav-CivilReinstatementsandmiscellaneous" aria-selected="false">Civil
                                    Reinstatements and miscellaneous</a>
                                <a class="dropdown-item" id="nav-tab-UndergroundServicing" data-toggle="tab"
                                   href="#nav-UndergroundServicing" role="tab" aria-controls="nav-UndergroundServicing"
                                   aria-selected="false">Underground Servicing</a>
                                <a class="dropdown-item" id="nav-tab-IndoorSubstations" data-toggle="tab"
                                   href="#nav-IndoorSubstations" role="tab"
                                   aria-controls="nav-IndoorSubstations" aria-selected="false">Indoor Substations</a>
                                <a class="dropdown-item" id="nav-tab-IndoorHVSwitchgear" data-toggle="tab"
                                   href="#nav-IndoorHVSwitchgear" role="tab"
                                   aria-controls="nav-IndoorHVSwitchgear" aria-selected="false">Indoor HV Switchgear</a>
                                <a class="dropdown-item" id="nav-tab-InstallHVSwitchingStation" data-toggle="tab"
                                   href="#nav-InstallHVSwitchingStation" role="tab"
                                   aria-controls="nav-InstallHVSwitchingStation" aria-selected="false">Install HV
                                    Switching Station</a>
                                <a class="dropdown-item" id="nav-tab-InstallTransformerCableEntry" data-toggle="tab"
                                   href="#nav-InstallTransformerCableEntry"
                                   role="tab" aria-controls="nav-InstallTransformerCableEntry" aria-selected="false">Install
                                    Transformer Cable Entry</a>
                                <a class="dropdown-item" id="nav-tab-InstallTransformerKiosk" data-toggle="tab"
                                   href="#nav-InstallTransformerKiosk" role="tab"
                                   aria-controls="nav-InstallTransformerKiosk"
                                   aria-selected="false">Install Transformer Kiosk</a>
                                <a class="dropdown-item" id="nav-tab-Earthing,PoleHVStructure" data-toggle="tab"
                                   href="#nav-Earthing,PoleHVStructure"
                                   role="tab" aria-controls="nav-Earthing,PoleHVStructure" aria-selected="false">Earthing,
                                    Pole HV Structure</a>
                                <a class="dropdown-item" id="nav-tab-Earthing,KioskPadmountSubstatione"
                                   data-toggle="tab" href="#nav-Earthing,KioskPadmountSubstation"
                                   role="tab" aria-controls="nav-Earthing,KioskPadmountSubstation"
                                   aria-selected="false">Earthing, Kiosk Padmount Substation</a>
                                <a class="dropdown-item" id="nav-tab-Earthing,HVSwitchingStation" data-toggle="tab"
                                   href="#nav-Earthing,HVSwitchingStation" role="tab"
                                   aria-controls="nav-Earthing,HVSwitchingStation"
                                   aria-selected="false">Earthing, HV Switching Station</a>
                                <a class="dropdown-item" id="nav-tab-Earthing,InstallationMethods" data-toggle="tab"
                                   href="#nav-Earthing,InstallationMethods" role="tab"
                                   aria-controls="nav-Earthing,InstallationMethods"
                                   aria-selected="false">Earthing, Installation Methods</a>
                                <a class="dropdown-item" id="nav-tab-Design&ProjectManagementServices-StandardProjects"
                                   data-toggle="tab"
                                   href="#nav-Design&ProjectManagementServices-StandardProjects" role="tab"
                                   aria-controls="nav-DesignProjectManagementServices-StandardProjects"
                                   aria-selected="false">Design & Project Management Services - Standard Projects</a>
                                <a class="dropdown-item"
                                   id="nav-tab-Minorminimumchargingactivityforsimplestscope(supplyavailable,offerletteronly)"
                                   data-toggle="tab"
                                   href="#nav-Minorminimumchargingactivityforsimplestscope(supplyavailable,offerletteronly)"
                                   role="tab"
                                   aria-controls="nav-Minorminimumchargingactivityforsimplestscope(supplyavailable,offerletteronly)"
                                   aria-selected="false">Minor - minimum charging activity for simplest scope (supply
                                    available, offer letter only)</a>
                                <a class="dropdown-item" id="nav-tab-TypeA"
                                   data-toggle="tab" href="#nav-TypeA" role="tab"
                                   aria-controls="nav-TypeA"
                                   aria-selected="false">Type A</a>
                                <a class="dropdown-item" id="nav-tab-TypeB" data-toggle="tab" href="#nav-TypeB"
                                   role="tab" aria-controls="nav-TypeB"
                                   aria-selected="false">Type B</a>
                                <a class="dropdown-item" id="nav-tab-TypeC" data-toggle="tab" href="#nav-TypeC"
                                   role="tab" aria-controls="nav-TypeC"
                                   aria-selected="false">Type C</a>
                                <a class="dropdown-item" id="nav-tab-TypeD" data-toggle="tab" href="#nav-TypeD"
                                   role="tab" aria-controls="nav-TypeD"
                                   aria-selected="false">Type D</a>
                                <a class="dropdown-item"
                                   id="nav-tab-Majorprojectrequiringcustomisednumberofhours(singleHourlyrate)"
                                   data-toggle="tab"
                                   href="#nav-Majorprojectrequiringcustomisednumberofhours(singleHourlyrate)" role="tab"
                                   aria-controls="nav-Majorprojectrequiringcustomisednumberofhours(singleHourlyrate)"
                                   aria-selected="false">Major - project requiring customised number of hours (single
                                    Hourly rate)</a>
                                <a class="dropdown-item" id="nav-tab-OtherDesignServices" data-toggle="tab"
                                   href="#nav-OtherDesignServices" role="tab"
                                   aria-controls="nav-OtherDesignServices" aria-selected="false">Other Design
                                    Services</a>
                                <a class="dropdown-item" id="nav-tab-Operating" data-toggle="tab" href="#nav-Operating"
                                   role="tab"
                                   aria-controls="nav-Operating" aria-selected="false">Operating</a>
                                <a class="dropdown-item" id="nav-tab-Retirements" data-toggle="tab"
                                   href="#nav-Retirements" role="tab"
                                   aria-controls="nav-Retirements" aria-selected="false">Retirements</a>
                                <a class="dropdown-item" id="nav-tab-AdditionalLabour-Excludesplant" data-toggle="tab"
                                   href="#nav-AdditionalLabour-Excludesplant" role="tab"
                                   aria-controls="nav-AdditionalLabour-Excludesplant" aria-selected="false">Additional
                                    Labour - Excludes plant</a>
                                <a class="dropdown-item" id="nav-tab-AdditionalPlant" data-toggle="tab"
                                   href="#nav-AdditionalPlant" role="tab" aria-controls="nav-AdditionalPlant"
                                   aria-selected="false">Additional Plant</a>
                                <a class="dropdown-item" id="nav-tab-ExtraOvertimecost" data-toggle="tab"
                                   href="#nav-ExtraOvertimecost" role="tab"
                                   aria-controls="nav-ExtraOvertimecost" aria-selected="false">Extra Overtime cost (for
                                    itemised activities)</a>
                                <a class="dropdown-item" id="nav-tab-Plant&Equipment" data-toggle="tab"
                                   href="#nav-Plant&Equipment" role="tab"
                                   aria-controls="nav-Plant&Equipment" aria-selected="false">Plant & Equipment</a>
                            </div>
                        </li>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-66kVConstruction" role="tabpanel"
                         aria-labelledby="nav-tab-66kVConstruction">
                        <div class="test">
                            <table class="table table-striped table-bordered">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Item Code</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals Quantity</th>
                                    <th scope="col">Recoverable Quantity</th>
                                    <th scope="col">Jemena Quantity</th>
                                    <th scope="col">LCTA Quantity</th>
                                    <th scope="col">Unit ($)</th>
                                    <th scope="col">Labour ($)</th>
                                    <th scope="col">Material ($)</th>
                                    <th scope="col">Plant ($)</th>
                                    <th scope="col">Subcontract ($)</th>
                                    <th scope="col">Unit Rate ($)</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal ($)</th>
                                    <th scope="col">Recoverable Subtotal ($)</th>
                                    <th scope="col">Jemena Subtotal ($)</th>
                                    <th scope="col">LCTA Subtotal ($)</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="kV_data in kV_data_all track by $index">
                                    <td>{{kV_data['code']}}</td>
                                    <td>{{kV_data['description']}}</td>
                                    <td><input type="text"
                                               ng-model="kV_data['actualsQty']"
                                               ng-change="qi_update_row(kV_data['actualsQty'], $index, 'kV_data_all', 'actualsQty')"
                                               class="form-control"
                                               value="{{kV_data['actualsQty']}}">
                                    </td>
                                    <td><input type="text" ng-model="kV_data['recouverableQty']"
                                               ng-change="qi_update_row(kV_data['recouverableQty'], $index, 'kV_data_all', 'recouverableQty')"
                                               class="form-control"
                                               value="{{kV_data['recouverableQty']}}"></td>
                                    <td><input type="text" ng-model="kV_data['jemenaQty']"
                                               ng-change="qi_update_row(kV_data['jemenaQty'], $index, 'kV_data_all', 'jemenaQty')"
                                               class="form-control"
                                               value="{{kV_data['jemenaQty']}}"></td>
                                    <td><input type="text" ng-model="kV_data['lcatQty']"
                                               ng-change="qi_update_row(kV_data['lcatQty'], $index, 'kV_data_all', 'lcatQty')"
                                               class="form-control"
                                               value="{{kV_data['lcatQty']}}"></td>
                                    <td>{{kV_data['unit']}}</td>
                                    <td>{{kV_data['labour']}}</td>
                                    <td>{{kV_data['material']}}</td>
                                    <td>{{kV_data['plant']}}</td>
                                    <td>{{kV_data['subcontract']}}</td>
                                    <td>{{kV_data['unitRate']}}</td>
                                    <td>{{kV_data['manhours']}}</td>
                                    <td>{{kV_data['actualsSubTotal'] | number: 2 }}</td>
                                    <td>{{kV_data['recouverableSubTotal'] | number: 2 }}</td>
                                    <td>{{kV_data['jemenaSubTotal'] | number: 2 }}</td>
                                    <td>{{kV_data['lcatSubTotal'] | number: 2 }}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
<%--                        <div class="row">--%>
<%--                            <table class="table table-striped table-bordered">--%>
<%--                                <thead id="title">--%>
<%--                                <tr>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col"></th>--%>
<%--                                    <th scope="col">Actuals Subtotal ($)</th>--%>
<%--                                    <th scope="col">Recoverable Subtotal ($)</th>--%>
<%--                                    <th scope="col">Jemena Subtotal ($)</th>--%>
<%--                                    <th scope="col">LCTA Subtotal ($)</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody>--%>
<%--                                <tr>--%>
<%--                                    <td colspan="13"></td>--%>
<%--                                    <td>Mark</td>--%>
<%--                                    <td>Mark</td>--%>
<%--                                    <td>Otto</td>--%>
<%--                                    <td>@mdo</td>--%>
<%--                                </tr>--%>
<%--                                </tbody>--%>
<%--                            </table>--%>
<%--                        </div>--%>
                    </div>

                    <div class="tab-pane fade" id="nav-HVConstruction" role="tabpanel"
                         aria-labelledby="nav-tab-HVConstruction">
                        <div class="test">
                            <table class="table table-striped table-bordered">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Item Code</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals Quantity</th>
                                    <th scope="col">Recoverable Quantity</th>
                                    <th scope="col">Jemena Quantity</th>
                                    <th scope="col">LCTA Quantity</th>
                                    <th scope="col">Unit ($)</th>
                                    <th scope="col">Labour ($)</th>
                                    <th scope="col">Material ($)</th>
                                    <th scope="col">Plant ($)</th>
                                    <th scope="col">Subcontract ($)</th>
                                    <th scope="col">Unit Rate ($)</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal ($)</th>
                                    <th scope="col">Recoverable Subtotal ($)</th>
                                    <th scope="col">Jemena Subtotal ($)</th>
                                    <th scope="col">LCTA Subtotal ($)</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="hV_data in hV_data_all track by $index">
                                    <td>{{hV_data['code']}}</td>
                                    <td>{{hV_data['description']}}</td>
                                    <td><input type="text"
                                               ng-model="hV_data['actualsQty']"
                                               ng-change="qi_update_row(hV_data['actualsQty'], $index, 'hV_data_all', 'actualsQty')"
                                               class="form-control"
                                               value="{{hV_data['actualsQty']}}">
                                    </td>
                                    <td><input type="text" ng-model="hV_data['recouverableQty']"
                                               ng-change="qi_update_row(hV_data['recouverableQty'], $index, 'hV_data_all', 'recouverableQty')"
                                               class="form-control"
                                               value="{{hV_data['recouverableQty']}}"></td>
                                    <td><input type="text" ng-model="hV_data['jemenaQty']"
                                               ng-change="qi_update_row(hV_data['jemenaQty'], $index, 'hV_data_all', 'jemenaQty')"
                                               class="form-control"
                                               value="{{hV_data['jemenaQty']}}"></td>
                                    <td><input type="text" ng-model="hV_data['lcatQty']"
                                               ng-change="qi_update_row(hV_data['lcatQty'], $index, 'hV_data_all', 'lcatQty')"
                                               class="form-control"
                                               value="{{hV_data['lcatQty']}}"></td>
                                    <td>{{hV_data['unit']}}</td>
                                    <td>{{hV_data['labour']}}</td>
                                    <td>{{hV_data['material']}}</td>
                                    <td>{{hV_data['plant']}}</td>
                                    <td>{{hV_data['subcontract']}}</td>
                                    <td>{{hV_data['unitRate']}}</td>
                                    <td>{{hV_data['manhours']}}</td>
                                    <td>{{hV_data['actualsSubTotal'] | number: 2 }}</td>
                                    <td>{{hV_data['recouverableSubTotal'] | number: 2 }}</td>
                                    <td>{{hV_data['jemenaSubTotal'] | number: 2 }}</td>
                                    <td>{{hV_data['lcatSubTotal'] | number: 2 }}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-2">
                                <h4>Total</h4>
                            </div>
                            <div class="col-2">
                                <h4>12345</h4>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="nav-LVConstruction" role="tabpanel"
                         aria-labelledby="nav-tab-LVConstruction">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="nav-HVlineSwitchesIsolation" role="tabpanel"
                         aria-labelledby="nav-tab-HVlineSwitchesIsolation">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-SubAssemblies" role="tabpanel"
                         aria-labelledby="nav-tab-SubAssemblies">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-StringBareConductor" role="tabpanel"
                         aria-labelledby="nav-tab-StringBareConductor">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-StringInsulatedConductors" role="tabpanel"
                         aria-labelledby="nav-tab-StringInsulatedConductors">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-AdvancedMeteringInfrastructure" role="tabpanel"
                         aria-labelledby="nav-tab-AdvancedMeteringInfrastructure">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-PoleSubstationStructure" role="tabpanel"
                         aria-labelledby="nav-tab-PoleSubstationStructure">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-OverheadServicing" role="tabpanel"
                         aria-labelledby="nav-tab-OverheadServicing">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-HVCableHeadPoles" role="tabpanel"
                         aria-labelledby="nav-tab-HVCableHeadPoles">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-StreetLighting,MajorRoad" role="tabpanel"
                         aria-labelledby="nav-tab-StreetLighting,MajorRoad">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-StreetLighting,MinorRoad" role="tabpanel"
                         aria-labelledby="nav-tab-StreetLighting,MinorRoad">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-Lanterns,Globes,PECells" role="tabpanel"
                         aria-labelledby="nav-tab-Lanterns,Globes,PECells">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-UndergroundCableConstruction-HVTermination&Joints"
                         role="tabpanel"
                         aria-labelledby="nav-tab-UndergroundCableConstruction-HVTermination&Joints">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-Subcontracts" role="tabpanel"
                         aria-labelledby="nav-tab-Subcontracts">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-UndergroundCableConstruction-LVTermination&Joints"
                         role="tabpanel" aria-labelledby="nav-tab-UndergroundCableConstruction-LVTermination&Joints">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-UndergroundCableOnly" role="tabpanel"
                         aria-labelledby="nav-tab-UndergroundCableOnly">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-CableInstallation" role="tabpanel"
                         aria-labelledby="nav-tab-CableInstallation">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-CableTesting" role="tabpanel"
                         aria-labelledby="nav-tab-CableTesting">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-CivilReinstatementsandmiscellaneous" role="tabpanel"
                         aria-labelledby="nav-tab-CivilReinstatementsandmiscellaneous">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-UndergroundServicing" role="tabpanel"
                         aria-labelledby="nav-tab-UndergroundServicing">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-IndoorSubstations" role="tabpanel"
                         aria-labelledby="nav-tab-IndoorSubstations">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-IndoorHVSwitchgear" role="tabpanel"
                         aria-labelledby="nav-tab-IndoorHVSwitchgear">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-InstallHVSwitchingStation" role="tabpanel"
                         aria-labelledby="nav-tab-InstallHVSwitchingStation">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-InstallTransformerCableEntry" role="tabpanel"
                         aria-labelledby="nav-tab-InstallTransformerCableEntry">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-InstallTransformerKiosk" role="tabpanel"
                         aria-labelledby="nav-tab-InstallTransformerKiosk">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-Earthing,PoleHVStructure" role="tabpanel"
                         aria-labelledby="nav-tab-Earthing,PoleHVStructure">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-Earthing,KioskPadmountSubstation" role="tabpanel"
                         aria-labelledby="nav-tab-Earthing,KioskPadmountSubstation">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-Earthing,HVSwitchingStation" role="tabpanel"
                         aria-labelledby="nav-tab-Earthing,HVSwitchingStation">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-Earthing,InstallationMethods" role="tabpanel"
                         aria-labelledby="nav-tab-Earthing,InstallationMethods">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-Design&ProjectManagementServices-StandardProjects"
                         role="tabpanel"
                         aria-labelledby="nav-tab-Design&ProjectManagementServices-StandardProjects">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade"
                         id="nav-Minorminimumchargingactivityforsimplestscope(supplyavailable,offerletteronly)"
                         role="tabpanel"
                         aria-labelledby="nav-tab-Minorminimumchargingactivityforsimplestscope(supplyavailable,offerletteronly)">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-TypeA"
                         role="tabpanel"
                         aria-labelledby="nav-tab-TypeA">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-TypeB" role="tabpanel" aria-labelledby="nav-tab-TypeB">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-TypeC" role="tabpanel" aria-labelledby="nav-tab-TypeC">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-TypeD" role="tabpanel" aria-labelledby="nav-tab-TypeD">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-Majorprojectrequiringcustomisednumberofhours(singleHourlyrate)"
                         role="tabpanel"
                         aria-labelledby="nav-tab-Majorprojectrequiringcustomisednumberofhours(singleHourlyrate)">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-OtherDesignServices" role="tabpanel"
                         aria-labelledby="nav-tab-OtherDesignServices">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-Operating" role="tabpanel" aria-labelledby="nav-tab-Operating">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-Retirements" role="tabpanel"
                         aria-labelledby="nav-tab-Retirements">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-AdditionalLabour-Excludesplant" role="tabpanel"
                         aria-labelledby="nav-tab-AdditionalLabour-Excludesplant">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-AdditionalPlant" role="tabpanel"
                         aria-labelledby="nav-tab-AdditionalPlant">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-ExtraOvertimecost" role="tabpanel"
                         aria-labelledby="nav-tab-ExtraOvertimecost">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-Plant&Equipment" role="tabpanel"
                         aria-labelledby="nav-tab-Plant&Equipment">
                        <div class="test">
                            <table class="table table-striped">
                                <thead id="title">
                                <tr>
                                    <th scope="col">Description</th>
                                    <th scope="col">Actuals</th>
                                    <th scope="col">Recoverable</th>
                                    <th scope="col">Jemena</th>
                                    <th scope="col">LCTA</th>
                                    <th scope="col">Unit</th>
                                    <th scope="col">Labour</th>
                                    <th scope="col">Material</th>
                                    <th scope="col">Plant</th>
                                    <th scope="col">Subcontract</th>
                                    <th scope="col">Unit Rate</th>
                                    <th scope="col">Manhours</th>
                                    <th scope="col">Actuals Subtotal</th>
                                    <th scope="col">Recoverable Subtotal</th>
                                    <th scope="col">Jemena Subtotal</th>
                                    <th scope="col">LCTA Subtotal</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row"></th>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div>
                            <span class="Total">Total </span>
                            <div class="total">
                            </div>

                            <button class="savebtn">
                                Save
                            </button>
                            <button class="draft">
                                Save as draft
                            </button>
                        </div>
                        <div>
                            <ul class="pagination">
                                <li><a href="#">«</a></li>
                                <li><a class="active" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">6</a></li>
                                <li><a href="#">7</a></li>
                                <li><a href="#">»</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row d-flex flex-row-reverse">
                    <div class="col-lg-1 d-flex justify-content-end">
                        <button type="button" class="btn btn-success"
                                ng-click="save_quantity_input_data()">Save data
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--    <script>--%>
    <%--        let sidebar = document.querySelector(".sidebar");--%>
    <%--        let closeBtn = document.querySelector("#btn");--%>

    <%--        closeBtn.addEventListener("click", () => {--%>
    <%--            sidebar.classList.toggle("open");--%>
    <%--            menuBtnChange();--%>
    <%--        });--%>

    <%--        function menuBtnChange() {--%>
    <%--            if (sidebar.classList.contains("open")) {--%>
    <%--                closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");--%>
    <%--                document.getElementById("Jem-logo").style.visibility = "visible";--%>
    <%--            } else {--%>
    <%--                closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");--%>
    <%--                document.getElementById("Jem-logo").style.visibility = "hidden";--%>
    <%--            }--%>
    <%--        }--%>

    <%--        function changeTab(evt, tabID) {--%>
    <%--            // Declare all variables--%>
    <%--            var i, tabcontent, tablinks;--%>

    <%--            // Get all elements with class="tabcontent" and hide them--%>
    <%--            tabcontent = document.getElementsByClassName("tab-content");--%>
    <%--            for (i = 0; i < tabcontent.length; i++) {--%>
    <%--                tabcontent[i].style.display = "none";--%>
    <%--            }--%>

    <%--            // Get all elements with class="tablinks" and remove the class "active"--%>
    <%--            tablinks = document.getElementsByClassName("nav-link");--%>
    <%--            for (i = 0; i < tablinks.length; i++) {--%>
    <%--                tablinks[i].className = tablinks[i].className.replace(" active", "");--%>
    <%--            }--%>

    <%--            // Show the current tab, and add an "active" class to the button that opened the tab--%>
    <%--            document.getElementById(cityName).style.display = "block";--%>
    <%--            evt.currentTarget.className += " active";--%>

    <%--        }--%>

    <%--        $('#nav-tab').on('shown.bs.tab', 'a', function (e) {--%>
    <%--            if (e.relatedTarget) {--%>
    <%--                $(e.relatedTarget).removeClass('active');--%>
    <%--                if ($(e.relatedTarget).hasClass('dropdown-item')) {--%>
    <%--                    $('#dropdown-more').removeClass('active');--%>
    <%--                }--%>
    <%--            }--%>
    <%--        })--%>

    <%--    </script>--%>
</section>
</body>
</html>
