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
            <h1 style="margin: 2vh;">Users</h1>
            <br>
            <div class="row" style="margin-left: 0px">
                <div class="col-2">
                    <button type="button" id="add_new_user_btn" class="btn btn-primary btn-lg btn-block"
                            data-toggle="modal" data-target=".bd-example-modal-lg">Add new user
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mt-5 mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">View all users</h6>
                            <div class="dropdown no-arrow">
                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                </a>
                            </div>
                        </div>
                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-light table-bordered table-hover dom-jQuery-events"
                                       style="text-align: center; margin: 0">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-repeat="data in all_user_data track by $index">
                                        <td>
                                            {{data['firstName']}}
                                        </td>
                                        <td>
                                            {{data['lastName']}}
                                        </td>
                                        <td>
                                            {{data['email']}}
                                        </td>
                                        <td>
                                            {{data['userType']}}
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-danger" ng-click="delete_user($index)">
                                                Delete User
                                            </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div id="addUserModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
     aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><b>Add New User</b></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="firstName">First Name</label>
                                <input id="firstName" type="text" class="form-control" placeholder="First name"
                                       ng-model="new_user_fname">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Last Name</label>
                                <input type="text" class="form-control" placeholder="Last name"
                                       ng-model="new_user_lname">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1"
                                       ng-model="new_user_email"
                                       aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="exampleFormControlSelect2">Role</label>
                                <select class="form-control" id="exampleFormControlSelect2"
                                        ng-model="new_user_job_role">
                                    <option value="" selected disabled hidden>Select
                                        job role
                                    </option>
                                    <option value="2">Financial Administrator</option>
                                    <option value="3">Tariff Administrator</option>
                                    <option value="4">Pricing Administrator</option>
                                    <option value="5">Commercial & Operational Administrator</option>
                                    <option value="6">Final Approver</option>
                                    <option value="7">Senior Project Manager</option>
                                    <option value="8">Project Manager</option>
                                    <option value="9">Estimator</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label for="newUserFirstName">Password</label>
                                <input id="newUserFirstName" ng-model="new_user_password" type="password"
                                       class="form-control"
                                       placeholder="Enter password"/>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label for="newUserLastName">Confirm Password</label>
                                <input id="newUserLastName" ng-model="new_user_password_repeat" type="password"
                                       class="form-control"
                                       placeholder="Confirm password"/>
                            </div>
                        </div>
                    </div>
                    <div class="row" ng-show="new_user_password_mismatch">
                        <div class="col">
                            <h6 style="color: red">Password does not match!</h6>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" ng-click="add_new_user()">Add User</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="addUserStatusModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><b>Add User - Status</b></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h5 ng-show="addUserStatusSuccess">User added successfully!</h5>
                <h5 ng-show="addUserStatusError">An error occurred!</h5>
            </div>
            <div class="modal-footer">
                <%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

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
