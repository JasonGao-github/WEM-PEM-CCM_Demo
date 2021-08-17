var workbench = angular.module("workbench_view_app", ['ngRoute']);

workbench.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';

}]);


workbench.controller('workbench_view_controller', ['$scope', '$http', '$interval', '$route', '$window', '$timeout', '$sce', function ($scope, $http, $interval, $route, $window, $timeout, $sce) {
    var url = 'http://' + String(location.host)
    var grid = GridStack.init({float: true});


    $scope.workbench_view_initialise = function () {

        $http.get(url + '/workbench_view_initialise')
            .then(function mySuccess(response) {
                console.log(response.data)
                $scope.chart_conf = response.data
                console.log('workbench_view_initialise')
                $scope.workbench_loading_layout()
            });
    }

    $scope.workbench_loading_layout = function () {

        $http.get(url + '/loading_template_layout')
            .then(function mySuccess(response) {
                console.log(response.data)
                var i = 0
                for (i; i < response.data.length; i++) {


                    var template_id_str = response.data[i]['chart_id']
                    var chart_id_split = template_id_str.split('_')
                    var chart_id = chart_id_split[0].concat('_', chart_id_split[1], '_', chart_id_split[3])

                    var x = response.data[i]['x']
                    var y = response.data[i]['y']
                    var width = response.data[i]['width']
                    var height = response.data[i]['height']
                    const node = {
                        x: x,
                        y: y,
                        width: width,
                        height: height,
                        auto_position: true
                    };

                    grid.addWidget('<div  id=' + template_id_str + '><button type="button" onClick="delete_chart(this.parentNode.id)" class="close"  aria-label="Close">\n' +
                        '  <span aria-hidden="true">&times;</span>\n' +
                        '</button><div  id=' + chart_id + ' class="grid-stack-item-content" style="background:lightblue;overflow:hidden;padding:5px"><br></div></div>', node);


                }

                $scope.workbench_loading_chart_configuration()
            });
    }


    $scope.workbench_loading_chart_configuration = function () {
        console.log('ada')
        $http.get(url + '/loading_chart_configuration')
            .then(function mySuccess(response) {
                console.log(response.data)
                $scope.chart_data = response.data
                $scope.plotting_charts($scope.chart_conf, $scope.chart_data)

            })


    }

    grid.movable('.grid-stack-item', false);
    grid.resizable('.grid-stack-item', false);
    $scope.workbench_view_initialise()

    $scope.plotting_charts = function (chart_conf, chart_data) {
        var i = 0
        for (i; i < chart_conf.length; i++) {

            var chart_type = chart_conf[i].chart_type
            var chart_id = chart_conf[i].chart_id
            var title = chart_conf[i].title
            var x_axis = chart_conf[i].xaxis
            var y_axis = chart_conf[i].yaxis
            var z_axis = chart_conf[i].zaxis
            var x_column_name = chart_conf[i].x_column
            var y_column_name = chart_conf[i].y_column
            var z_column_name = chart_conf[i].z_column


            if (chart_type == "bar") {
                var x_data = chart_data[i]['x_column_data']
                var y_data = chart_data[i]['y_column_data']


                if (x_data.length != y_data.length) {
                    $scope.google_multibar(x_data, y_data, x_axis, y_axis, title, chart_id)

                } else {

                    if (y_data[0][1]) {
                        $scope.google_multibar(x_data, y_data, x_axis, y_axis, title, chart_id)
                    } else {
                        $scope.google_bar(x_data, y_data, x_axis, y_axis, title, chart_id)
                    }


                }

            } else if (chart_type == "line") {

                var x_data = chart_data[i]['x_column_data']
                var y_data = chart_data[i]['y_column_data']


                if (x_data.length != y_data.length) {
                    $scope.google_multiline(x_data, y_data, x_axis, y_axis, title, chart_id)

                } else {

                    if (y_data[0][1]) {
                        $scope.google_multiline(x_data, y_data, x_axis, y_axis, title, chart_id)
                    } else {
                        $scope.google_line(x_data, y_data, x_axis, y_axis, title, chart_id)
                    }


                }

            }


        }


    }


    $scope.google_line = function (x_data, y_data, xaxis, yaxis, title, chart_id) {
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        var x_type = typeof x_data[1]
        var y_type = typeof y_data[1]

        function drawChart() {

            var data = new google.visualization.DataTable();
            data.addColumn(x_type, xaxis);
            data.addColumn(y_type, yaxis);

            for (var i = 0; i < x_data.length; i++) {
                var row = [x_data[i], y_data[i]];
                data.addRow(row);
            }

            var options = {
                title: title,
                curveType: 'function',
                legend: {position: 'bottom'},
                hAxis: {
                    title: yaxis,
                },
                vAxis: {
                    title: xaxis
                }
            };

            var chart = new google.visualization.LineChart(document.getElementById(chart_id));

            chart.draw(data, options);


        }


    }
    $scope.google_multiline = function (x_data, y_data, xaxis, yaxis, title, chart_id) {
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);


        var x_type = typeof x_data[1]


        function drawChart() {

            var data = new google.visualization.DataTable();
            data.addColumn(x_type, xaxis);

            var yaxis_spllit = yaxis.split(',')
            for (var j = 0; j < y_data.length; j++) {
                data.addColumn(typeof y_data[j][0], yaxis_spllit[j]);

            }

            if (y_data.length == 2) {
                for (var i = 0; i < x_data.length; i++) {
                    // for(var j=0;j<number_of_line_charts;j++){}
                    var row = [x_data[i], y_data[0][i], y_data[1][i]];
                    data.addRow(row);
                }
            } else if (y_data.length == 3) {
                for (var i = 0; i < x_data.length; i++) {
                    // for(var j=0;j<number_of_line_charts;j++){}
                    var row = [x_data[i], y_data[0][i], y_data[1][i], y_data[2][i]];
                    data.addRow(row);
                }
            }


            var options = {
                title: title,
                curveType: 'function',
                legend: {position: 'bottom'},
                hAxis: {
                    title: xaxis,
                },
                vAxis: {
                    title: yaxis
                }
            };

            var chart = new google.visualization.LineChart(document.getElementById(chart_id));

            chart.draw(data, options);


        }


    }

    $scope.google_bar = function (x_data, y_data, xaxis, yaxis, title, chart_id) {

        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawBasic);

        var x_type = typeof x_data[1]
        var y_type = typeof y_data[1]

        function drawBasic() {

            var data = new google.visualization.DataTable();
            data.addColumn(x_type, xaxis);
            data.addColumn(y_type, yaxis);

            for (var i = 0; i < x_data.length; i++) {
                var row = [x_data[i], y_data[i]];
                data.addRow(row);
            }

            var options = {
                title: title,
                chartArea: {width: '50%'},
                hAxis: {
                    title: xaxis,
                },
                vAxis: {
                    title: yaxis
                }
            };

            var chart = new google.visualization.ColumnChart(document.getElementById(chart_id));

            chart.draw(data, options);


        }


    }
    $scope.google_multibar = function (x_data, y_data, xaxis, yaxis, title, chart_id) {

        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawBasic);

        var x_type = typeof x_data[1]


        function drawBasic() {


            var data = new google.visualization.DataTable();
            data.addColumn(x_type, xaxis);

            var yaxis_spllit = yaxis.split(',')
            for (var j = 0; j < y_data.length; j++) {
                data.addColumn(typeof y_data[j][0], yaxis_spllit[j]);

            }

            if (y_data.length == 2) {
                for (var i = 0; i < x_data.length; i++) {
                    // for(var j=0;j<number_of_line_charts;j++){}
                    var row = [x_data[i], y_data[0][i], y_data[1][i]];
                    data.addRow(row);
                }
            } else if (y_data.length == 3) {
                for (var i = 0; i < x_data.length; i++) {
                    // for(var j=0;j<number_of_line_charts;j++){}
                    var row = [x_data[i], y_data[0][i], y_data[1][i], y_data[2][i]];
                    data.addRow(row);
                }
            }

            var options = {
                title: title,
                chartArea: {width: '50%'},

                hAxis: {
                    title: xaxis,
                },
                vAxis: {
                    title: yaxis
                }
            };

            var chart = new google.visualization.ColumnChart(document.getElementById(chart_id));

            chart.draw(data, options);


        }


    }


}])