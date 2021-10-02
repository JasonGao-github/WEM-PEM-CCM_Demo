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
            <form class="newUser container" name="newUser" action=""
                  method="POST" style="justify-content: center">


                <div class="row">
                    <input ng-click="save" type="btn" name="save" value="save"/><input
                        ng-click="cancel" type="btn" name="cancel" value="cancel"/>
                </div>
            </form>
        </div>
    </div>
</section>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
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
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" ng-click="add_new_user()">Add User</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
