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
	
	console.log('Hello harindu');
    $scope.welcome = 'Welcome to Jemena WEM';
	$scope.failMsg = 

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
            url: url + '/loginPage',
            data: obj
        }).then(function mySuccess(response) {
            var data = response.data;
			console.log(data)
			if(data.result == "fail"){
				document.getElementById("failMsg").style.visibility = "visible";
			}
			else{
				//temerately hardcoded redirect to add user page
				$window.location.href = '/addUser_page'
			}
        })
		

    };

}])

