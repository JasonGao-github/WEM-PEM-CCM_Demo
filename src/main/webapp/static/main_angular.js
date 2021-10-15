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
    $scope.ncc_data = {"proj_comp": [], "other": []}
    $scope.get_ncc = function () {
        $http.get('/selectAllProjectType').then(function (response) {
            $scope.project_types = response.data;
            $scope.selected_type = $scope.project_types[1].projectTypeId;
        });
		existing = false

        $http.get('/NonContestable/getDataNonContestableProjectComponent').then(function (response) {
            console.log(response.data)
            if(response.data.projectStatus == "exist"){
				existing = true
			}
			pc_item = response.data.projectData;
        });

		$http.get('/NonContestable/getDataNonContestableOtherCostsIterm').then(function (response) {
            //console.log(response.data)
            if(response.data.projectStatus == "exist"){
				existing = true
			}
			other_item = response.data.projectData;
        });


        $http.get('/selectAllNonContestableType').then(function (response) {
            $scope.ncc_otherTypes = response.data;
            get_item();
			if(existing){
				$scope.selected_type = pc_item[0].projectTypeId
				console.log($scope.selected_type)
				$scope.ncc_typeChanged()
			}
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
                    $scope.ncc_otherTypes[i].items = response.data;
                    for (let j = 0; j < $scope.ncc_otherTypes[i].items.length; j++) {
                        $scope.ncc_otherTypes[i].items[j].quantity = '';
						if(existing){
							other_item.forEach(item=>{
								if($scope.ncc_otherTypes[i].items[j].id == item.nonContestableOtherCostsItemId){
									$scope.ncc_otherTypes[i].items[j].quantity = item.quantity;
								}
							})
						}
                    }
				//console.log($scope.ncc_otherTypes)
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
            $scope.proj_comps = response.data;
            for (let j = 0; j < $scope.proj_comps.length; j++) {
				//console.log("basic");
                $scope.proj_comps[j].quantity = '';
				//console.log($scope.proj_comps[j])
				if(existing){
					//console.log("item")
					pc_item.forEach(item=>{
						//console.log(item)
						if($scope.proj_comps[j].id == item.nonContestableProjectComponentId){
							$scope.proj_comps[j].quantity = item.hours;
						}
					})
				}
            }
        })

        //when type changed, reset the content
        $scope.ncc_data.proj_comp = []
    }

    $scope.ncc_projCompChanged = function (compId, quantity, total) {
		//replace null or empty string with 0
		if (!quantity){
			quantity = 0
		}
		// check if the id already exist
        for (let i = 0; i < $scope.ncc_data.proj_comp.length; i++) {
            if ($scope.ncc_data.proj_comp[i].nonContestableProjectComponentId == compId) {
				$scope.ncc_data.proj_comp[i].quantity = quantity
				$scope.ncc_data.proj_comp[i].total = total
        		//console.log($scope.ncc_data)
				return
            }
        }
		//if not exist
        $scope.ncc_data.proj_comp.push({
            "nonContestableProjectComponentId": compId,
            "hours": quantity,
            "total": total
        })
    
        console.log($scope.ncc_data)
    }

    $scope.ncc_otherChanged = function (itemId, quantity, total) {
		//replace null or empty string with 0
		if (!quantity){
			quantity = 0
		}
		// check if the id already exist
        for (let i = 0; i < $scope.ncc_data.other.length; i++) {
            if ($scope.ncc_data.other[i].nonContestableOtherCostsItemId == itemId) {
				$scope.ncc_data.other[i].quantity = quantity
				$scope.ncc_data.other[i].total = total
        		//console.log($scope.ncc_data)
				return
            }
        }
		//if not exist
		$scope.ncc_data.other.push({
            "nonContestableOtherCostsItemId": itemId,
            "quantity": quantity,
            "total": total
        })
        //console.log($scope.ncc_data)
    }

    $scope.ncc_submit_input = function () {
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
        $http.get('/listAllFIMinputType').then(function (response) {
            //console.log(response.data);
            $scope.fim_types = response.data;
            //console.log($scope.fim_types)
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
							console.log($scope.fim_types)
                        })
                    }
                })
            }
        }

    }

    //record quantity changes in fim input
    $scope.fim_data = []
    $scope.fim_type_total = {}
    $scope.fim_input_changed = function (itemId, actQ, jenQ, lctaQ, actTotal, jenTotal, lctaTotal, fimTypeId) {
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

    update_fim_type_total = function () {
        $scope.fim_type_total = {}
        let total = {actTotal: 0, jenTotal: 0, lctaTotal: 0}
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

    $scope.fim_submit_input = function () {
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
    $scope.basic_change_fim_type = function () {
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

    $scope.fim_basic_submit = function () {
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

    //for avoided cost
    $scope.get_ac = function () {
        $http.get('/selectAllAvoidedCostassetReplacementIterm').then(function (response) {
            //console.log(response.data);
            $scope.ac_items = response.data;
            console.log($scope.ac_items);

            $scope.wacc = 4.72
            $scope.overhead = ''

            $scope.add_ex_asset();
            $scope.add_repl_asset();
        });
    }

    data = {
        id: 0,
        name: '',
        stdLife: '',
        unit: '',
        unitCost: '',
        maintenanceCost: '',
        vegetationManagementCost: '',
        quantity: '',
        avoidedCostassetReplacementItermId: '',
        assetAge: '',
        remLife: '',
        totalCost: '',
        presentValueRC: '',
        source: 'Jemena',
		type: ''
    };
    $scope.exist_asset_data = []
    $scope.repl_asset_data = []

    $scope.add_ex_asset = function () {
        let new_data = Object.assign({}, data);
        avoidedCostassetReplacementItermId = $scope.exist_asset_data.length
        new_data.id = avoidedCostassetReplacementItermId
		new_data.type = 'existing'
        $scope.exist_asset_data.push(new_data)
        console.log($scope.exist_asset_data)
    }
    $scope.add_repl_asset = function () {
        let new_data = Object.assign({}, data);
        new_data.id = $scope.repl_asset_data.length
		new_data.type = ''
        $scope.repl_asset_data.push(new_data)
    }

    $scope.rm_ex_asset = function () {
        $scope.exist_asset_data.pop()
        $scope.ac_update_total()
    }
    $scope.rm_repl_asset = function () {
        $scope.repl_asset_data.pop()
        $scope.ac_update_total()
    }

    $scope.ac_exist_select_item = function (index) {
        if ($scope.ac_items[$scope.exist_asset_data[index].avoidedCostassetReplacementItermId - 1]) {
            ac_item = $scope.ac_items[$scope.exist_asset_data[index].avoidedCostassetReplacementItermId - 1]
            $scope.exist_asset_data[index].stdLife = ac_item.stdLife
            $scope.exist_asset_data[index].unit = ac_item.unit
            $scope.exist_asset_data[index].unitCost = ac_item.unitCost
            $scope.exist_asset_data[index].maintenanceCost = ac_item.maintenanceCost
            $scope.exist_asset_data[index].vegetationManagementCost = ac_item.vegetationManagementCost
            $scope.exist_asset_data[index].quantity = ''
            $scope.exist_asset_data[index].assetAge = ''
            $scope.exist_asset_data[index].name = ac_item.name
        }
        $scope.ac_update_exist_item(index)
    }
    $scope.ac_repl_select_item = function (index) {
        if ($scope.ac_items[$scope.repl_asset_data[index].avoidedCostassetReplacementItermId - 1]) {
            ac_item = $scope.ac_items[$scope.repl_asset_data[index].avoidedCostassetReplacementItermId - 1]
            $scope.repl_asset_data[index].stdLife = ac_item.stdLife
            $scope.repl_asset_data[index].unit = ac_item.unit
            $scope.repl_asset_data[index].unitCost = ac_item.unitCost
            $scope.repl_asset_data[index].maintenanceCost = ac_item.maintenanceCost
            $scope.repl_asset_data[index].vegetationManagementCost = ac_item.vegetationManagementCost
            $scope.repl_asset_data[index].quantity = ''
            $scope.repl_asset_data[index].name = ac_item.name
        }
        $scope.ac_update_repl_item(index)
    }

    $scope.ac_update_exist_item = function (index) {
        item = $scope.exist_asset_data[index]
        total = item.unitCost * item.quantity * (1 + $scope.overhead / 100)
        $scope.exist_asset_data[index].totalCost = total
        $scope.exist_asset_data[index].remLife = item.stdLife - item.assetAge
        value = $scope.exist_asset_data[index].totalCost / ((1 + $scope.wacc / 100) ** $scope.exist_asset_data[index].remLife)
        $scope.exist_asset_data[index].presentValueRC = value
        $scope.ac_update_total()

    }
    $scope.ac_update_repl_item = function (index) {
        item = $scope.repl_asset_data[index]
        total = item.unitCost * item.quantity * (1 + $scope.overhead / 100)
        $scope.repl_asset_data[index].totalCost = total
        $scope.repl_asset_data[index].remLife = item.stdLife
        value = $scope.repl_asset_data[index].totalCost / ((1 + $scope.wacc / 100) ** $scope.repl_asset_data[index].remLife)
        $scope.repl_asset_data[index].presentValueRC = value

        $scope.ac_update_total()
        $scope.ac_update_weigted_avg_age()
    }

    $scope.ac_update_overhead = function () {
        if ($scope.exist_asset_data) {
            for (let i = 0; i < $scope.exist_asset_data.length; i++) {
                $scope.ac_update_exist_item(i)
            }
        }
        if ($scope._repl_asset_data) {
            for (let i = 0; i < $scope.repl_asset_data.length; i++) {
                $scope.ac_update_repl_item(i)
            }
        }
    }

    $scope.netCosts = 0
    $scope.ac_total = ['', '']
    $scope.ac_update_total = function () {
        wacc = parseFloat($scope.wacc) / 100
        $scope.ac_total = ['', '']
        mainCostExist = 0
        mainCostNew = 0
        if ($scope.exist_asset_data) {
            value0 = 0
            for (let i = 0; i < $scope.exist_asset_data.length; i++) {
                e_item = $scope.exist_asset_data[i]
                //only add when it is a number
                if (!isNaN(parseFloat(e_item.presentValueRC))) {
                    value0 += parseFloat(e_item.presentValueRC)
                    cost_pa = (parseFloat(e_item.maintenanceCost) + parseFloat(e_item.vegetationManagementCost))
                        * parseFloat(e_item.quantity)
                    //console.log(cost_pa)
                    present_value = cost_pa * ((1 - (1 + wacc) ** (-$scope.ac_new_weighted_avg_age)) / wacc)
                    //console.log(present_value)
                    mainCostExist += present_value
                }
            }

            $scope.ac_total[0] = value0.toFixed(2)
        }
        if ($scope.repl_asset_data) {
            value1 = 0
            for (let i = 0; i < $scope.repl_asset_data.length; i++) {
                n_item = $scope.repl_asset_data[i]
                //only add when it is a number
                if (!isNaN(parseFloat(n_item.presentValueRC))) {
                    value1 += parseFloat(n_item.presentValueRC)
                    cost_pa = (parseFloat(n_item.maintenanceCost) + parseFloat(n_item.vegetationManagementCost))
                        * parseFloat(n_item.quantity)
                    //console.log(cost_pa)
                    present_value = cost_pa * ((1 - (1 + wacc) ** (-$scope.ac_new_weighted_avg_age)) / wacc)
                    //console.log(present_value)
                    mainCostNew += present_value
                }
            }
            $scope.ac_total[1] = value1
        }
        total = value0 - value1 + mainCostExist - mainCostNew
        $scope.netCosts = total
    }

    $scope.ac_new_weighted_avg_age = 0
    $scope.ac_update_weigted_avg_age = function () {
        cost_age_sum = 0
        cost_sum = 0
        for (let i = 0; i < $scope.repl_asset_data.length; i++) {
            //only add when it is a number
            item = $scope.repl_asset_data[i]
            if (!isNaN(parseFloat(item.stdLife))) {
                cost_age_sum += parseFloat(item.totalCost) * parseFloat(item.stdLife)
                cost_sum += parseFloat(item.totalCost)
            }
        }
        $scope.ac_new_weighted_avg_age = cost_age_sum / cost_sum
        //console.log($scope.ac_new_weighted_avg_age)
    }

    $scope.ac_submit_input = function () {
        //console.log($scope.exist_asset_data)
        //console.log($scope.repl_asset_data)
        data = $scope.exist_asset_data.concat($scope.repl_asset_data);
        //console.log(data)
        var obj = JSON.stringify(
            $scope.exist_asset_data.concat($scope.repl_asset_data)
        );
        //console.log(obj)

        $http({
            method: 'POST',
            url: url + '/insertAvoidedCostAssetReplacementCosts',
            data: obj,
        }).then(function mySuccess(response) {
            //console.log(response.data);
            $window.location.href = '/financials_page'
        })

    }

    //ac basic data
    $scope.ac_submit_basic = function () {
        var obj = JSON.stringify({
            name: $scope.asset,
            stdLife: $scope.life,
            unit: $scope.unit,
            unitCost: $scope.new_asset_cost,
            maintenanceCost: $scope.main_cost,
            vegetationManagementCost: $scope.veg_cost
        })
        $http({
            method: 'POST',
            url: url + '/insertAvoidedCostassetReplacementIterm',
            data: obj,
        }).then(function mySuccess(response) {
            console.log(response.data);
        })
    }

    //connection hand over
    $scope.conn_handover_submit = function () {
        var obj = JSON.stringify({
            projectId: '',
            projectRef: $scope.projectRef,
            portalNo: $scope.portalNo,
            date: $scope.date,
            coustomerBusinesName: $scope.coustomerBusinesName,
            projectAddress: $scope.projectAddress,
            customerContactName: $scope.customerContactName,
            customerContactNumber: $scope.customerContactNumber,
            customerContactEmail: $scope.customerContactEmail,
            maximumAllocatedCapacityPhases: $scope.maximumAllocatedCapacityPhases,
            maximumAllocatedCapacityAmps: $scope.maximumAllocatedCapacityAmps,
            maximumAllocatedCapacitykVA: $scope.maximumAllocatedCapacitykVA,
            existingConnection: $scope.existingConnection,
            embeddedNetwork: $scope.embeddedNetwork,
            reCadvisedofCTarrangement: $scope.reCadvisedofCTarrangement,
            propertyRequirement: $scope.propertyRequirement,
            projectManagerName: $scope.projectManagerName,
            projectManagerPhone: $scope.projectManagerPhone,
            ugCrewRequired: $scope.ugCrewRequired,
            networkOperatorRequired: $scope.networkOperatorRequired,
            complianceReviewedDesign: $scope.complianceReviewedDesign,
            supplyPointDetails: $scope.supplyPointDetails,
            supplyPointComments: $scope.supplyPointComments,
            silVonissue: $scope.silVonissue,
            silVonissueComments: $scope.silVonissueComments
        })
        $http({
            method: 'POST',
            url: url + '/insertConnectionHandover',
            data: obj,
        }).then(function mySuccess(response) {
            console.log(response.data);
        })

    }

	//connection handover get attachment
	$scope.conn_handover_getAllAttachments = function() {
		$http.get('/downlaodedFiles').then(function(response) {
			console.log(response.data)
			$scope.conn_handover_attachment_list = response.data;
		});
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
            console.log(response.data)
            $scope.all_user_data = response.data['data']
            // console.log($scope.all_user_data)
        })
    }

    $scope.delete_user = function (id) {
        console.log("clicked delete_user function")
        console.log($scope.all_user_data[id])
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
    $scope.change_user_password_original_wrong = false
    $scope.change_user_password_success = false

    $scope.changePassword = function (id) {
        console.log("clicked changePassword function")
        console.log($scope.user_old_password)
        console.log($scope.user_new_password_to_change)
        console.log($scope.user_confirm_new_password_to_change)
        // var userId = document.querySelector('#userSettingsUserId').value.toString().trim();
        // console.log(userId)
        if ($scope.user_new_password_to_change.toString() === $scope.user_confirm_new_password_to_change.toString()) {
            $scope.change_user_password_mismatch = false
            $scope.change_user_password_original_wrong = false
            $scope.change_user_password_success = false
            var obj = JSON.stringify({
                // "userId": userId,
                "newPassword": $scope.user_new_password_to_change,
                "originalPassword": $scope.user_old_password,
            })
            $http({
                method: 'POST',
                url: url + '/changePassword',
                data: obj
            }).then(function mySuccess(response) {
                console.log(response)
                var response_data = response.data
                if (response_data['result'].toString() === 'false') {
                    console.log(response_data['message'])
                    $scope.change_user_password_mismatch = false
                    $scope.change_user_password_original_wrong = true
                    $scope.change_user_password_success = false
                } else {
                    console.log(response_data['message'])
                    $scope.change_user_password_mismatch = false
                    $scope.change_user_password_original_wrong = false
                    $scope.change_user_password_success = true
                }

            })
        } else {
            $scope.change_user_password_mismatch = true
            $scope.change_user_password_original_wrong = false
            $scope.change_user_password_success = false
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

    $scope.scopeExclusionItemDescription = ''
    $scope.scopeExclusionItemDescriptionDataSuccess = false
    $scope.scopeExclusionItemDescriptionDataError = false

    $scope.add_scope_exclusion_item = function () {
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

    $scope.add_assumption_item = function () {
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

    $("#nav-tab-66kVConstruction").click(function () {
        var val = $(this).data("value");
        console.log(val)
    })

    $scope.getQuantityInputData = function () {
        console.log("clicked getQuantityInputData function")

        $http({
            method: 'GET',
            url: url + '/quantity_input/getData',
        }).then(function mySuccess(response) {
            console.log(response)
            var response_payload = response['data']
            console.log(response_payload)

            $scope.qi_project_data = response_payload['projectData']
            $scope.project_id_qi = response_payload['projectId']
            $scope.project_status_qi = response_payload['projectStatus']
            console.log($scope.qi_project_data)

            if (response_payload['projectStatus'].toString() === 'new') {
                console.log("New Project - QI")
                $scope.kV_data_all = $scope.qi_project_data[0]['groupData']
                $scope.hV_data_all = $scope.qi_project_data[1]['groupData']
                $scope.lV_data_all = $scope.qi_project_data[2]['groupData']
                $scope.hV_line_data_all = $scope.qi_project_data[3]['groupData']
                $scope.sub_assemblies_data_all = $scope.qi_project_data[4]['groupData']
                $scope.string_bare_conductors_data_all = $scope.qi_project_data[5]['groupData']
            } else {
                console.log("Old Project - QI")
                $scope.kV_data_all = $scope.qi_project_data[0]['groupData']
                $scope.hV_data_all = $scope.qi_project_data[1]['groupData']
                $scope.lV_data_all = $scope.qi_project_data[2]['groupData']
                $scope.hV_line_data_all = $scope.qi_project_data[3]['groupData']
                $scope.sub_assemblies_data_all = $scope.qi_project_data[4]['groupData']
                $scope.string_bare_conductors_data_all = $scope.qi_project_data[5]['groupData']
            }
        })
    }

    $scope.qi_update_row = function (value, id, dataSetName, quantityInputType) {

        if (quantityInputType.toString() === 'actualsQty') {
            $scope[dataSetName][id]['actualsSubTotal'] = parseInt(value) * $scope[dataSetName][id]['unitRate']
            $scope[dataSetName][id]['actualsQty'] = parseInt(value)
            // console.log($scope[dataSetName][id]['actualsSubTotal'])

        } else if (quantityInputType.toString() === 'recouverableQty') {
            $scope[dataSetName][id]['recouverableSubTotal'] = parseInt(value) * $scope[dataSetName][id]['unitRate']
            $scope[dataSetName][id]['recouverableQty'] = parseInt(value)
            // console.log($scope[dataSetName][id]['recouverableSubTotal'])

        } else if (quantityInputType.toString() === 'jemenaQty') {
            $scope[dataSetName][id]['jemenaSubTotal'] = parseInt(value) * $scope[dataSetName][id]['unitRate']
            $scope[dataSetName][id]['jemenaQty'] = parseInt(value)
            // console.log($scope[dataSetName][id]['jemenaSubTotal'])

        } else if (quantityInputType.toString() === 'lcatQty') {
            $scope[dataSetName][id]['lcatSubTotal'] = parseInt(value) * $scope[dataSetName][id]['unitRate']
            $scope[dataSetName][id]['lcatQty'] = parseInt(value)
            // console.log($scope[dataSetName][id]['lcatSubTotal'])
        }
        // console.log($scope.qi_project_data)
    }

    $scope.save_quantity_input_data = function () {
        console.log("clicked save_quantity_input_data function")
        var obj = JSON.stringify({
            "projectId": $scope.project_id_qi,
            "projectStatus": $scope.project_status_qi,
            "result": "",
            "massage": "",
            "projectData": $scope.qi_project_data,
        })
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/quantity_input/saveAndUpdate',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response)

        })
    }

	
	//project list
	$scope.get_all_projects = function(){
		
		$http({
            method: 'POST',
            url: url + '/findPage',
            data: JSON.stringify({
				pageNum : 1,
				pageSize: 100
			})
        }).then(function mySuccess(response) {
			$scope.project_list = response.data.content
			change_projects_date_format();
			console.log($scope.project_list)
        })
		
		 $http.get('/selectAllProjectType').then(function (response) {
            $scope.project_types = response.data;
        });
	}
	
	$scope.search_project = function(){
		var obj = JSON.stringify({
			projectTitle: $scope.projectTitle,
			jemenaWBS: $scope.jemenaWBS,
			inquiryNumber: $scope.inquiryNumber,
			jemenaSapPmOrder: $scope.jemenaSapPmOrder,
			zinfraWBS: $scope.zinfraWBS,
			projectType: $scope.projectType,
			supplyAddress: $scope.supplyAddress
		})
		$http({
            method: 'POST',
            url: url + '/findPage',
            data: obj
        }).then(function mySuccess(response) {
			$scope.project_list = response.data.content
			change_projects_date_format();
        })
	}
	
	function change_projects_date_format(){
		for(let i = 0; i < $scope.project_list.length; i++){
			$scope.project_list[i].createDate = timeConverter($scope.project_list[i].createDate)
		}
	}
	
	function timeConverter(UNIX_timestamp){
	  var a = new Date(UNIX_timestamp);
	  var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
	  var year = a.getFullYear();
	  var month = months[a.getMonth()];
	  var date = a.getDate();
	  var time = date + ' ' + month + ' ' + year;
	  return time;
	}
	
	$scope.view_project = function(id){
		//console.log(parseInt(id))
		var obj = JSON.stringify({
			projectStatus: "existing",
			projectId: id
		})
		$http({
            method: 'POST',
            url: url + '/updateSession',
            data: obj
        }).then(function mySuccess(response) {
            $window.location.href = '/view_project_page';
			console.log(response.data)
        })
		
	}
}])


