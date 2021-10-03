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
    <link rel="stylesheet" href="<%=path%>static/css/addUser.css"/>
</head>

<body ng-app="main_app" id="main" ng-controller="controller">
<%@ include file="common/sidebar.jspf" %>
<section class="home_section">
    <div class="container-fluid contentWrapper">
        <div class="container content">
            <h1 style="margin: 2vh;">Customer Contribution - Basic Data</h1>
            <div class="row">
                <div class="col-12">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="exclusions-tab" data-toggle="tab" href="#exclusions"
                               role="tab"
                               aria-controls="exclusions" aria-selected="true">Scope Exclusions</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="assumptions-tab" data-toggle="tab" href="#assumptions" role="tab"
                               aria-controls="assumptions" aria-selected="false">Assumptions</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="exclusions" role="tabpanel"
                             aria-labelledby="exclusions-tab">
                            <div class="col-xl-12 col-lg-12">
                                <div class="card shadow mt-5 mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Scope Exclusion - Add Basic
                                            Data</h6>
                                        <div class="dropdown no-arrow">
                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                                        <label for="scopeExclusionItemDescription">Scope exclusion item
                                                            description</label>
                                                        <input id="scopeExclusionItemDescription"
                                                               ng-model="scopeExclusionItemDescription"
                                                               type="text"
                                                               class="form-control"
                                                               placeholder="Enter scope exclusion item description"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row" ng-show="scopeExclusionItemDescriptionDataError">
                                                <div class="col">
                                                    <h6 style="color: red">Error in data!</h6>
                                                </div>
                                            </div>
                                            <div class="row" ng-show="scopeExclusionItemDescriptionDataSuccess">
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
                        <div class="tab-pane fade" id="assumptions" role="tabpanel" aria-labelledby="assumptions-tab">
                            <div class="col-xl-12 col-lg-12">
                                <div class="card shadow mt-5 mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Assumptions - Add Basic
                                            Data</h6>
                                        <div class="dropdown no-arrow">
                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                                        <label for="scopeAssumptionItemDescription">Assumption item
                                                            description</label>
                                                        <input id="scopeAssumptionItemDescription"
                                                               ng-model="scopeAssumptionItemDescription"
                                                               type="text"
                                                               class="form-control"
                                                               placeholder="Enter assumption item description"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row" ng-show="scopeAssumptionItemDescriptionDataError">
                                                <div class="col">
                                                    <h6 style="color: red">Error in data!</h6>
                                                </div>
                                            </div>
                                            <div class="row" ng-show="scopeAssumptionItemDescriptionDataSuccess">
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
</section>

<script>
    let sidebar = document.querySelector(".sidebar");
    let closeBtn = document.querySelector("#btn");

    closeBtn.addEventListener("click", () => {
        sidebar.classList.toggle("open");
        menuBtnChange();
    });

    function menuBtnChange() {
        if (sidebar.classList.contains("open")) {
            closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");
            document.getElementById("Jem-logo").style.visibility = "visible";
        } else {
            closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");
            document.getElementById("Jem-logo").style.visibility = "hidden";
        }
    }
</script>
</body>
</html>
