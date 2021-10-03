var workbench = angular.module("main_app", ['ngRoute']);


var htpp_tag = 'http';

workbench.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';

}]);

var main = document.getElementById('main');
angular.element(document).ready(function () {
    angular.bootstrap(main, ['main_app']);
});

workbench.controller('controller', ['$scope', '$http', '$interval', '$route', '$window', '$timeout', '$sce', function ($scope, $http, $interval, $route, $window, $timeout, $sce) {
    var url = htpp_tag.toString() + '://' + String(location.host);

    //for login page
    // console.log('Hello harindu');
    $scope.welcome = 'Welcome to Jemena WEM';

    $scope.cc_wbs = ''
    $scope.cc_inquiryNumber = ''
    $scope.cc_SAPPM_order = ''
    $scope.cc_zinfraWBS = ''
    $scope.cc_project_title = ''
    // $scope.cc_project_type = ''
    $scope.cc_supply_address = ''
    $scope.cc_reason_of_work = ''
    $scope.cc_customer_scope_of_work = ''
    $scope.cc_jemena_scope_of_work = ''
    $scope.cc_jemena_scope_of_exclusions = ''
    $scope.cc_assumptions = ''

    $scope.create_customer_contribution = function () {
        console.log('Clicked create_customer_contribution function')
        console.log($scope.cc_wbs)

        var obj = JSON.stringify({
            "jemenaWBS": $scope.cc_wbs,
            "inquiryNumber": $scope.cc_inquiryNumber,
            "jemenaSapPmOrder": $scope.cc_SAPPM_order,
            "zinfraWBS": $scope.cc_zinfraWBS,
            "projectTitle": $scope.cc_project_title,
            "projectType": $scope.cc_project_type,
            "supplyAddress": $scope.cc_supply_address,
            "customerReasonForWorks": $scope.cc_reason_of_work,
            "customerScopeOfWork": $scope.cc_customer_scope_of_work,
            "jemenaScopeOfWork": $scope.cc_jemena_scope_of_work,
            "jemenaScopeExclusions": $scope.cc_jemena_scope_of_exclusions,
            "assumption": $scope.cc_assumptions,
        });
        $http({
            method: 'POST',
            url: url + '/addProject',
            data: obj
        }).then(function mySuccess(response) {
            var data = response.data;
            console.log(data)
            $window.location.href = '/quantity_input_page'
        })
    };

    $scope.send_my_name = function () {
        console.log('Clicked send_my_name function')
        console.log($scope.email)
        console.log($scope.password)
        var obj = JSON.stringify({
            "email": $scope.email,
            "password": $scope.password,
        });
        //console.log(obj);

        $http({
            method: 'POST',
            url: url + '/login',
            data: obj
        }).then(function mySuccess(response) {
            var data = response.data;
            console.log(data)
            if (data.result == "fail") {
                document.getElementById("failMsg").style.visibility = "visible";
            } else {
                //temerately hardcoded redirect to add user page
                $window.location.href = '/dashboard_page'
            }
        })
    };

    //for ncc page
    $scope.get_ncc = function () {
        $http.get('/selectAllProjectType').then(function (response) {
            $scope.project_types = response.data;
            console.log($scope.project_types);
            $scope.selected_type = $scope.project_types[1].projectTypeId;
        });

        $http.get('/selectAllNonContestableType').then(function (response) {
            $scope.ncc_otherTypes = response.data;
            get_item();
        });

        //get item of each type and concat to json
        get_item = function () {
            for (let i = 0; i < $scope.ncc_otherTypes.length; i++) {
                typeId = $scope.ncc_otherTypes[i].id
                var obj = JSON.stringify({
                    "nonContestableTypeId": typeId
                });
                $http({
                    method: 'POST',
                    url: url + '/findNonContestableOtherCostsIterm',
                    data: obj,
                }).then(function mySuccess(response) {
                    console.log(response.data)
                    $scope.ncc_otherTypes[i].items = response.data;
                })
            }
        }
    }

    $scope.ncc_typeChanged = function () {
        var obj = JSON.stringify({
            "projectTypeId": $scope.selected_type,
        });

        $http({
            method: 'POST',
            url: url + '/findNonContestableProjectComponent',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response.data)
            $scope.proj_comps = response.data;
        })
    }

    //add ncc basic data
    $scope.add_ncc_basic = function () {
        console.log($scope.ncc_type)
        if ($scope.ncc_type == "pc") {
            var obj = JSON.stringify({
                "projectTypeId": $scope.selected_type,
                "cost": $scope.rate,
                "description": $scope.description
            })

            $http({
                method: 'POST',
                url: url + '/insertNonContestableProjectComponent',
                data: obj
            }).then(function mySuccess(response) {
                console.log(response)
            })
        } else {
            var obj = JSON.stringify({
                "nonContestableTypeId": $scope.ncc_type,
                "unit": $scope.unit,
                "rate": $scope.rate,
                "description": $scope.description
            })

            $http({
                method: 'POST',
                url: url + '/insertNonContestableOtherCostsItem',
                data: obj
            }).then(function mySuccess(response) {
                console.log(response)
            })
        }

    }

    //for fim page
    $scope.get_fim = function () {
        //get fim type first
        $http.get('/selectAllFIMinputType').then(function (response) {
            //console.log(response.data);
            $scope.fim_types = response.data;
            get_sub_type();
        });

        //get sub_type of each fim type and add to the json
        get_sub_type = function () {
            for (let i = 0; i < $scope.fim_types.length; i++) {
                typeId = $scope.fim_types[i].id
                var obj = JSON.stringify({
                    "fIMinputTypeID": typeId
                });
                $http({
                    method: 'POST',
                    url: url + '/findFIMinputSubType',
                    data: obj,
                }).then(function mySuccess(response) {
                    var data = response.data;
                    $scope.fim_types[i].sub_types = data;
                    //console.log($scope.fim_types)

                    for (let j = 0; j < $scope.fim_types[i].sub_types.length; j++) {
                        subTypeId = $scope.fim_types[i].sub_types[j].id
                        //console.log("type id: " + typeId)
                        var obj = JSON.stringify({
                            "fIMinputSubTypeID": subTypeId
                        });

                        $http({
                            method: 'POST',
                            url: url + '/findFIMinputIterm',
                            data: obj,
                        }).then(function mySuccess(response) {
                            var data = response.data;
                            $scope.fim_types[i].sub_types[j].items = data;
                        })
                    }
                })
            }
        }

    }

    // $('#add_new_user_btn').click(function (e) {
    //     e.preventDefault();
    //     // your statements;
    // });

    $scope.new_user_password = ''
    $scope.new_user_password_repeat = ''
    $scope.new_user_fname = ''
    $scope.new_user_lname = ''
    $scope.new_user_email = ''
    $scope.new_user_job_role = ''
    $scope.new_user_password_mismatch = false
    $scope.addUserStatusSuccess = false
    $scope.addUserStatusError = false

    //add new user
    $scope.add_new_user = function () {
        console.log("clicked add_new_user function")

        console.log($scope.new_user_password)
        console.log($scope.new_user_password_repeat)
        console.log($scope.new_user_fname)
        console.log($scope.new_user_lname)
        console.log($scope.new_user_email)
        console.log($scope.new_user_job_role)

        if ($scope.new_user_password.toString() === $scope.new_user_password_repeat.toString()) {
            $scope.new_user_password_mismatch = false
            var obj = JSON.stringify({
                "email": $scope.new_user_email,
                "password": $scope.new_user_password,
                "firstname": $scope.new_user_fname,
                "lastname": $scope.new_user_lname,
                "userTypeId": $scope.new_user_job_role,
            })
            $http({
                method: 'POST',
                url: url + '/create',
                data: obj
            }).then(function mySuccess(response) {
                console.log(response)
                var status = response.data['result']
                console.log(status)
                if (status.toString() === 'success') {
                    $('#addUserModal').modal('hide');
                    $('#addUserStatusModal').modal('show');
                    $scope.addUserStatusSuccess = true
                    $scope.addUserStatusError = false
                    $scope.get_all_users()
                } else {
                    $('#addUserModal').modal('hide');
                    $('#addUserStatusModal').modal('show');
                    $scope.addUserStatusSuccess = false
                    $scope.addUserStatusError = true
                }
            })
        } else {
            $scope.new_user_password_mismatch = true
        }
    }

    $scope.get_all_users = function () {
        console.log("clicked get_all_users function")
        $http({
            method: 'GET',
            url: url + '/listAllUsers',
        }).then(function mySuccess(response) {
            console.log(response)
            // var data = JSON.parse(response.data);
            console.log(response.data)
            $scope.all_user_data = response.data
        })
    }
    $scope.get_all_users()

    $scope.delete_user = function (id) {
        console.log("clicked delete_user function")

        var userId = $scope.all_user_data[id]['id']
        console.log(userId)
        var obj = JSON.stringify({
            "userId": userId,
        })
        $http({
            method: 'POST',
            url: url + '/deleteUser',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response)
            $scope.get_all_users()
        })
    }

    $scope.user_old_password = ''
    $scope.user_new_password_to_change = ''
    $scope.user_confirm_new_password_to_change = ''
    $scope.change_user_password_mismatch = false

    $scope.changePassword = function (id) {
        console.log("clicked changePassword function")
        console.log($scope.user_old_password)
        console.log($scope.user_new_password_to_change)
        console.log($scope.user_confirm_new_password_to_change)

        if ($scope.user_new_password_to_change.toString() === $scope.user_confirm_new_password_to_change.toString()) {
            $scope.change_user_password_mismatch = false
            var obj = JSON.stringify({
                "newPassword": $scope.user_new_password_to_change,
                "originalPassword": $scope.user_old_password,
            })
            $http({
                method: 'POST',
                url: url + '/changePassword',
                data: obj
            }).then(function mySuccess(response) {
                console.log(response)

            })
        } else {
            $scope.change_user_password_mismatch = true
        }
    }

    $scope.quantity_input_basic_data_error = false
    $scope.quantityInputItemGroupIdBasicData = ''
    $scope.quantity_input_item_code_basic_data = ''
    $scope.quantity_input_item_description_basic_data = ''
    $scope.quantity_input_item_unit_basic_data = ''
    $scope.quantity_input_item_labour_basic_data = ''
    $scope.quantity_input_item_material_basic_data = ''
    $scope.quantity_input_item_plant_basic_data = ''
    $scope.quantity_input_item_subcontract_basic_data = ''
    $scope.quantity_input_item_unit_rate_basic_data = ''
    $scope.quantity_input_item_man_hour_basic_data = ''
    $scope.quantityInputSuccess = false
    $scope.quantityInputError = false

    $scope.submit_quantity_input_basic_data_item = function () {
        console.log("clicked submit_quantity_input_basic_data_item function")

        var obj = JSON.stringify({
            "quantityInputItermGroupId": $scope.quantityInputItemGroupIdBasicData,
            "code": $scope.quantity_input_item_code_basic_data,
            "description": $scope.quantity_input_item_description_basic_data,
            "unit": $scope.quantity_input_item_unit_basic_data,
            "labour": $scope.quantity_input_item_labour_basic_data,
            "material": $scope.quantity_input_item_material_basic_data,
            "plant": $scope.quantity_input_item_plant_basic_data,
            "subcontract": $scope.quantity_input_item_subcontract_basic_data,
            "unitRate": $scope.quantity_input_item_unit_rate_basic_data,
            "manhours": $scope.quantity_input_item_man_hour_basic_data,
        })
        $http({
            method: 'POST',
            url: url + '/insertQuantityInputBasicData',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response)
            var status = response.data['result']
            console.log(status)
            if (status.toString() === 'success') {
                $('#quantityInputBasicDataModal').modal('show');
                $scope.quantityInputSuccess = true
                $scope.quantityInputError = false
            } else {
                $('#quantityInputBasicDataModal').modal('show');
                $scope.quantityInputSuccess = false
                $scope.quantityInputError = true
            }
        })
    }


}])


