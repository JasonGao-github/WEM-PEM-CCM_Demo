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
        <div class="container content d-flex flex-column">
            <h1 style="margin: 2vh;">CUSTOMER INTIATED CAPTICAL(Statement
                of Work)</h1>
            <form class="form container" name="newUser" action="" method="POST"
                  style="justify-content: center">

                <div class="basic">
                    <div class="row">
                        <div class="col-lg-2">
                            <h3>Jemena WBS</h3>
                        </div>
                        <div class="col-lg-3">
                            <input ng-model="WBS" type="text" name="WBS"/>
                        </div>
                        <div class="col-lg-2">
                            <h3>Inquiry Number</h3>
                        </div>
                        <div class="col-lg-5">
                            <input ng-model="inqNumber" type="text" name="inqNumber"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-2">
                            <h3>Jeemena SAPPM Order</h3>
                        </div>
                        <div class="col-lg-3">
                            <input ng-model="SAPPM" type="text" name="SAPPM"/>
                        </div>
                        <div class="col-lg-2">
                            <h3>Project Title</h3>
                        </div>
                        <div class="col-lg-5">
                            <input ng-model="title" type="text" name="title"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-2">
                            <h3>Zinfra WBS</h3>
                        </div>
                        <div class="col-lg-10">
                            <input ng-model="zinfraWBS" type="text" name="zinfraWBS"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-2">
                            <h3>Project Type</h3>
                        </div>
                        <div class="col-lg-10">
                            <select id="projectType" placeholder="Select position">
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
                            <input ng-model="address" type="text" name="address"/>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-5">
                            <input type="checkbox" id="non-contestable"> <label
                                for="non-contestable">Non-Contestable</label>
                        </div>
                        <div class="col-lg-5">
                            <input type="checkbox" id="avoidid-costs"> <label
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
                            <h3>Reason of Works
                        </div>
                        </h3>
                        <div class="col-lg-10">
                            <input ng-model="reason" type="text" name="reason"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2">
                            <h3>Scope of Works</h3>
                        </div>
                        <div class="col-lg-10">
                            <textarea ng-model="Customer-scope" rows="3"></textarea>
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
                            <textarea ng-model="Jemena-scope" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2">
                            <h3>Scope of Exclusions</h3>
                        </div>
                        <div class="col-lg-10">
                            <textarea ng-model="Jemena-scope" rows="3"></textarea>
                        </div>
                    </div>
                </div>
                <div class="row d-flex flex-row-reverse">
                    <div class="col-lg-1 d-flex justify-content-end">
                        <a href="quantity_input_page">
                            <button type="button" class="btn btn-primary">Go to Quantity Input</button>
                        </a>
                    </div>
                </div>
            </form>

            <% int curr_page = 1; %>
            <%@ include file="common/pagesBar.jspf" %>
        </div>
    </div>
</section>
</body>
</html>
