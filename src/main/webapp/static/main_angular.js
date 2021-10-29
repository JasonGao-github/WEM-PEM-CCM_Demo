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
    //get all basic items to show in the basic data page
    $scope.ncc_get_all_basic = function () {

        $http.get('/selectAllProjectType').then(function (response) {
            $scope.project_types = response.data;
            get_pc_item();
            console.log($scope.project_types);
        });

        $http.get('/selectAllNonContestableType').then(function (response) {
            $scope.ncc_otherTypes = response.data;
            get_other_item();
            console.log($scope.ncc_otherTypes);
        });

        //get item of other = and concat to json
        get_other_item = function () {
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
                    //console.log($scope.ncc_otherTypes)
                })
            }
        }

        //get item of proj comp and concat to json
        get_pc_item = function () {
            for (let i = 0; i < $scope.project_types.length; i++) {
                projectTypeId = $scope.project_types[i].id
                var obj = JSON.stringify({
                    "projectTypeId": projectTypeId
                });

                $http({
                    method: 'POST',
                    url: url + '/findNonContestableProjectComponent',
                    data: obj
                }).then(function mySuccess(response) {
                    //console.log(response.data);
                    $scope.project_types[i].items = response.data;
                })

            }
        }

    }

    $scope.ncc_remove_basic_other = function (id) {
        var obj = JSON.stringify({
            'id': id
        })
        $http({
            method: 'POST',
            url: url + '/deleteNonContestableOtherCostsIterm',
            data: obj,
        }).then(function mySuccess(response) {
            console.log(response.data);
            $scope.ncc_get_all_basic();
        })

    }

    $scope.ncc_remove_basic_pc = function (id) {
        var obj = JSON.stringify({
            'id': id
        })
        $http({
            method: 'POST',
            url: url + '/deleteNonContestableProjectComponent',
            data: obj,
        }).then(function mySuccess(response) {
            console.log(response.data);
            $scope.ncc_get_all_basic();
        })

    }

    $scope.ncc_data = {"proj_comp": [], "other": []}
    $scope.get_ncc = function () {
        $http.get('/selectAllProjectType').then(function (response) {
            $scope.project_types = response.data;
            $scope.selected_type = $scope.project_types[1].projectTypeId;
        });
        existing = false

        //get the data, if exist then prefill the data
        $http.get('/NonContestable/getDataNonContestableProjectComponent').then(function (response) {
            console.log(response.data)
            if (response.data.projectStatus == "exist") {
                existing = true
            }
            payload_format = response.data;
            pc_item = response.data.projectData;
        });

        $http.get('/NonContestable/getDataNonContestableOtherCostsIterm').then(function (response) {
            console.log(response.data)
            if (response.data.projectStatus == "exist") {
                existing = true
            }
            other_item = response.data.projectData;
        });


        $http.get('/selectAllNonContestableType').then(function (response) {
            $scope.ncc_otherTypes = response.data;
            get_item();

            if (existing) {
                $scope.project_types.forEach(type => {
                    //in order to prefill the select input
                    //choose the whole item instead of only the id
                    if (pc_item[0].projectTypeId == type.id)
                        $scope.selected_type = type;
                })
                //$scope.selected_type.id = pc_item[0].projectTypeId
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
                        if (existing) {
                            other_item.forEach(item => {
                                if ($scope.ncc_otherTypes[i].items[j].id == item.nonContestableOtherCostsItemId) {
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
            "projectTypeId": $scope.selected_type.id,
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
                if (existing) {
                    //console.log("item")
                    pc_item.forEach(item => {
                        //console.log(item)
                        if ($scope.proj_comps[j].id == item.nonContestableProjectComponentId) {
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
        if (!quantity) {
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
        if (!quantity) {
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
        //change only the project data to the coming json and keep the format
        payload_format.projectData = $scope.ncc_data.proj_comp
        var proj_comp = JSON.stringify(
            payload_format
        );
        console.log(proj_comp);

        payload_format.projectData = $scope.ncc_data.other
        var other = JSON.stringify(
            payload_format
        );
        console.log(other);

        $http({
            method: 'POST',
            url: url + '/NonContestable/saveAndUpdateNonContestableProjectComponent',
            data: proj_comp
        }).then(function mySuccess(response) {

            $http({
                method: 'POST',
                url: url + '/NonContestable/saveAndUpdateNonContestableOtherCostsIterm',
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
        existing = false
        //get fim type first
        $http.get('/listAllFIMinputType').then(function (response) {
            $http.get('/FIMInput/getData').then(function (response) {
                console.log(response.data);
                if (response.data.projectStatus == "exist") {
                    existing = true;
                }
                fim_item = response.data.projectData;
                payload_format = response.data;
            });
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
                                if (existing) {
                                    fim_item.forEach(item => {
                                        if ($scope.fim_types[i].sub_types[j].items[k].id == item.fIMinputItermId) {
                                            $scope.fim_types[i].sub_types[j].items[k].actual = item.acturalQuantity;
                                            $scope.fim_types[i].sub_types[j].items[k].jen = item.jenFoundedQuantity;
                                            $scope.fim_types[i].sub_types[j].items[k].lcta = item.lctaQuantity;
                                            update_fim_type_total()
                                        }
                                    })
                                }
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
        //replace null values with 0
        if (!actQ) {
            actQ = 0
        }
        if (!jenQ) {
            jenQ = 0
        }
        if (!lctaQ) {
            lctaQ = 0
        }
        if (!actTotal) {
            actTotal = 0
        }
        if (!jenTotal) {
            jenTotal = 0
        }
        if (!lctaTotal) {
            lctaTotal = 0
        }
        //check if existing
        for (let i = 0; i < $scope.fim_data.length; i++) {
            if ($scope.fim_data[i].fIMinputItermId == itemId) {
                $scope.fim_data[i].fIMinputItermId = itemId;
                $scope.fim_data[i].acturalQuantity = actQ;
                $scope.fim_data[i].jenFoundedQuantity = jenQ;
                $scope.fim_data[i].lctaQuantity = lctaQ;
                $scope.fim_data[i].acturalSubTotal = actTotal;
                $scope.fim_data[i].jenFoundedTotal = jenTotal;
                $scope.fim_data[i].lctaTotal = lctaTotal;
                console.log($scope.fim_data);
                return
            }
        }

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
        console.log($scope.fim_data);

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
        payload_format.projectData = $scope.fim_data;
        var obj = JSON.stringify(
            payload_format
        )
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/FIMInput/saveAndUpdate',
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
            $scope.fim_get_basic();
        })

    }

    //get fim basic
    $scope.fim_get_basic = function () {
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
                            //console.log($scope.fim_types)
                        })
                    }
                })
            }
        }


    }

    //fim remove basic data
    $scope.fim_remove_basic = function (id) {
        var obj = JSON.stringify({
            'id': id
        })
        $http({
            method: 'POST',
            url: url + '/deleteFIMinputIterm',
            data: obj,
        }).then(function mySuccess(response) {
            console.log(response.data);
            $scope.fim_get_basic();
        })

    }

    //for avoided cost
    $scope.get_ac = function () {
        $http.get('/selectAllAvoidedCostassetReplacementIterm').then(function (response) {
            //console.log(response.data);
            $scope.ac_items = response.data;
            //set avoidedCostassetReplacementItermId of each item to their id
            for (let i = 0; i < $scope.ac_items.length; i++) {
                $scope.ac_items[i].avoidedCostassetReplacementItermId = $scope.ac_items[i].id
            }
            console.log($scope.ac_items);

            $scope.wacc = 4.72
            $scope.overhead = ''

            $scope.add_ex_asset();
            $scope.add_repl_asset();
        });

    }

    $scope.get_project_ac = function () {
        $http.get('/AvoidedCost/getData').then(function (response) {
                console.log(response.data)
                payload_format = response.data;
                ac_saved_item = payload_format.projectData;
                //console.log(payload_format.projectStatus)
                if (payload_format.projectStatus == 'exist') {
                    //console.log("project exist")
                    $scope.exist_asset_data = []
                    $scope.repl_asset_data = []
                    ac_saved_item.forEach(item => {
                        //console.log("item")
                        //console.log(item)
                        if (item.type == 'exist') {
                            $scope.ac_items.forEach(basic_data => {
                                if (basic_data.avoidedCostassetReplacementItermId == item.avoidedCostassetReplacementItermId) {
                                    let new_data = Object.assign({}, basic_data);
                                    new_data.quantity = item.quantity;
                                    new_data.assetAge = item.assetAge;
                                    new_data.type = 'exist'
                                    $scope.exist_asset_data.push(new_data)
                                    $scope.ac_update_exist_item($scope.exist_asset_data.indexOf(new_data))
                                    console.log(new_data)
                                }
                            })
                        }
                        if (item.type == 'new') {
                            $scope.ac_items.forEach(basic_data => {
                                if (basic_data.avoidedCostassetReplacementItermId == item.avoidedCostassetReplacementItermId) {
                                    let new_data = Object.assign({}, basic_data);
                                    new_data.quantity = item.quantity;
                                    new_data.assetAge = item.assetAge;
                                    basic_data.type = 'new'
                                    $scope.repl_asset_data.push(new_data)
                                    $scope.ac_update_repl_item($scope.repl_asset_data.indexOf(new_data))
                                    console.log(new_data)
                                }
                            })
                        }
                    })
                }

                $scope.ac_update_total()
                $scope.ac_update_weigted_avg_age()
                /*
                console.log("exist assets")
                console.log($scope.exist_asset_data)
                console.log("new assets")
                console.log($scope.repl_asset_data)
                */

                $scope.ac_get_overhead()
                console.log("overhead")
                console.log($scope.ac_overhead)
            }
        );

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

    //add items
    $scope.add_ex_asset = function () {
        let new_data = Object.assign({}, data);
        new_data.type = 'existing'
        $scope.exist_asset_data.push(new_data)
        console.log($scope.exist_asset_data)
    }
    $scope.add_repl_asset = function () {
        let new_data = Object.assign({}, data);
        new_data.type = 'new'
        $scope.repl_asset_data.push(new_data)
        console.log($scope.repl_asset_data)
    }

    //remove items
    $scope.rm_ex_asset = function () {
        $scope.exist_asset_data.pop()
        $scope.ac_update_total()
    }
    $scope.rm_repl_asset = function () {
        $scope.repl_asset_data.pop()
        $scope.ac_update_total()
    }

    $scope.ac_exist_select_item = function (index) {
        //the index of the ac_items and their ac item id offset by one
        //check if the item with that index exist
        if ($scope.ac_items[$scope.exist_asset_data[index].avoidedCostassetReplacementItermId - 1]) {
            //if exist set to this item
            ac_item = $scope.ac_items[$scope.exist_asset_data[index].avoidedCostassetReplacementItermId - 1]
            $scope.exist_asset_data[index].stdLife = ac_item.stdLife
            $scope.exist_asset_data[index].unit = ac_item.unit
            $scope.exist_asset_data[index].unitCost = ac_item.unitCost
            $scope.exist_asset_data[index].maintenanceCost = ac_item.maintenanceCost
            $scope.exist_asset_data[index].vegetationManagementCost = ac_item.vegetationManagementCost
            $scope.exist_asset_data[index].quantity = ''
            $scope.exist_asset_data[index].assetAge = ''
            $scope.exist_asset_data[index].name = ac_item.name
            $scope.exist_asset_data[index].type = 'exist'

        }
        $scope.ac_update_exist_item(index)
        console.log($scope.exist_asset_data)
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
            $scope.repl_asset_data[index].type = 'new'
        }
        $scope.ac_update_repl_item(index)
        console.log($scope.repl_asset_data)
    }

    $scope.ac_update_exist_item = function (index) {
        item = $scope.exist_asset_data[index]
        total = item.unitCost * item.quantity * (1 + $scope.overhead / 100)
        $scope.exist_asset_data[index].totalCost = total
        $scope.exist_asset_data[index].remLife = item.stdLife - item.assetAge
        value = $scope.exist_asset_data[index].totalCost / ((1 + $scope.wacc / 100) ** $scope.exist_asset_data[index].remLife)
        $scope.exist_asset_data[index].presentValueRC = value
        $scope.ac_update_total()
        /*
        console.log("exist assets")
        console.log($scope.exist_asset_data)
        console.log("new assets")
        console.log($scope.repl_asset_data)
        */
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
        /*
        console.log("exist assets")
        console.log($scope.exist_asset_data)
        console.log("new assets")
        console.log($scope.repl_asset_data)
        */
    }

    $scope.ac_get_overhead = function () {
        var overhead = JSON.stringify({
            projectId: payload_format.projectId,
        });

        $http({
            method: 'POST',
            url: url + '/listAvoidedCostESCGuideline',
            data: overhead,
        }).then(function mySuccess(response) {
            data = response.data
            $scope.ac_overhead = parseFloat(data[data.length - 1].constant)
        })
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
        var overhead = JSON.stringify([{
            projectId: payload_format.projectId,
            constant: $scope.ac_overhead
        }]);
        console.log(overhead)

        $http({
            method: 'POST',
            url: url + '/insertAvoidedCostESCGuideline',
            data: overhead,
        }).then(function mySuccess(response) {

        })


        data = $scope.exist_asset_data.concat($scope.repl_asset_data);
        payload_format.projectData = data

        var obj = JSON.stringify(
            payload_format
        );
        console.log(obj)

        $http({
            method: 'POST',
            url: url + '/AvoidedCost/saveAndUpdate',
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
            $scope.get_ac();
        })
    }

    //ac remove basic data
    $scope.ac_remove_basic = function (id) {
        var obj = JSON.stringify({
            'id': id
        })
        $http({
            method: 'POST',
            url: url + '/deleteAvoidedCostassetReplacementIterm',
            data: obj,
        }).then(function mySuccess(response) {
            console.log(response.data);
            $scope.get_ac();
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

    //connection handover get data
    $scope.conn_handover_getData = function () {
        $http.get('/ConnectionHandover/getData').then(function (response) {
            console.log(response.data)
            data = response.data.projectData[0]
            $scope.complianceReviewedDesign = data.complianceReviewedDesign
            $scope.coustomerBusinesName = data.coustomerBusinesName
            $scope.customerContactEmail = data.customerContactEmail
            $scope.customerContactName = data.customerContactName
            $scope.customerContactNumber = data.customerContactNumber
            $scope.date = data.date
            $scope.embeddedNetwork = data.embeddedNetwork
            $scope.existingConnection = data.existingConnection
            $scope.maximumAllocatedCapacityAmps = data.maximumAllocatedCapacityAmps
            $scope.maximumAllocatedCapacityPhases = data.maximumAllocatedCapacityPhases
            $scope.maximumAllocatedCapacitykVA = data.maximumAllocatedCapacitykVA
            $scope.networkOperatorRequired = data.networkOperatorRequired
            $scope.portalNo = data.portalNo
            $scope.projectAddress = data.projectAddress
            $scope.projectId = data.projectId
            $scope.projectManagerName = data.projectManagerName
            $scope.projectManagerPhone = data.projectManagerPhone
            $scope.projectRef = data.projectRef
            $scope.propertyRequirement = data.propertyRequirement
            $scope.reCadvisedofCTarrangement = data.reCadvisedofCTarrangement
            $scope.silVonissue = data.silVonissue
            $scope.silVonissueComments = data.silVonissueComments
            $scope.supplyPointComments = data.supplyPointComments
            $scope.supplyPointDetails = data.supplyPointDetails
            $scope.ugCrewRequired = data.ugCrewRequired

        });

    }

    //connection handover get attachment
    $scope.conn_handover_getAllAttachments = function () {
        $http.get('/downlaodedFiles').then(function (response) {
            console.log(response.data)
            $scope.conn_handover_attachment_list = response.data;
        });
    }

    //for adding attachment
    $scope.add_attachment = function (evt) {
        files = evt.target.files[0];
        console.log(files)
        var formData = new FormData();
        console.log(formData)
        formData.append('file', files);
        console.log(formData)
        $scope.attachments = formData;
        console.log($scope.attachments);
    }

    $scope.conn_handover_submit_attachment = function () {
        data = $scope.attachments;
        $http({
            method: "POST",
            url: url + '/uplaodedFiles',
            data: data,
            headers: {'Content-Type': undefined}
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

    $scope.getCustomerContributionData = function () {
        console.log("clicked getCustomerContributionData function")

        $http({
            method: 'GET',
            url: url + '/customer_contribution/getData',
        }).then(function mySuccess(response) {
            // console.log(response)
            var response_payload = response['data']
            // console.log(response_payload)
            var projectStatus = response_payload['projectStatus']

            if (projectStatus.toString() === "exist") {
                $scope.cc_wbs = response_payload['projectData']['jemenaWBS']
                $scope.cc_inquiryNumber = response_payload['projectData']['inquiryNumber']
                $scope.cc_SAPPM_order = response_payload['projectData']['jemenaSapPmOrder']
                $scope.cc_zinfraWBS = response_payload['projectData']['zinfraWBS']
                $scope.cc_project_title = response_payload['projectData']['projectTitle']
                // $scope.cc_project_type = ''
                $scope.cc_supply_address = response_payload['projectData']['supplyAddress']
                $scope.cc_reason_of_work = response_payload['projectData']['customerReasonForWorks']
                $scope.cc_customer_scope_of_work = response_payload['projectData']['customerScopeOfWork']
                $scope.cc_jemena_scope_of_work = response_payload['projectData']['jemenaScopeOfWork']
                $scope.cc_jemena_scope_of_exclusions = response_payload['projectData']['jemenaScopeExclusions']
                $scope.cc_assumptions = response_payload['projectData']['assumption']
            } else {
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
            }
        })
    }


    //project list
    $scope.get_all_projects = function () {

        $http({
            method: 'POST',
            url: url + '/findPage',
            data: JSON.stringify({
                pageNum: 1,
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

    $scope.search_project = function () {
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

    function change_projects_date_format() {
        for (let i = 0; i < $scope.project_list.length; i++) {
            $scope.project_list[i].createDate = timeConverter($scope.project_list[i].createDate)
        }
    }

    function timeConverter(UNIX_timestamp) {
        var a = new Date(UNIX_timestamp);
        var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        var year = a.getFullYear();
        var month = months[a.getMonth()];
        var date = a.getDate();
        var time = date + ' ' + month + ' ' + year;
        return time;
    }

    $scope.view_project = function (id) {
        //console.log(parseInt(id))
        var obj = JSON.stringify({
            projectStatus: "exist",
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

    $scope.getNegotiatedConnectionData = function () {
        console.log("clicked getNegotiatedConnectionData function")

        $http({
            method: 'GET',
            url: url + '/ContractSchedule/getNegotiatedConnectionData',
        }).then(function mySuccess(response) {
            console.log(response)
            // var response_payload = JSON.parse(response.data);
            // console.log(response_payload)
            var response_payload = response['data']
            $scope.nc_response_payload = response['data']
            $scope.nc_projectData = response_payload['projectData']
            $scope.nc_projectStatus = response_payload['projectStatus']
            $scope.nc_projectId = response_payload['projectId']
            console.log(response_payload)

            if (response_payload['projectStatus'].toString() === 'new') {
                $scope.ncInquiryNumber = response_payload['projectData']['inquiryNumber']
                $scope.ncMaxAllocatedCapacity = response_payload['projectData']['maximumAllocatedCapacity']
                $scope.ncMinContractDemandPrimary = response_payload['projectData']['minimumContractDemandPrimary']
                $scope.ncncMinContractDemandReserve = response_payload['projectData']['minimumContractDemandReserveFeeder']
                $scope.ncScopeOfWorkCustomer = response_payload['projectData']['scopeofWorksCustomerFunded']
                $scope.ncScopeOfWorkJemena = response_payload['projectData']['scopeofWorksJemenaFunded']
                $scope.ncExclusions = response_payload['projectData']['exclusions']
                $scope.ncAssumptions = response_payload['projectData']['assumptions']
                $scope.ncValidityPeriod = "60 Business Days from the date of this offer unless agreed in writing to extend."
                $scope.ncPlannedConstructionPeriod = "12 weeks from date of acceptance (or the agreed site readiness date)."
                $scope.ncNominalSupplyVoltage = "Please select from drop down list" // dropdown
                $scope.ncSupplyAddress = response_payload['projectData']['supplyAddress']
                $scope.ncSupplyPhasing = response_payload['projectData']['supplyPhasing']
                $scope.ncEmbeddedNetwork = response_payload['projectData']['embeddedNetwork'] // dropdown
                $scope.ncInterestRate = "5% over the 90 day Commonwealth Bank Bill rate."
                $scope.ncSecurity = "N/A" // dropdown
                $scope.ncConnectionAssetConnectionPointLocation = "Please select from drop down list"
                $scope.ncPremisesConnectionAssets = "Customer installed connection facility within the customer boundary"
                $scope.ncProjectReference = response_payload['projectData']['projectReference']
                $scope.ncStatutoryOrOther = "N/A"
                $scope.ncLeaseOrEasement = "Please select from drop down list"
                $scope.ncCustomerResponsibleOfficer = response_payload['projectData']['customerResponsibleOfficer']
                $scope.ncJemenaResponsibleOfficer = response_payload['projectData']['jemenaResponsibleOfficer']
                $scope.ncNetworkExtensionOrAugemntation = "Please select from drop down list"
            } else {
                $scope.ncInquiryNumber = response_payload['projectData']['inquiryNumber']
                $scope.ncMaxAllocatedCapacity = response_payload['projectData']['maximumAllocatedCapacity']
                $scope.ncMinContractDemandPrimary = response_payload['projectData']['minimumContractDemandPrimary']
                $scope.ncncMinContractDemandReserve = response_payload['projectData']['minimumContractDemandReserveFeeder']
                $scope.ncScopeOfWorkCustomer = response_payload['projectData']['scopeofWorksCustomerFunded']
                $scope.ncScopeOfWorkJemena = response_payload['projectData']['scopeofWorksJemenaFunded']
                $scope.ncExclusions = response_payload['projectData']['exclusions']
                $scope.ncAssumptions = response_payload['projectData']['assumptions']
                $scope.ncValidityPeriod = response_payload['projectData']['validityPeriod']
                $scope.ncPlannedConstructionPeriod = response_payload['projectData']['plannedConstructionPeriod']
                $scope.ncNominalSupplyVoltage = response_payload['projectData']['nominalSupplyVoltage']
                $scope.ncSupplyAddress = response_payload['projectData']['supplyAddress']
                $scope.ncSupplyPhasing = response_payload['projectData']['supplyPhasing']
                $scope.ncEmbeddedNetwork = response_payload['projectData']['embeddedNetwork'] // dropdown
                $scope.ncInterestRate = response_payload['projectData']['interestrateforoverduepayment']
                $scope.ncSecurity = response_payload['projectData']['security'] // dropdown
                $scope.ncConnectionAssetConnectionPointLocation = response_payload['projectData']['connectionAssetandConnectionPointLocation']
                $scope.ncPremisesConnectionAssets = response_payload['projectData']['premisesConnectionAssetsandPartiesResponsibleforInstallation']
                $scope.ncProjectReference = response_payload['projectData']['projectReference']
                $scope.ncStatutoryOrOther = response_payload['projectData']['statutoryorOtherApprovalstobeobtainedbyJemena']
                $scope.ncLeaseOrEasement = response_payload['projectData']['leaseorEasementRequired']
                $scope.ncCustomerResponsibleOfficer = response_payload['projectData']['customerResponsibleOfficer']
                $scope.ncJemenaResponsibleOfficer = response_payload['projectData']['jemenaResponsibleOfficer']
                $scope.ncNetworkExtensionOrAugemntation = response_payload['projectData']['networkExtensionorAugmentation']
            }
        })
    }

    $scope.getAssetRelocationData = function () {
        console.log("clicked getAssetRelocationData function")

        $http({
            method: 'GET',
            url: url + '/ContractSchedule/getAssetRelocation',
        }).then(function mySuccess(response) {
            console.log(response)
            var response_payload = response['data']
            $scope.ar_response_payload = response['data']
            $scope.ar_projectData = response_payload['projectData']
            $scope.ar_projectStatus = response_payload['projectStatus']
            $scope.ar_projectId = response_payload['projectId']
            console.log(response_payload)

            if (response_payload['projectStatus'].toString() === 'new') {
                $scope.arInquiryNumber = response_payload['projectData']['inquiryNumber']
                $scope.arWorkAddress = response_payload['projectData']['worksAddress']
                $scope.arTypeOfDistributionWork = "Please select from drop down list"
                $scope.arScopeOfWork = response_payload['projectData']['scopeofWorks']
                $scope.arOfferValidityPeriod = "The validity period is 60 business days from the date of this offer unless otherwise agreed in writing."
                $scope.arContestableContribution = ""
                $scope.arNonContestableContribution = "N/A"
                $scope.arPlannedConstructionPeriod = "Please select from drop down list"
                $scope.arCommencementofWorksObligations = "Note: If the customer has not given Jemena it’s required 20 business days’ notice and is not ready by the Planned Construction Period, the customer must pay to Jemena extra costs necessarily incurred by Jemena as a result of the delay"
                $scope.arInterestRateforOverduePayment = "5% over the 90 day Commonwealth Bank Bill rate"
                $scope.arCustomerResponsibleOfficer = ""
                $scope.arJemenaResponsibleOfficer = ""
                $scope.arLeaseOrEasement = "Please select from drop down list"
            } else {
                $scope.arInquiryNumber = response_payload['projectData']['inquiryNumber']
                $scope.arWorkAddress = response_payload['projectData']['worksAddress']
                $scope.arTypeOfDistributionWork = response_payload['projectData']['typeofDistributionWork']
                $scope.arScopeOfWork = response_payload['projectData']['scopeofWorks']
                $scope.arOfferValidityPeriod = response_payload['projectData']['offerValidityPeriod']
                $scope.arContestableContribution = response_payload['projectData']['contestableContributionChargesforWorksCompletedbyJemena']
                $scope.arNonContestableContribution = response_payload['projectData']['nonContestableContributionChargesforWorksCompletedbyJemena']
                $scope.arPlannedConstructionPeriod = response_payload['projectData']['plannedConstructionPeriod']
                $scope.arCommencementofWorksObligations = response_payload['projectData']['commencementofWorksObligations']
                $scope.arInterestRateforOverduePayment = response_payload['projectData']['interestRateforOverduePayment']
                $scope.arCustomerResponsibleOfficer = response_payload['projectData']['customerResponsibleOfficer']
                $scope.arJemenaResponsibleOfficer = response_payload['projectData']['jemenaResponsibleOfficer']
                $scope.arLeaseOrEasement = response_payload['projectData']['leaseorEasementifrequired']
            }
        })
    }

    $scope.getUrdData = function () {
        console.log("clicked getUrdData function")

        $http({
            method: 'GET',
            url: url + '/ContractSchedule/getURD',
        }).then(function mySuccess(response) {
            console.log(response)
            var response_payload = response['data']
            $scope.urd_response_payload = response['data']
            $scope.urd_projectData = response_payload['projectData']
            $scope.urd_projectStatus = response_payload['projectStatus']
            console.log(response_payload)

            if (response_payload['projectStatus'].toString() === 'new') {
                $scope.urdInquiryNumber = response_payload['projectData']['inquiryNumber']
                $scope.urdSupplyAddress = response_payload['projectData']['supplyAddress']
                $scope.urdSubdivision = response_payload['projectData']['subdivision']
                $scope.urdStatOtherApprovals = "N/A"
                $scope.urdSupplyCapacity = "3.5kVA"
                $scope.urdNumLots = ""
                $scope.urdLotNumbers = ""
                $scope.urdLeaseOrEasement = "Yes" //dropdown
                $scope.urdValidityPeriod = "The validity period is 60 Business Days from the date of this offer unless agreed in writing to extend."
                $scope.urdSecurity = "N/A"
                $scope.urdPlannedConstructionPeriod = "To be determined by customer." // dropdown
                $scope.urdConnectionWorksJemena = response_payload['projectData']['descriptionofConnectionWorkstobeundertakenbyJemena']
                $scope.urdConnectionWorksDeveloper = response_payload['projectData']['descriptionofConnectionWorkstobeundertakenbyDeveloper']
                $scope.urdAssetsAndConnectionPoint = "" // dropdown
                $scope.urdPremisesConnectionAssets = "Customer installed connection facility within the customer boundary."
                $scope.urdNetworkExtension = "" // dropdown
                $scope.urdCostOfNewtworkExtension = "As set out in the Connection Charge Details section below"
                $scope.urdMeterInfo = "· The customer must have appropriate metering installed. ·To do this, the customer is required to contact the a retailer to arrange for installation of an appropriate meter. " +
                    "Note: Meter Service Charges are payable if the retailer requests Jemena to supply and install the meter.  The Meter Service Charges are additional fees which are not included in the Connection Charges).\n"
                $scope.urdTenderFee = "N/A"
                $scope.urdApplicableInterestRate = "5% over the 90 day Commonwealth Bank bill rate."
                $scope.urdDeveloperResponsibleOfficer = ""
                $scope.urdJemenaResponsibleOfficer = ""
                $scope.urdOtherJobSpecific = "N/A"
            } else {
                $scope.urdInquiryNumber = response_payload['projectData']['inquiryNumber']
                $scope.urdSupplyAddress = response_payload['projectData']['supplyAddress']
                $scope.urdSubdivision = response_payload['projectData']['subdivision']
                $scope.urdStatOtherApprovals = response_payload['projectData']['statutoryandOtherApprovals']
                $scope.urdSupplyCapacity = response_payload['projectData']['supplyCapacityperLot']
                $scope.urdNumLots = response_payload['projectData']['numberoflots']
                $scope.urdLotNumbers = response_payload['projectData']['lotnumbers']
                $scope.urdLeaseOrEasement = response_payload['projectData']['leaseorEasement']
                $scope.urdValidityPeriod = response_payload['projectData']['validityPeriod']
                $scope.urdSecurity = response_payload['projectData']['security']
                $scope.urdPlannedConstructionPeriod = response_payload['projectData']['plannedConstructionPeriod']
                $scope.urdConnectionWorksJemena = response_payload['projectData']['descriptionofConnectionWorkstobeundertakenbyJemena']
                $scope.urdConnectionWorksDeveloper = response_payload['projectData']['descriptionofConnectionWorkstobeundertakenbyDeveloper']
                $scope.urdAssetsAndConnectionPoint = response_payload['projectData']['connectionAssetsandConnectionPoint']
                $scope.urdPremisesConnectionAssets = response_payload['projectData']['premisesConnectionAssetsandPartiesResponsibleforInstallation']
                $scope.urdNetworkExtension = response_payload['projectData']['networkExtensionorAugmentationifrequired']
                $scope.urdCostOfNewtworkExtension = response_payload['projectData']['costofNetworkExtensionofAugmentation']
                $scope.urdTenderFee = response_payload['projectData']['tenderFeeifapplicable']
                $scope.urdApplicableInterestRate = response_payload['projectData']['applicableInterestRate']
                $scope.urdDeveloperResponsibleOfficer = response_payload['projectData']['developerResponsibleOfficer']
                $scope.urdJemenaResponsibleOfficer = response_payload['projectData']['jemenaResponsibleOfficer']
                $scope.urdOtherJobSpecific = response_payload['projectData']['otherJobSpecificRequirements']
            }
        })
    }

    $scope.getContractScheduleData = function () {
        $scope.getUrdData()
        $scope.getNegotiatedConnectionData()
        $scope.getAssetRelocationData()
    }

    $scope.contractSchedule_update_row = function (value, name) {
        $scope[name] = value
    }

    $scope.submitUrdData = function () {
        console.log("Inside submitUrdData")
        $scope.urd_projectData['inquiryNumber'] = $scope.urdInquiryNumber
        $scope.urd_projectData['applicableInterestRate'] = $scope.urdApplicableInterestRate
        $scope.urd_projectData['companyTradingName'] = "test"
        $scope.urd_projectData['connectionAssetsandConnectionPoint'] = $scope.urdAssetsAndConnectionPoint
        $scope.urd_projectData['costofNetworkExtensionofAugmentation'] = $scope.urdCostOfNewtworkExtension
        $scope.urd_projectData['date'] = null
        $scope.urd_projectData['descriptionofConnectionWorkstobeundertakenbyDeveloper'] = $scope.urdConnectionWorksDeveloper
        $scope.urd_projectData['descriptionofConnectionWorkstobeundertakenbyJemena'] = $scope.urdConnectionWorksJemena
        $scope.urd_projectData['developerResponsibleOfficer'] = $scope.urdDeveloperResponsibleOfficer
        $scope.urd_projectData['id'] = $scope.urd_projectData['id']
        $scope.urd_projectData['inquiryNumber'] = $scope.urdInquiryNumber
        $scope.urd_projectData['jemenaResponsibleOfficer'] = $scope.urdJemenaResponsibleOfficer
        $scope.urd_projectData['leaseorEasement'] = $scope.urdLeaseOrEasement
        $scope.urd_projectData['lotnumbers'] = $scope.urdLotNumbers
        $scope.urd_projectData['meterInformation'] = $scope.urdMeterInfo
        $scope.urd_projectData['networkExtensionorAugmentationifrequired'] = $scope.urdNetworkExtension
        $scope.urd_projectData['numberoflots'] = $scope.urdNumLots
        $scope.urd_projectData['otherJobSpecificRequirements'] = $scope.urdOtherJobSpecific
        $scope.urd_projectData['plannedConstructionPeriod'] = $scope.urdPlannedConstructionPeriod
        $scope.urd_projectData['premisesConnectionAssetsandPartiesResponsibleforInstallation'] = $scope.urdPremisesConnectionAssets
        $scope.urd_projectData['projectId'] = $scope.urd_response_payload['projectId']
        $scope.urd_projectData['security'] = $scope.urdSecurity
        $scope.urd_projectData['statutoryandOtherApprovals'] = $scope.urdStatOtherApprovals
        $scope.urd_projectData['subdivision'] = $scope.urdSubdivision
        $scope.urd_projectData['supplyAddress'] = $scope.urdSupplyAddress
        $scope.urd_projectData['supplyCapacityperLot'] = $scope.urdSupplyCapacity
        $scope.urd_projectData['tenderFeeifapplicable'] = $scope.urdTenderFee
        $scope.urd_projectData['validityPeriod'] = $scope.urdValidityPeriod
        var obj = JSON.stringify({
            "projectId": $scope.urd_response_payload['projectId'],
            "projectStatus": '',
            "result": "success",
            "massage": "",
            "projectData": $scope.urd_projectData,
        })
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/ContractSchedule/saveAndUpdateURD',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response.data)
            var status = response.data['result']
            console.log(status)
            if (status.toString() === 'success') {
                $('#contractScheduleDataModal').modal('show');
            }
        })
    }

    $scope.submitNcdData = function () {
        console.log("Inside submitNcdData")
        $scope.nc_projectData['inquiryNumber'] = $scope.ncInquiryNumber
        $scope.nc_projectData['maximumAllocatedCapacity'] = $scope.ncMaxAllocatedCapacity
        $scope.nc_projectData['minimumContractDemandPrimary'] = $scope.ncMinContractDemandPrimary
        $scope.nc_projectData['minimumContractDemandReserveFeeder'] = $scope.ncncMinContractDemandReserve
        $scope.nc_projectData['scopeofWorksCustomerFunded'] = $scope.ncScopeOfWorkCustomer
        $scope.nc_projectData['scopeofWorksJemenaFunded'] = $scope.ncScopeOfWorkJemena
        $scope.nc_projectData['exclusions'] = $scope.ncExclusions
        $scope.nc_projectData['assumptions'] = $scope.ncAssumptions
        $scope.nc_projectData['validityPeriod'] = $scope.ncValidityPeriod
        $scope.nc_projectData['plannedConstructionPeriod'] = $scope.ncPlannedConstructionPeriod
        $scope.nc_projectData['nominalSupplyVoltage'] = $scope.ncNominalSupplyVoltage
        $scope.nc_projectData['supplyAddress'] = $scope.ncSupplyAddress
        $scope.nc_projectData['supplyPhasing'] = $scope.ncSupplyPhasing
        $scope.nc_projectData['embeddedNetwork'] = $scope.ncEmbeddedNetwork
        $scope.nc_projectData['interestrateforoverduepayment'] = $scope.ncInterestRate
        $scope.nc_projectData['security'] = $scope.ncSecurity
        $scope.nc_projectData['connectionAssetandConnectionPointLocation'] = $scope.ncConnectionAssetConnectionPointLocation
        $scope.nc_projectData['premisesConnectionAssetsandPartiesResponsibleforInstallation'] = $scope.ncPremisesConnectionAssets
        $scope.nc_projectData['projectReference'] = $scope.ncProjectReference
        $scope.nc_projectData['statutoryorOtherApprovalstobeobtainedbyJemena'] = $scope.ncStatutoryOrOther
        $scope.nc_projectData['leaseorEasementRequired'] = $scope.ncLeaseOrEasement
        $scope.nc_projectData['customerResponsibleOfficer'] = $scope.ncCustomerResponsibleOfficer
        $scope.nc_projectData['jemenaResponsibleOfficer'] = $scope.ncJemenaResponsibleOfficer
        $scope.nc_projectData['networkExtensionorAugmentation'] = $scope.ncNetworkExtensionOrAugemntation
        $scope.nc_projectData['abn'] = $scope.nc_projectData['abn']
        $scope.nc_projectData['companyTradingName'] = $scope.nc_projectData['companyTradingName']
        $scope.nc_projectData['date'] = null
        $scope.nc_projectData['id'] = $scope.nc_projectData['id']
        $scope.nc_projectData['projectId'] = $scope.nc_projectId
        var obj = JSON.stringify({
            "projectId": $scope.nc_projectId,
            "projectStatus": '',
            "result": "success",
            "massage": "",
            "projectData": $scope.nc_projectData,
        })
        $http({
            method: 'POST',
            url: url + '/ContractSchedule/saveAndUpdateNegotiatedConnection',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response.data)
            var status = response.data['result']
            console.log(status)
            if (status.toString() === 'success') {
                $('#contractScheduleDataModal').modal('show');
            }
        })
    }

    $scope.submitArdData = function () {
        console.log("Inside submitArdData")
        $scope.ar_projectData['inquiryNumber'] = $scope.arInquiryNumber
        $scope.ar_projectData['worksAddress'] = $scope.arWorkAddress
        $scope.ar_projectData['typeofDistributionWork'] = $scope.arTypeOfDistributionWork
        $scope.ar_projectData['scopeofWorks'] = $scope.arScopeOfWork
        $scope.ar_projectData['offerValidityPeriod'] = $scope.arOfferValidityPeriod
        $scope.ar_projectData['contestableContributionChargesforWorksCompletedbyJemena'] = $scope.arContestableContribution
        $scope.ar_projectData['nonContestableContributionChargesforWorksCompletedbyJemena'] = $scope.arNonContestableContribution
        $scope.ar_projectData['plannedConstructionPeriod'] = $scope.arPlannedConstructionPeriod
        $scope.ar_projectData['commencementofWorksObligations'] = $scope.arCommencementofWorksObligations
        $scope.ar_projectData['interestRateforOverduePayment'] = $scope.arInterestRateforOverduePayment
        $scope.ar_projectData['customerResponsibleOfficer'] = $scope.arCustomerResponsibleOfficer
        $scope.ar_projectData['jemenaResponsibleOfficer'] = $scope.arJemenaResponsibleOfficer
        $scope.ar_projectData['leaseorEasementifrequired'] = $scope.arLeaseOrEasement
        $scope.ar_projectData['id'] = $scope.ar_projectData['id']
        $scope.ar_projectData['projectId'] = $scope.ar_projectId
        var obj = JSON.stringify({
            "projectId": $scope.ar_projectId,
            "projectStatus": '',
            "result": "success",
            "massage": "",
            "projectData": $scope.ar_projectData,
        })
        $http({
            method: 'POST',
            url: url + '/ContractSchedule/saveAndUpdateAssetRelocation',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response.data)
            var status = response.data['result']
            console.log(status)
            if (status.toString() === 'success') {
                $('#contractScheduleDataModal').modal('show');
            }
        })
    }

    $scope.getFinancialsData = function () {
        console.log("clicked getFinancialsData function")

        $http({
            method: 'GET',
            url: url + '/Financial/getData',
        }).then(function mySuccess(response) {
            console.log(response)
            var response_payload = response['data']
            console.log(response_payload)
        })
    }

    $scope.getApproverUserTypes = function () {
        console.log("clicked getApproverUserTypes function")

        $http({
            method: 'GET',
            url: url + '/listAllUserType',
        }).then(function mySuccess(response) {
            console.log(response)
            var response_payload = response['data']
            console.log(response_payload)
        })
    }

    $scope.approverOneNameSelector = true
    $scope.approverOneNameText = false
    $scope.approverTwoNameSelector = true
    $scope.approverTwoNameText = false
    $scope.approverThreeNameSelector = true
    $scope.approverThreeNameText = false

    $scope.getApproversDetails = function () {
        console.log("clicked getApproversDetails function")

        $http({
            method: 'GET',
            url: url + '/Approver/getData',
        }).then(function mySuccess(response) {
            console.log(response)
            var response_payload = response['data']
            console.log(response_payload)

            $scope.approver_project_data = response_payload['projectData']
            console.log($scope.approver_project_data)

            if ($scope.approver_project_data[0]['approverPost'] == null) {
                console.log('data null approver')
                $scope.approverOneStatus = "Not approved"
                $scope.approverOneDate = "None"
                $scope.approver_one_post = "0"
                $scope.approver_one_name = ""

            } else {
                $scope.approverOneStatus = $scope.approver_project_data[0]['approverStatus']
                $scope.approverOneDate = $scope.approver_project_data[0]['approvalDate']
                $scope.approver_one_post = $scope.approver_project_data[0]['approverPost']
                $scope.approver_one_name = $scope.approver_project_data[0]['approverName']

                $scope.approverOneNameSelector = false
                $scope.approverOneNameText = true
                $("#setApprovalBtn1").prop("disabled", true);
                // var name_list = []
                // var item = {id: 1, name: $scope.approver_project_data[0]['approverName'], selected: true}
                // name_list.push(item)
                // $scope.approver_one_name_list = name_list


                // var name_list = []
                // for (var i = 0; i < $scope.approver_project_data.length; i++) {
                //     name_list.push($scope.approver_project_data[i]['approverName'])
                // }
                // $scope.approver_one_name_list = name_list
                // $scope.approver_two_name_list = name_list
                // $scope.approver_three_name_list = name_list
            }

            if ($scope.approver_project_data[1]['approverPost'] == null) {
                console.log('data null approver')

                $scope.approverTwoStatus = "Not approved"
                $scope.approverTwoDate = "None"
                $scope.approver_two_post = "0"
                $scope.approver_two_name = ""
            } else {
                $scope.approverTwoStatus = $scope.approver_project_data[1]['approverStatus']
                $scope.approverTwoDate = $scope.approver_project_data[1]['approvalDate']
                $scope.approver_two_post = $scope.approver_project_data[1]['approverPost']
                $scope.approver_two_name = $scope.approver_project_data[1]['approverName']
                // var name_list = []
                // var item = {id: 0, name: $scope.approver_project_data[1]['approverName']}
                // name_list.push(item)
                // $scope.approver_two_name_list = name_list
                $scope.approverTwoNameSelector = false
                $scope.approverTwoNameText = true
                $("#setApprovalBtn2").prop("disabled", true);
            }

            if ($scope.approver_project_data[2]['approverPost'] == null) {
                console.log('data null approver')

                $scope.approverThreeStatus = "Not approved"
                $scope.approverThreeDate = "None"
                $scope.approver_three_post = "0"
                $scope.approver_three_name = ""
            } else {
                $scope.approverThreeStatus = $scope.approver_project_data[2]['approverStatus']
                $scope.approverThreeDate = $scope.approver_project_data[2]['approvalDate']
                $scope.approver_three_post = $scope.approver_project_data[2]['approverPost']
                $scope.approver_three_name = $scope.approver_project_data[2]['approverName']
                // var name_list = []
                // var item = {id: 0, name: $scope.approver_project_data[2]['approverName']}
                // name_list.push(item)
                // $scope.approver_three_name_list = name_list
                $scope.approverThreeNameSelector = false
                $scope.approverThreeNameText = true
                $("#setApprovalBtn3").prop("disabled", true);
            }

        })
    }

    $scope.getApproversData = function () {
        $scope.getApproverUserTypes()
        $scope.getApproversDetails()
    }

    $('#approverOnePost').on('change', function () {
        console.log("Inside approverOnePost selector ")
        var val = $("#approverOnePost").val();
        $scope.getApproverNames(val, 'approver_one_name_list')
    });

    $('#approverTwoPost').on('change', function () {
        console.log("Inside approverTwoPost selector ")
        var val = $("#approverTwoPost").val();
        $scope.getApproverNames(val, 'approver_two_name_list')
    });

    $('#approverThreePost').on('change', function () {
        console.log("Inside approverThreePost selector ")
        var val = $("#approverThreePost").val();
        $scope.getApproverNames(val, 'approver_three_name_list')
    });

    $scope.getApproverNames = function (userTypeId, approver_order) {
        console.log("clicked getApproverNames function")

        var obj = JSON.stringify({
            "userTypeId": userTypeId,
        })
        $http({
            method: 'POST',
            url: url + '/listUserByType',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response)
            var response_payload = response['data']
            console.log(response_payload)
            $scope.name_list = response_payload['data']
            console.log($scope.name_list)
            var name_list = []
            for (var i = 0; i < $scope.name_list.length; i++) {
                var name = $scope.name_list[i]['firstName'] + ' ' + $scope.name_list[i]['lastName']
                console.log(name)
                var item = {id: i, name: name}
                name_list.push(item)
                console.log(name_list)
            }
            $scope[approver_order] = name_list
        })
    }


    $scope.setApprover = function (id) {
        console.log("clicked setApprover function")

        if (id.toString() === '0') {
            var postId = $("#approverOnePost").val();
            console.log(postId)
            var name = $("#approverOneName").val();
            console.log(name)
            var app_name = $scope.approver_one_name_list[name]['name']
        } else if (id.toString() === '1') {
            var postId = $("#approverTwoPost").val();
            console.log(postId)
            var name = $("#approverTwoName").val();
            console.log(name)
            var app_name = $scope.approver_two_name_list[name]['name']
        } else if (id.toString() === '2') {
            var postId = $("#approverThreeName").val();
            console.log(postId)
            var name = $("#approverThreeName").val();
            console.log(name)
            var app_name = $scope.approver_three_name_list[name]['name']
        }

        var obj = JSON.stringify({
            "approverUserId": $scope.name_list[name]['id'],
            "approverPost": $scope.name_list[name]['userTypeId'],
            "approverName": app_name,
            "approverId": $scope.approver_project_data[id]['id'],
        })
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/Approver/updateApprover',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response)
            var response_payload = response['data']
            console.log(response_payload)
            var status = response.data['result']
            console.log(status)
            if (status.toString() === 'success') {
                $('#approvalDataModal').modal('show');
            }
        })
    }

    $scope.approveProject = function (id) {
        console.log("clicked approveProject function")
        var approverId = $scope.approver_project_data[id]['id']
        console.log(approverId)
        var obj = JSON.stringify({
            "approverId": approverId,
        })
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/Approver/updateStatus',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response)
            var response_payload = response['data']
            console.log(response_payload)
        })
    }


    //List all assigned projects to approve to a user
    $scope.view_user_assigned_approve_projects = function () {

        $http({
            method: 'GET',
            url: url + '/listProjectsByApprover',
            // data: JSON.stringify({
            //     pageNum: 1,
            //     pageSize: 100
            // })
        }).then(function mySuccess(response) {
            $scope.approve_project_list = response.data.content
            change_projects_date_format();
            console.log($scope.approve_project_list)
        })

        $http.get('/selectAllProjectType').then(function (response) {
            $scope.project_types = response.data;
        });
    }

}])


