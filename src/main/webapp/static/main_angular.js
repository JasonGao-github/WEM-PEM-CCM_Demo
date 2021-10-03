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
	$scope.ncc_data = { "proj_comp": [], "other": [] }
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
					for (let j = 0; j < $scope.ncc_otherTypes[i].items.length; j++) {
						$scope.ncc_otherTypes[i].items[j].quantity = '';
					}
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
			for (let j = 0; j < $scope.proj_comps.length; j++) {
				$scope.proj_comps[j].quantity = '';
			}
		})

		//when type changed, reset the content
		$scope.ncc_data.proj_comp = []
	}

	$scope.ncc_projCompChanged = function(compId, quantity, total) {

		if (quantity == null) {
			for (let i = 0; i < $scope.ncc_data.proj_comp.length; i++) {
				if ($scope.ncc_data.proj_comp[i].nonContestableProjectComponentId == compId) {
					$scope.ncc_data.proj_comp.splice(i, 1);
				}
			}
		} else {

			$scope.ncc_data.proj_comp.push({
				"nonContestableProjectComponentId": compId,
				"hours": quantity,
				"total": total
			})
		}
		console.log($scope.ncc_data)
	}

	$scope.ncc_otherChanged = function(itemId, quantity, total) {
		console.log($scope.projectId);
		if (quantity == null) {
			for (let i = 0; i < $scope.ncc_data.other.length; i++) {
				if ($scope.ncc_data.other[i].nonContestableOtherCostsItemId == itemId) {
					$scope.ncc_data.other.splice(i, 1);
				}
			}
		} else {
			$scope.ncc_data.other.push({
				"nonContestableOtherCostsItemId": itemId,
				"quantity": quantity,
				"total": total
			})
		}
		console.log($scope.ncc_data)
	}

	$scope.ncc_submit_input = function() {
		var proj_comp = JSON.stringify(
			$scope.ncc_data.proj_comp
		);
		//console.log(proj_comp);

		var other = JSON.stringify(
			$scope.ncc_data.other
		);
		//console.log(other);

		$http({
			method: 'POST',
			url: url + '/insertProjectNonContestableProjectComponent',
			data: proj_comp
		}).then(function mySuccess(response) {

			$http({
				method: 'POST',
				url: url + '/insertNonContestableOtherCosts',
				data: other
			}).then(function mySuccess(response) {
				$window.location.href = '/fim_page'
			})
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
		$http.get('/listAllFIMinputType').then(function(response) {
			//console.log(response.data);
			$scope.fim_types = response.data;
			//console.log($scope.fim_types)
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
					url: url + '/listFIMinputSubType',
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
							url: url + '/listFIMinputIterm',
							data: obj,
						}).then(function mySuccess(response) {
							var data = response.data;
							$scope.fim_types[i].sub_types[j].items = data;
							for (let k = 0; k < $scope.fim_types[i].sub_types[j].items.length; k++) {
								$scope.fim_types[i].sub_types[j].items[k].actual = '';
								$scope.fim_types[i].sub_types[j].items[k].jen = '';
								$scope.fim_types[i].sub_types[j].items[k].lcta = '';
							}
						})
					}
				})
			}
		}

	}

	//record quantity changes in fim input
	$scope.fim_data = []
	$scope.fim_type_total = {}
	$scope.fim_input_changed = function(itemId, actQ, jenQ, lctaQ, actTotal, jenTotal, lctaTotal, fimTypeId) {
		for (let i = 0; i < $scope.fim_data.length; i++) {
			if ($scope.fim_data[i].fIMinputItermId == itemId) {
				$scope.fim_data.splice(i, 1);
			}
		}

		if (actQ || jenQ || lctaQ) {
			$scope.fim_data.push({
				fIMinputItermId: itemId,
				acturalQuantity: actQ,
				jenFoundedQuantity: jenQ,
				lctaQuantity: lctaQ,
				acturalSubTotal: actTotal,
				jenFoundedTotal: jenTotal,
				lctaTotal: lctaTotal,
				fimTypeId: fimTypeId
			})
		}
		update_fim_type_total()

	}

	update_fim_type_total = function() {
		$scope.fim_type_total = {}
		let total = { actTotal: 0, jenTotal: 0, lctaTotal: 0 }
		for (let i = 0; i < $scope.fim_data.length; i++) {
			typeId = $scope.fim_data[i].fimTypeId;
			if (!$scope.fim_type_total[typeId]) {
				$scope.fim_type_total[typeId] = Object.assign({}, total)
			}

			$scope.fim_type_total[typeId].actTotal += $scope.fim_data[i].acturalSubTotal;
			$scope.fim_type_total[typeId].jenTotal += $scope.fim_data[i].jenFoundedTotal;
			$scope.fim_type_total[typeId].lctaTotal += $scope.fim_data[i].lctaTotal;

		}
	}

	$scope.fim_submit_input = function() {
		var obj = JSON.stringify(
			$scope.fim_data
		)
		$http({
			method: 'POST',
			url: url + '/insertFIMinputItermQuantity',
			data: obj,
		}).then(function mySuccess(response) {
			$window.location.href = '/avoided_cost_page'
		})
	}

	//in fim basic page
	$scope.basic_change_fim_type = function() {
		typeId = $scope.fim_type
		var obj = JSON.stringify({
			"fIMinputTypeID": typeId
		});
		$http({
			method: 'POST',
			url: url + '/listFIMinputSubType',
			data: obj,
		}).then(function mySuccess(response) {
			$scope.sub_types = response.data;
		})
	}

	$scope.fim_basic_submit = function() {
		var obj = JSON.stringify({
			"fIMinputSubTypeID": $scope.selected_sub_type,
			"description": $scope.description,
			"currency": $scope.currency,
			"unitCost": $scope.unitCost
		});
		console.log(obj)
		$http({
			method: 'POST',
			url: url + '/insertFIMinputIterm',
			data: obj,
		}).then(function mySuccess(response) {
			console.log(response.data);
		})

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
	$scope.add_new_user = function() {
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

	$scope.get_all_users = function() {
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

	$scope.delete_user = function(id) {
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

	$scope.changePassword = function(id) {
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

	$scope.submit_quantity_input_basic_data_item = function() {
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

	$scope.scopeExclusionItemDescription = ''
	$scope.scopeExclusionItemDescriptionDataSuccess = false
	$scope.scopeExclusionItemDescriptionDataError = false

	$scope.add_scope_exclusion_item = function() {
		console.log("clicked add_scope_exclusion_item function")
		console.log($scope.scopeExclusionItemDescription)
		var obj = JSON.stringify({
			"scopeExclusionItemDescription": $scope.scopeExclusionItemDescription,
		})
		$http({
			method: 'POST',
			url: url + '/addScopeExclusionItem',
			data: obj
		}).then(function mySuccess(response) {
			console.log(response)
			var status = response.data['result']
			console.log(status)
			if (status.toString() === 'success') {
				$scope.scopeExclusionItemDescriptionDataSuccess = true
				$scope.scopeExclusionItemDescriptionDataError = false
			} else {
				$scope.scopeExclusionItemDescriptionDataSuccess = false
				$scope.scopeExclusionItemDescriptionDataError = true
			}
		})
	}

	$scope.scopeAssumptionItemDescription = ''
	$scope.scopeAssumptionItemDescriptionDataSuccess = false
	$scope.scopeAssumptionItemDescriptionDataError = false

	$scope.add_assumption_item = function() {
		console.log("clicked add_assumption_item function")
		console.log($scope.scopeAssumptionItemDescription)
		var obj = JSON.stringify({
			"scopeExclusionItemDescription": $scope.scopeAssumptionItemDescription,
		})
		$http({
			method: 'POST',
			url: url + '/addAssumptionItem',
			data: obj
		}).then(function mySuccess(response) {
			console.log(response)
			var status = response.data['result']
			console.log(status)
			if (status.toString() === 'success') {
				$scope.scopeAssumptionItemDescriptionDataSuccess = true
				$scope.scopeAssumptionItemDescriptionDataError = false
			} else {
				$scope.scopeAssumptionItemDescriptionDataSuccess = false
				$scope.scopeAssumptionItemDescriptionDataError = true
			}
		})
	}


}])


