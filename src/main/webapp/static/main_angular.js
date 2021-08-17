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

}])

