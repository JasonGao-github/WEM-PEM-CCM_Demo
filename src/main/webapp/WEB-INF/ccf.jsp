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
                            <a class="nav-link active" href="ccf_page">Customer Contribution</a>
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
                            <a class="nav-link" href="#">Approvers</a>
                        </li>
                    </ul>
                </div>
            </div>
            <h2 style="margin: 2vh; text-align: center; font-weight: 600;">Customer Initiated Capital - Statement of
                Work</h2>
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mb-4" style="border-radius: 15px">
                        <div class="card-body">
                            <form class="form container" name="ccPage" action="" method="POST"
                                  style="justify-content: center">

                                <div class="basic">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <h3>Jemena WBS</h3>
                                        </div>
                                        <div class="col-lg-3">
                                            <input ng-model="cc_wbs" class="form-control" type="text" name="WBS"/>
                                        </div>
                                        <div class="col-lg-2">
                                            <h3>Inquiry Number</h3>
                                        </div>
                                        <div class="col-lg-5">
                                            <input ng-model="cc_inquiryNumber" class="form-control" type="text"
                                                   name="inqNumber"/>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-2">
                                            <h3>Jeemena SAPPM Order</h3>
                                        </div>
                                        <div class="col-lg-3">
                                            <input ng-model="cc_SAPPM_order" class="form-control" type="text"
                                                   name="SAPPM"/>
                                        </div>
                                        <div class="col-lg-2">
                                            <h3>Zinfra WBS</h3>
                                        </div>
                                        <div class="col-lg-5">
                                            <input ng-model="cc_zinfraWBS" class="form-control" type="text"
                                                   name="zinfraWBS"/>
                                        </div>
                                    </div>

                                    <%--                    <div class="row">--%>
                                    <%--                        <div class="col-lg-2">--%>
                                    <%--                            <h3>Allocate Project Manager</h3>--%>
                                    <%--                        </div>--%>
                                    <%--                        <div class="col-lg-10">--%>
                                    <%--                            <select id="allocatePMCC" placeholder="Select project manager"--%>
                                    <%--                                    ng-model="cc_allocate_project_manager">--%>
                                    <%--                                <option value="" selected disabled hidden>Select--%>
                                    <%--                                    Project Manager--%>
                                    <%--                                </option>--%>
                                    <%--                                <option value="NG">Project Manager name 1</option>--%>
                                    <%--                                <option value="URD">Project Manager name 2</option>--%>
                                    <%--                            </select>--%>
                                    <%--                        </div>--%>
                                    <%--                    </div>--%>

                                    <div class="row">
                                        <div class="col-lg-2">
                                            <h3>Project Title</h3>
                                        </div>
                                        <div class="col-lg-10">
                                            <input ng-model="cc_project_title" class="form-control" type="text"
                                                   name="title"/>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-2">
                                            <h3>Project Type</h3>
                                        </div>
                                        <div class="col-lg-10">
                                            <select id="projectType" placeholder="Select position" class="form-control"
                                                    ng-model="cc_project_type">
                                                <option value="" selected disabled hidden>Select
                                                    Project Type
                                                </option>
                                                <option value="NG">Negotiated Connection</option>
                                                <option value="URD">URD</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-2">
                                            <h3>Supply Address</h3>
                                        </div>
                                        <div class="col-lg-10">
                                            <input ng-model="cc_supply_address" class="form-control" type="text"
                                                   name="address"/>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-4"><input type="checkbox" id="LCTA"> <label
                                                for="LCTA">LCTA</label></div>
                                        <div class="col-lg-4">
                                            <input type="checkbox" id="non-contestable" class="form-control"> <label
                                                for="non-contestable">Non-Contestable</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <input type="checkbox" id="avoidid-costs" class="form-control"> <label
                                                for="avoidid-costs">Avoided-Costs</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="CustomerFunded">
                                    <div class="row">
                                        <div class="col-lg-2"></div>
                                        <h3>Customer Funded Works</h3>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <h3>Reason of Works</h3>
                                        </div>
                                        <div class="col-lg-10">
                                            <input ng-model="cc_reason_of_work" type="text" class="form-control"
                                                   name="reason"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <h3>Scope of Works</h3>
                                        </div>
                                        <div class="col-lg-10">
                                        <textarea ng-model="cc_customer_scope_of_work" class="form-control"
                                                  rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="JemenaFunded">
                                    <div class="row">
                                        <div class="col-lg-2"></div>
                                        <h3>Jemena Funded Works</h3>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <h3>Scope of Works</h3>
                                        </div>
                                        <div class="col-lg-10">
                                        <textarea ng-model="cc_jemena_scope_of_work" class="form-control"
                                                  rows="3"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <h3>Scope of Exclusions</h3>
                                        </div>
                                        <div class="col-lg-10">
                                        <textarea ng-model="cc_jemena_scope_of_exclusions" class="form-control"
                                                  rows="3"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <h3>Assumptions</h3>
                                        </div>
                                        <div class="col-lg-10">
                                            <textarea ng-model="cc_assumptions" class="form-control"
                                                      rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2"><input type="checkbox" id="revised_SOW"> <label
                                            for="revised_SOW">Revised SOW</label></div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <h3>Zinfra Fixed Price</h3>
                                    </div>
                                    <div class="col-lg-3">
                                        <input ng-model="zinfra_fixed_price" class="form-control" type="text"
                                               name="zinfra_Fixed_Price"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <h3>Other Costs (O/H's, FIM)</h3>
                                    </div>
                                    <div class="col-lg-3">
                                        <input ng-model="cc_other_costs" class="form-control" type="text"
                                               name="other_costs"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <h3>Total Asset Value (JEN Project Budget)</h3>
                                    </div>
                                    <div class="col-lg-3">
                                        <input ng-model="cc_total_asset_value" class="form-control" type="text"
                                               name="total_asset_value"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <h3>ZRO ∆</h3>
                                    </div>
                                    <div class="col-lg-3">
                                        <input ng-model="cc_ZRO" class="form-control" type="text" name="zro"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <h3>Total Customer Contribution</h3>
                                    </div>
                                    <div class="col-lg-3">
                                        <input ng-model="cc_total_customer_contribution" class="form-control"
                                               type="text"
                                               name="total_customer_contribution"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <h3>Balance of contribution after project fee</h3>
                                    </div>
                                    <div class="col-lg-3">
                                        <input ng-model="cc_balance_of_contribution" type="text" class="form-control"
                                               name="balance_of_contribution"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <h3>JEN Contribution to Project</h3>
                                    </div>
                                    <div class="col-lg-3">
                                        <input ng-model="cc_jen_contribution_to_project" class="form-control"
                                               type="text"
                                               name="cc_jen_contribution_to_project"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <h3>Customer Supply Requested Target Date</h3>
                                    </div>
                                    <div class="col-lg-3">
                                        <input ng-model="cc_customer_supply_requested_target_date" class="form-control"
                                               type="text"
                                               name="cc_customer_supply_requested_target_date"/>
                                    </div>
                                </div>
                                <div class="row d-flex flex-row-reverse">
                                    <div class="col-lg-1 d-flex justify-content-end">

                                        <button type="button" class="btn btn-primary"
                                                ng-click="create_customer_contribution()">Go to
                                            Quantity Input
                                        </button>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <% int curr_page = 1; %>
            <%@ include file="common/pagesBar.jspf" %>
        </div>
    </div>
</section>
</body>
</html>
