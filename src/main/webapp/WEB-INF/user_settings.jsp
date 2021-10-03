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
            <h1 style="margin: 2vh;">Settings</h1>
            <br>
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mt-5 mb-4">
                        <!-- Card Header - Dropdown -->
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h6 class="m-0 font-weight-bold text-primary">Change Password</h6>
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
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="userOldPassword">Old Password</label>
                                            <input id="userOldPassword" ng-model="user_old_password" type="password"
                                                   class="form-control"
                                                   placeholder="Enter old password"/>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="userNewPassword">New Password</label>
                                            <input id="userNewPassword" ng-model="user_new_password_to_change"
                                                   type="password"
                                                   class="form-control"
                                                   placeholder="Enter new password"/>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="userNewPasswordConfirm">Confirm New Password</label>
                                            <input id="userNewPasswordConfirm"
                                                   ng-model="user_confirm_new_password_to_change"
                                                   type="password"
                                                   class="form-control"
                                                   placeholder="Confirm new password"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" ng-show="change_user_password_mismatch">
                                    <div class="col">
                                        <h6 style="color: red">New passwords do not match!</h6>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col">
                                        <button type="button" class="btn btn-primary" ng-click="changePassword()">Change
                                            Password
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
