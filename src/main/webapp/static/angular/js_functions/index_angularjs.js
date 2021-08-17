var app = angular.module("index_app", []);
app.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
}]);

app.controller('index_controller', ['$scope', '$http', '$interval', function ($scope, $http, $interval) {
    var url = 'https://' + String(location.host)
    var func_count1 = 0
    var func_count2 = 0
    var func_count3 = 0
    var func_count4 = 0
    $scope.solumn_select_flag = 0
    $scope.upload_files_flag = 0
    $scope.cleansing_data = 0
    $scope.cleansing_table = []

    $scope.table_show1 = function () {
        $scope.tables = []
        $http.get(url + '/ajax1')
            .then(function mySuccess(response) {
                var data = JSON.parse(response.data);
                $scope.tables.push({rows: data, cols: Object.keys(data[0])});
            });

    }


    $scope.table_show2 = function () {
        console.log('inside')


        $http.get(url + '/ajax3')
            .then(function mySuccess(response) {
                var data = JSON.parse(response.data);
                console.log(data)
                $scope.data = data

            });


    }

    $scope.selectEntity = function () {
        $scope.list = []
        // If any entity is not checked, then uncheck the "allItemsSelected" checkbox
        for (var i = 0; i < $scope.data.length; i++) {
            if ($scope.data[i].isChecked) {
                console.log($scope.data[i].file_name)
                $scope.list.push($scope.data[i].file_name)
            }
        }


    };
    $scope.delete = function () {
        console.log($scope.list)
        var obj = JSON.stringify({"file_names": $scope.list});
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/ajax4',
            data: obj
        }).then(function mySuccess(response) {
            $scope.table_show()
        });

    };


    $scope.select = function () {
        console.log($scope.list)
        $scope.tables = [];
        if ($scope.list.length == 1) {
            var obj = JSON.stringify({"selected_file": $scope.list});
            console.log(obj)
            $http({
                method: 'POST',
                url: url + '/ajax5',
                data: obj
            }).then(function mySuccess(response) {

                var data = JSON.parse(response.data);

                $scope.tables.push({rows: data, cols: Object.keys(data[0])});


            });
        } else {
            alert('Please Select One File')
        }


    };


    $scope.column_names = function () {
        if (func_count1 == 0) {
            $scope.solumn_select_flag = 1
            $http.get(url + '/ajax2')
                .then(function mySuccess(response) {
                    try {
                        var data = JSON.parse(response.data);
                        console.log(Object.keys(data[0]));
                        $scope.list = Object.keys(data[0])
                        $scope.solumn_select_flag = 0
                    } catch (err) {
                        console.log('pause');
                    }
                });
            func_count1 = 1
        } else {
            func_count1 = 0

        }


    }

    $scope.upload_files = function () {
        $scope.upload_files_flag = 1
        $scope.expand = true
    }


    $scope.get_initial_data_stat = function () {
        if (func_count2 == 0) {
            $scope.cleansing_data = 1;
            var obj = JSON.stringify({"type": 'initial', "column_name": null});
            console.log(obj)
            $http({
                method: 'POST',
                url: url + '/ajax6',
                data: obj
            }).then(function mySuccess(response) {
                var data = JSON.parse(response.data);
                $scope.cleansing_table.push({rows: data, cols: Object.keys(data[0])});
                $scope.cleansing_data = 0


            });
            func_count2 = 1;
        } else {
            func_count2 = 0;
        }


    }


    $scope.get_all_data_stat = function (index) {

        $scope.spinner_flag = true;
        $scope.selected_column_name = '-'
        $scope.gcount = '-'
        $scope.gmax = '-'
        $scope.gmin = '-'
        $scope.gmean = '-'
        $scope.gstd = '-'
        $scope.gt_25 = '-'
        $scope.gt_50 = '-'
        $scope.gt_75 = '-'
        $scope.missing = 0

        var name = $scope.cleansing_table[0].rows;
        //console.log(name[index].Names)
        var selected_column_name = name[index].Names


        var obj = JSON.stringify({"type": 'all', "column_name": selected_column_name});
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/ajax6',
            data: obj
        }).then(function mySuccess(response) {
            var data = JSON.parse(response.data);
            console.log(data)


            $scope.selected_column_name = data[0].Names
            $scope.gcount = data[0].count
            $scope.gmax = data[0].max
            $scope.gmin = data[0].min
            $scope.gmean = data[0].mean
            $scope.gstd = data[0].std
            $scope.missing = data[0].missing
            $scope.gt_25 = data[0]['25%']
            $scope.gt_50 = data[0]['50%']
            $scope.gt_75 = data[0]['75%']

            var quility_precentage = (($scope.gcount - $scope.missing) * 100) / $scope.gcount

            var data = [
                {
                    domain: {x: [0, 1], y: [0, 1]},

                    value: quility_precentage.toString(),
                    title: {text: "Quality %"},
                    type: "indicator",
                    mode: "gauge+number",
                    gauge: {axis: {range: [null, 100]}},


                }
            ];

            var layout = {
                width: 600, height: 420, margin: {t: 0, b: 0}, paper_bgcolor: 'rgba(0,0,0,0)',
                plot_bgcolor: 'rgba(0,0,0,0)'
            }
            Plotly.newPlot('gauge', data, layout);


        });

    }


    $scope.Mean = function (index) {
        console.log(index)
        var name = $scope.cleansing_table[0].rows;
        console.log(name[index].Names)
        $scope.column_name = name[index].Names

        var obj = JSON.stringify({"action": 'mean', "column_name": $scope.column_name});
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/ajax7',
            data: obj
        }).then(function mySuccess(response) {

            var data = JSON.parse(response.data);

            console.log(data)
            $scope.get_initial_data_stat()


        });


    };

    $scope.Mode = function (index) {
        console.log(index)
        var name = $scope.cleansing_table[0].rows;
        console.log(name[index].Names)
        $scope.column_name = name[index].Names

        var obj = JSON.stringify({"action": 'mode', "column_name": $scope.column_name});
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/ajax7',
            data: obj
        }).then(function mySuccess(response) {

            var data = JSON.parse(response.data);

            console.log(data)
            $scope.get_initial_data_stat()


        });
    };

    $scope.Median = function (index) {
        console.log(index)
        var name = $scope.cleansing_table[0].rows;
        console.log(name[index].Names)
        $scope.column_name = name[index].Names

        var obj = JSON.stringify({"action": 'median', "column_name": $scope.column_name});
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/ajax7',
            data: obj
        }).then(function mySuccess(response) {

            var data = JSON.parse(response.data);

            console.log(data)
            $scope.get_initial_data_stat()


        });
    };

    $scope.Predictive = function (index) {
        console.log(index)
        var name = $scope.cleansing_table[0].rows;
        console.log(name[index].Names)
        // console.log(name.Names)
        //var country = $scope.Customers[index].Country;
        //$window.alert("Name: " + name);
    };


    $scope.inspect_table = function () {


        if (func_count4 == 0) {
            $scope.inpect_table_flag = 1

            $scope.inspect_data_table = []
            $http({
                method: 'POST',
                url: url + '/ajax8',
                data: '1'
            }).then(function mySuccess(response) {
                var data = JSON.parse(response.data);
                $scope.inspect_data_table.push({rows: data, cols: Object.keys(data[0])});
                $scope.inpect_table_flag = 0


            });
            func_count4 = 1
        } else {
            func_count4 = 0
        }


    }


}]);
