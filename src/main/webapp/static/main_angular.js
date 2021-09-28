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

	$scope.create_customer_contribution = function() {
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

	//for login page	
	$scope.send_my_name = function() {
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
			if (data.result == "fail") {
				document.getElementById("failMsg").style.visibility = "visible";
			} else {
				//temerately hardcoded redirect to add user page
				$window.location.href = '/dashboard_page'
			}
		})
	};

	//for ncc page
	$scope.ncc_data = { "proj_comp": {}, "other": {} }
	$scope.get_ncc = function() {
		$http.get('/selectAllProjectType').then(function(response) {
			$scope.project_types = response.data;
			$scope.selected_type = $scope.project_types[1].projectTypeId;
		});

		$http.get('/selectAllNonContestableType').then(function(response) {
			$scope.ncc_otherTypes = response.data;
			get_item();
		});

		//get item of each type and concat to json
		get_item = function() {
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
					$scope.ncc_otherTypes[i].items = response.data;
				})
			}
		}
	}

	$scope.ncc_typeChanged = function() {
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

		$scope.ncc_data.proj_comp = {}
	}

	$scope.ncc_projCompChanged = function(compId, quantity, total) {

		if (quantity == null) {
			delete $scope.ncc_data.proj_comp[compId]
		} else {

			$scope.ncc_data.proj_comp[compId] =
			{
				"nonContestableProjectComponentId": compId,
				"hours": quantity,
				"total": total
			}
		}
		console.log($scope.ncc_data)
	}

	$scope.ncc_otherChanged = function(itemId, quantity, total) {

		if (quantity == null) {
			delete $scope.ncc_data.other[itemId]
		} else {

			$scope.ncc_data.other[itemId] =
			{
				"nonContestableOtherCostsItemId": itemId,
				"quantity": quantity,
				"total": total
			}
		}
		console.log($scope.ncc_data)
	}

	$scope.ncc_submit_input = function() {
		Object.keys($scope.ncc_data.proj_comp).forEach(function(k){
			console.log($scope.ncc_data.proj_comp[k])
		})
		Object.keys($scope.ncc_data.other).forEach(function(k){
			console.log($scope.ncc_data.other[k])
		})
	}

	//add ncc basic data
	$scope.add_ncc_basic = function() {
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
	$scope.get_fim = function() {
		//get fim type first
		$http.get('/selectAllFIMinputType').then(function(response) {
			//console.log(response.data);
			$scope.fim_types = response.data;
			get_sub_type();
		});

		//get sub_type of each fim type and add to the json
		get_sub_type = function() {
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

					//get item for each sub type
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
							console.log($scope.fim_types)
						})
					}
				})
			}
		}

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


