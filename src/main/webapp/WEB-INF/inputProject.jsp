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
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>
    <script type="text/javascript"
            src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
</head>


<body ng-app="main_app" id="main" ng-controller="controller"
      ng-init="conn_handover_getData()">
<%@ include file="common/sidebar.jspf" %>
<section class="home_section">
    <div class="container-fluid contentWrapper">
        <div class="container content" id="content">
            <div class="row">
                <div class="col-12">
                    <ul class="nav nav-pills"
                        style="padding: 10px; border: 1px solid rgba(0, 0, 0, .125); border-radius: 15px;">
                        <li class="nav-item"><a class="nav-link" href="project_home_page">Project
                            Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="ccf_page">Customer
                            Contribution</a></li>
                        <li class="nav-item"><a class="nav-link"
                                                href="quantity_input_page">Quantity Input</a></li>
                        <li class="nav-item"><a class="nav-link" href="ncc_page">Non-contestable
                            Costs Input</a></li>
                        <li class="nav-item"><a class="nav-link" href="fim_page">FIM
                            Input</a></li>
                        <li class="nav-item"><a class="nav-link"
                                                href="avoided_cost_page">Avoided Costs Input</a></li>
                        <li class="nav-item"><a class="nav-link"
                                                href="financials_page">Financials</a></li>
                        <li class="nav-item"><a class="nav-link" href="design_page">Design</a>
                        </li>
                        <li class="nav-item"><a class="nav-link"
                                                href="conHandover_page">Connection Handover</a></li>
                        <li class="nav-item"><a class="nav-link"
                                                href="contract_schedule_page">Contract Schedule</a></li>
                        <li class="nav-item"><a class="nav-link active"
                                                href="input_project_page">Inputs | Projects</a></li>
                        <li class="nav-item"><a class="nav-link" href="approvals">Approvers</a>
                        </li>
                    </ul>
                </div>
            </div>

            <nav>
                <div class="title">Input Project</div>
            </nav>
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mb-4" style="border-radius: 15px">
                        <div class="card-body">
                            <div>
                                <span class="item">Project Number</span> <input class="testing"
                                                                                type="text" placeholder="Type">
                            </div>
                            <div>
                                <span class="item">Project Name</span> <input class="testing"
                                                                              type="text" placeholder="Type">
                            </div>
                            <div>
                                <span class="item">Supply Address</span> <input class="testing"
                                                                                type="text" placeholder="Type">
                            </div>
                            <br>
                            <!-- <div>
                                <span class="item">Show Contestable / Non Contestable
                                    Breakdown</span> <select name="group" id="group">
                                    <option value=""></option>
                                    <option value="No">No</option>
                                    <option value="Yes">Yes</option>
                                </select>
                            </div> -->
                            <form class="form container" style="justify-content: center">

                                <table
                                        class="table table-striped table-light table-bordered table-hover dom-jQuery-events"
                                        id="connectionAsset" style="text-align: center; margin: 0">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>Capex Breakdown by Cost Component</th>
                                        <th>Total</th>
                                        <th>Non-Contestable</th>
                                        <th>Contestable</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="font-weight-bold">
                                        <td>Connection Assets (Customer Specific Costs)</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Project Management, Design and Estimation Costs</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Construction costs (incl materials)</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Tendering Costs</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Contractor Management and Administration Costs
                                            (applicable to contestability)
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>* HV Equalisation Charge is now part of the total
                                            project costs
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                    <tr class="font-weight-bold">
                                        <td>Other Project Costs</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Connection costs above Least Cost Technically
                                            Acceptable option
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Public Lighting Component</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Customer initiated undergrounding and/or
                                            rearrangement of distribution assets servicing the customer
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                    <tr class="font-weight-bold">
                                        <td>Total Project Cost (as per PAS)</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Pioneer Scheme charges (if applicable)</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Less JEN's avoided cost as a result of customer
                                            initated undergrounding/relocation of distribution assets
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Less Application Fee / Pre Payment already paid
                                            (including GST)
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    </tbody>
                                </table>
                                <p>NOTE: This model is not required for Basic Connection Services (new connections below
                                    100A/400V supply, basic alterations or basic micro-embedded generation connections).
                                    Refer to Jemena's Connection Policy for further details</p>

                            </form>
                        </div>

                    </div>
                </div>

            </div>
        </div>
</section>
</body>
</html>
