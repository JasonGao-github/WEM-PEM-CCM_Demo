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

    console.log('Hello harindu')
    $scope.jsp_test = 'Jemena Project';

    $scope.send_my_name = function () {
        console.log('Clicked send_my_name function')
        console.log($scope.name)
        var obj = JSON.stringify({
            "name": $scope.name.toString(),
        });
        //console.log(obj);
        $http({
            method: 'POST',
            url: url + '/send_my_name',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response)
            //var data = JSON.parse(response.data);

        })
    };

    $scope.user_login_submit = function () {
        console.log($scope.user_id)
        console.log($scope.user_password)
        var obj = JSON.stringify({
            "user_id": $scope.user_id,
            "user_password": $scope.user_password,
        });
        $http({
            method: 'POST',
            url: url + '/user_login_submit',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response.data)
            if (response.data === 'success') {
                location.href = 'user_home_page'
            } else if (response.data === 'invalid') {
                $scope.invalid_credentials = true
            } else if (response.data === 'admin') {
                location.href = 'admin_page'
            } else {
                console.log(response.data)
            }
        })
    }

    $scope.register_user = function () {
        console.log($scope.reg_user_id)
        console.log($scope.reg_password)
        var obj = JSON.stringify({
            "reg_user_id": $scope.reg_user_id,
            "reg_password": $scope.reg_password,
        });
        $http({
            method: 'POST',
            url: url + '/register_user',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response.data)
            if (response.data === 'invalid_username') {
                $scope.invalid_username = true
            } else if (response.data === 'invalid_userid') {
                $scope.invalid_userid = true
            } else if (response.data === 'valid_user') {
                $('#registrationSuccessModal').modal('show');
                // location.href = 'login_page'
            }
        })
    }

    $scope.create_project = function (id) {
        console.log(id)
        $scope.subscription_data_title = $scope.subscription_data[id]['ID']
        $scope.subscription_data_artist = $scope.subscription_data[id]['WBS_number']
        $scope.subscription_data_subTimeStamp = $scope.subscription_data[id]['Name']

        var obj = JSON.stringify({
            "ID": $scope.subscription_data_title,
            "WBS_number": $scope.subscription_data_artist,
            "Name": $scope.subscription_data_subTimeStamp
        });
        $http({
            method: 'POST',
            url: url + '/create_project',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response.data)
            $scope.get_subscription_data()
            // if (response.data === 'success') {
            //     location.href = 'message_display_page'
            // } else if (response.data === 'invalid') {
            //
            // } else {
            //     console.log(response.data)
            // }
        })
    }

    $scope.search_project = function () {
        console.log($scope.id)
        console.log($scope.WBS_number)
        console.log($scope.Name)

        if (isNaN($scope.message_year)) {
            alert("Please enter a number to the year field!");
        } else {
            var obj = JSON.stringify({
                "id": $scope.id,
                "WBS_number": $scope.WBS_number,
                "Name": $scope.Name
            });
            $http({
                method: 'POST',
                url: url + '/search_project',
                data: obj
            }).then(function mySuccess(response) {
                console.log(response.data)
                console.log(response.data)
                var data = response.data

                if (data == 'no_data') {
                    $scope.query_result_table = false
                    $scope.query_result_empty_message = true
                    $scope.message_title = ''
                    $scope.message_year = ''
                    $scope.message_artist = ''
                } else {
                    $scope.query_result_table = true
                    $scope.query_result_empty_message = false
                    var parsed_data = JSON.parse(data)
                    $scope.queried_data = parsed_data
                    console.log(parsed_data)
                    $scope.message_title = ''
                    $scope.message_year = ''
                    $scope.message_artist = ''
                }
            })
        }

    }

    $scope.add_basic_data = function (id) {
        console.log(id)
        $scope.item_id = $scope.queried_data[id]['item_id']
        $scope.Item_name = $scope.queried_data[id]['Item_name']
        $scope.quantity = $scope.queried_data[id]['quantity']

        var obj = JSON.stringify({
            "item_id": $scope.item_id,
            "Item_name": $scope.Item_name,
            "quantity": $scope.quantity
        });
        $http({
            method: 'POST',
            url: url + '/add_basic_data',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response.data)
            $scope.get_subscription_data()
            if (response.data === 'done') {
                alert("Song added to the subscriptions!");
            } else if (response.data === 'invalid') {

            } else {
                console.log(response.data)
            }
        })
    }

}])

