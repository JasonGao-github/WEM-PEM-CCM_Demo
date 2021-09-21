var workbench = angular.module("main_app", ['ngRoute']);


var htpp_tag = 'http';

workbench.config(['$httpProvider', function($httpProvider) {
	$httpProvider.defaults.xsrfCookieName = 'csrftoken';
	$httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';

}]);

var main = document.getElementById('main');
angular.element(document).ready(function() {
	angular.bootstrap(main, ['main_app']);
});

workbench.controller('controller', ['$scope', '$http', '$interval', '$route', '$window', '$timeout', '$sce', function($scope, $http, $interval, $route, $window, $timeout, $sce) {
	var url = htpp_tag.toString() + '://' + String(location.host);

	//for login page
	console.log('Hello harindu');
	$scope.welcome = 'Welcome to Jemena WEM';

	$scope.send_my_name = function() {
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
			if (data.result == "fail") {
				document.getElementById("failMsg").style.visibility = "visible";
			}
			else {
				//temerately hardcoded redirect to add user page
				$window.location.href = '/dashboard_page'
			}
		})
	};

	//for ncc page
	$scope.get_ncc = function() {
		$http.get('/selectAllProjectType').then(function(response) {
			$scope.project_types = response.data;
			console.log($scope.project_types);
			$scope.selected_type = $scope.project_types[1].projectTypeId;
		});

		$http.get('/selectAllNonContestableType').then(function(response) {
			$scope.ncc_items = response.data;
		});
		
	}

	$scope.typeChanged = function() {
		var obj = JSON.stringify({
			"projectTypeId": $scope.selected_type,
		});

		$http({
			method: 'POST',
			url: url + '/findNonContestableProjectComponent',
			data: obj
		}).then(function mySuccess(response) {
			$scope.proj_comps = response.data;
		})
	}


	//add new user
	$scope.add_new_user = function() {
		console.log("clicked add_new_user function")
		var obj = JSON.stringify({
			"email": $scope.email,
			"password": $scope.password,
			"firstname": "fname",
			"lastname": "lname",
			"userTypeId": "1",
			"leaderId": "1"
		})

		$http({
			method: 'POST',
			url: url + '/create',
			data: obj
		}).then(function mySuccess(response) {
			console.log(response)
			//var data = JSON.parse(response.data);

		})
	}
}])


