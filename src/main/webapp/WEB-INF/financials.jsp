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
                            <a class="nav-link active" href="financials_page">Financials</a>
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
            <h2 style="margin: 2vh; text-align: center; font-weight: 600;">Financials</h2>
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mt-5 mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">CIC Project Details</h6>
                            <div class="col-2 d-flex justify-content-end">
                                <p>WBS Element:</p>
                                <p>12345</p>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="row" style="margin-left: -8px; margin-right: -8px">
                                <div class="col-12 d-flex justify-content-center"
                                     style="border: 1px solid rgba(0,0,0,.125); padding: 5px">
                                    CIC Project Estimate
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped table-light table-bordered table-hover dom-jQuery-events"
                                       style="text-align: center; margin: 0">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>Task</th>
                                        <th>Labour ($)</th>
                                        <th>Materials ($)</th>
                                        <th>Plant ($)</th>
                                        <th>Contracts ($)</th>
                                        <th>Total ($)</th>
                                    </tr>
                                    <tr>
                                        <th scope="col" colspan="6">ZINFRA CIC TEMPLATE RATES (FIXED PRICE)</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            Test 1
                                        </td>
                                        <td>
                                            Test 1
                                        </td>
                                        <td>
                                            Test 1
                                        </td>
                                        <td>
                                            Test 1
                                        </td>
                                        <td>
                                            Test 1
                                        </td>
                                        <td>
                                            Test 1
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            CUSTOMER SUB TOTAL
                                        </td>
                                        <td>
                                            123
                                        </td>
                                        <td>
                                            123
                                        </td>
                                        <td>
                                            123
                                        </td>
                                        <td>
                                            123
                                        </td>
                                        <td>
                                            123
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            JEMENA Funded Additional Works
                                        </td>
                                        <td>
                                            123
                                        </td>
                                        <td>
                                            123
                                        </td>
                                        <td>
                                            123
                                        </td>
                                        <td>
                                            123
                                        </td>
                                        <td>
                                            123
                                        </td>
                                    </tr>
                                    <tr>
                                        <td scope="col" colspan="5">
                                            Total Zinfra Direct Costs (Zinfra Budget)
                                        </td>
                                        <td>
                                            $7,819.52
                                        </td>
                                    </tr>
                                    <tr>
                                        <td scope="col" colspan="5">
                                            Zinfra Margin
                                        </td>
                                        <td>
                                            $7,819.52
                                        </td>
                                    </tr>
                                    <tr>
                                        <td scope="col" colspan="5">
                                            Total Zinfra Template Fixed Price
                                        </td>
                                        <td>
                                            $7,819.52
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                </table>
                            </div>
                            <div class="row" style="margin-left: -8px; margin-right: -8px">
                                <div class="col-12 d-flex justify-content-center"
                                     style="border: 1px solid rgba(0,0,0,.125); padding: 5px">
                                    FINANCIAL DISTRIBUTION
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-5">
                                    <div class="row">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-light table-bordered table-hover dom-jQuery-events"
                                                   style="text-align: center; margin: 0">
                                                <thead class="thead-light">
                                                <tr>
                                                    <th scope="col" colspan="2">CUSTOMER CONTRIBUTION</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>Customer Project Subtotal</td>
                                                    <td>$6,197.10</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-light table-bordered table-hover dom-jQuery-events"
                                                   style="text-align: center; margin: 0">
                                                <tbody>
                                                <tr>
                                                    <td>LCTA Cost</td>
                                                    <td>$0.00</td>
                                                </tr>
                                                <tr>
                                                    <td>Total Customer Contribution (Exc GST)</td>
                                                    <td>$7,684.40</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-light table-bordered table-hover dom-jQuery-events"
                                                   style="text-align: center; margin: 0">
                                                <tbody>
                                                <tr>
                                                    <td>Project Fee Category</td>
                                                    <td><select class="form-select form-select-sm"
                                                                aria-label=".form-select-sm example">
                                                        <option selected>Open this select menu</option>
                                                        <option value="1">One</option>
                                                        <option value="2">Two</option>
                                                        <option value="3">Three</option>
                                                    </select></td>
                                                </tr>
                                                <tr>
                                                    <td>PROJECT FEE PAID</td>
                                                    <td>$2,000.00</td>
                                                </tr>
                                                <tr>
                                                    <td>Customer Contribution Balance</td>
                                                    <td>$5,684.40</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-light table-bordered table-hover dom-jQuery-events"
                                                   style="text-align: center; margin: 0">
                                                <tbody>
                                                <tr>
                                                    <td>GST Component</td>
                                                    <td>$568.44</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-light table-bordered table-hover dom-jQuery-events"
                                                   style="text-align: center; margin: 0">
                                                <tbody>
                                                <tr>
                                                    <td>Customer Contribution (Inc. GST)</td>
                                                    <td>$6,252.84</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-7">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-light table-bordered table-hover dom-jQuery-events"
                                               style="text-align: center; margin: 0">
                                            <thead class="thead-light">
                                            <tr>
                                                <th scope="col" colspan="2">FINANCIAL DISTRIBUTION</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>Jemena Contribution to Customer Project Cost</td>
                                                <td>$1,930.58</td>
                                            </tr>
                                            </tbody>
                                        </table>
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
