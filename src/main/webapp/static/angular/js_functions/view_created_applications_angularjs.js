var workbench = angular.module("applications", ['ngRoute']);

workbench.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
}]);


workbench.controller('view_application_controller', ['$scope', '$http', '$interval', '$route', '$window', function ($scope, $http, $interval, $route, $window) {
    var url = 'http://' + String(location.host)

       $scope.set_as_home = function (index) {
        $scope.app_selected = index
        alert('Are you sure you want to set this app as your home view?')
    }

    $http.get(url + '/created_apps')
        .then(function mySuccess(response) {
            let created_apps_data;
            $scope.created_apps = []
            created_apps_data = JSON.parse(response.data);
            console.log(created_apps_data)
            $scope.created_apps = created_apps_data
        });


    $scope.edit_app = function (index) {
        alert('Are you sure you want to edit this app?')
        var obj = JSON.stringify({
            "index": index.toString()
        });
        $http({

            method: 'POST',
            url: url + '/edit_app',
            data: obj
        }).then(function mySuccess(response) {


            $window.location.href = '/dashboard_workbench';


        })

    }

    $scope.select_app = function (index) {
        console.log(index)
        if (index == $scope.app_selected) {
            var obj = JSON.stringify({
                "index": index.toString(),
                "app_selected": 1,
            });
        } else {
            var obj = JSON.stringify({
                "index": index.toString(),
                "app_selected": 0,
            });
            $scope.app_selected = null
        }

        $http({

            method: 'POST',
            url: url + '/created_apps',
            data: obj
        }).then(function mySuccess(response) {


            $window.location.href = '/render_workbench_view';


        })


    }


}])