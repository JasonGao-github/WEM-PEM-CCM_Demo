var workbench = angular.module("workbench_app", ['ngRoute']);

workbench.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';

}]);


workbench.controller('workbench_controller', ['$scope', '$http', '$interval', '$route', '$window', '$timeout', '$sce', function ($scope, $http, $interval, $route, $window, $timeout, $sce) {
    var url = 'http://' + String(location.host);


    let count;
    let items;
    let barchart_count;
    let barchart_list;
    let piechart_count;
    let piechart_list;
    let linechart_count;
    let linechart_list;
    let table_count;
    let table_list;
    let tile_count;
    let tile_list;
    let grid;


    $scope.main_function_title = 'Datasets';
    $scope.plotts_selected_flag = 1;
    $scope.predictions_selected_flag = 0;
    $scope.measures_selected_flag = 0;
    $scope.applications_selected_flag = 0;
    $scope.show_secondary_sidebar = 0;
    $scope.left_content_row_flag = 1;
    $scope.datasets_selected_flag = 0;

    // $scope.show_secondary_sidebar = 1
    // $scope.left_content_row_flag = 1
    // // $scope.main_function_title='Charts'

    $scope.selected_ = [];
    $scope.Dimensions = [];
    $scope.Measures = [];
    $scope.selected_dimensions = [];
    $scope.selected_measures = [];

    $scope.line_chart_dimension_x = [];
    $scope.line_chart_dimension_y = [];
    $scope.line_chart_selected_x = [];
    $scope.line_chart_selected_y = [];

    $scope.bar_chart_dimension_x = [];
    $scope.bar_chart_dimension_y = [];
    $scope.bar_chart_selected_x = [];
    $scope.bar_chart_selected_y = [];

    $scope.pie_chart_dimension_x = [];
    $scope.pie_chart_dimension_y = [];
    $scope.pie_chart_selected_x = [];
    $scope.pie_chart_selected_y = [];

    $scope.table_dimension_x = [];
    $scope.table_dimension_y = [];
    $scope.table_selected_x = [];
    $scope.table_selected_y = [];


    $scope.list_of_measurements = ['Total', 'Average', 'Count'];
    $scope.tile_chart_selected_x = [];
    $scope.tile_chart_selected_measurements = [];

    $scope.template_layout_list = [];

    $scope.app_description_provided = '';
    $scope.iFrameLink = '';
    $scope.iFrameLinkTitle = '';


    $scope.title = '';
    $scope.x_axis = '';
    $scope.y_axis = '';
    $scope.z_axis = '';
    $scope.tileChartDescription = '';
    $scope.grid_lock = false;

    $scope.load_data_to_view = true;
    $scope.load_data_image = true;

    // const ps = new PerfectScrollbar('#table-card');
    // const ps = new PerfectScrollbar('#table-card');
    const paa = new PerfectScrollbar('#chart-card');

    // $('#table-card').ps()


    $scope.workbench_initialise = function () {

        // $http.get(url + '/workbench_initialise')
        //     .then(function mySuccess(response) {
        //         // console.log(response.data)
        //         console.log('workbench_initialise')
        //         $.unblockUI();
        //     });
    };

    // Home button redirects to the Landing page
    $scope.Redirect_to_Landing_Page = function () {
        $window.location.href = 'https://survey-appstore.datampowered.com.au/'
    };

    // $scope.workbench_initialise()

    $scope.main_function_selection = function (selected_function) {

        if (selected_function == 'Sources') {

            console.log(selected_function);
            $scope.main_function_title = 'Sources';
            $scope.plotts_selected_flag = 0;
            $scope.predictions_selected_flag = 0;
            $scope.measures_selected_flag = 1;
            $scope.applications_selected_flag = 0;
            $scope.show_secondary_sidebar = 1;
            $scope.left_content_row_flag = 1;
            $scope.datasets_selected_flag = 0

        }
        if (selected_function == 'Datasets') {

            console.log(selected_function);
            $scope.main_function_title = 'Datasets';
            $scope.plotts_selected_flag = 0;
            $scope.predictions_selected_flag = 0;
            $scope.measures_selected_flag = 0;
            $scope.applications_selected_flag = 0;
            $scope.show_secondary_sidebar = 0;
            $scope.left_content_row_flag = 0;
            $scope.datasets_selected_flag = 1

        }

        if (selected_function == 'Measurements') {

            console.log(selected_function);
            $scope.main_function_title = 'Measurements';
            $scope.plotts_selected_flag = 0;
            $scope.predictions_selected_flag = 0;
            $scope.measures_selected_flag = 1;
            $scope.applications_selected_flag = 0;
            $scope.show_secondary_sidebar = 1;
            $scope.left_content_row_flag = 1;
            $scope.datasets_selected_flag = 0

        }
        if (selected_function == 'Predictions') {

            console.log(selected_function);
            $scope.main_function_title = 'Predictions';
            $scope.plotts_selected_flag = 0;
            $scope.predictions_selected_flag = 1;
            $scope.measures_selected_flag = 0;
            $scope.applications_selected_flag = 0;
            $scope.show_secondary_sidebar = 1;
            $scope.left_content_row_flag = 1;
            $scope.datasets_selected_flag = 0

        }
        if (selected_function == 'Charts') {

            console.log(selected_function);
            $scope.main_function_title = 'Charts';
            $scope.plotts_selected_flag = 1;
            $scope.predictions_selected_flag = 0;
            $scope.measures_selected_flag = 0;
            $scope.applications_selected_flag = 0;
            $scope.show_secondary_sidebar = 0;
            $scope.left_content_row_flag = 1;
            $scope.datasets_selected_flag = 0;
            $scope.workbench_initialise()


        }
        if (selected_function == 'Applications') {
            console.log(selected_function);
            $scope.main_function_title = 'Applications';
            $scope.plotts_selected_flag = 0;
            $scope.predictions_selected_flag = 0;
            $scope.measures_selected_flag = 0;
            $scope.applications_selected_flag = 1;
            $scope.show_secondary_sidebar = 0;
            $scope.left_content_row_flag = 0;
            $scope.datasets_selected_flag = 0;
            $scope.get_saved_applications()
        }

        if (selected_function == 'Home') {
            console.log(selected_function);
            $scope.main_function_title = 'Home';
            $scope.plotts_selected_flag = 0;
            $scope.predictions_selected_flag = 0;
            $scope.measures_selected_flag = 0;
            $scope.applications_selected_flag = 0;
            $scope.show_secondary_sidebar = 0;
            $scope.left_content_row_flag = 0;
            $scope.datasets_selected_flag = 1;
            $window.location.href = 'https://appstore.datampowered.com.au/';

        }
    };


    $scope.redirect_to_workbench_charts = function () {
        $http.get(url + '/render_workbench_charts')
            .then(function mySuccess(response) {
                console.log('test-angular-harindu-charts');
                console.log(response.data);
                console.log(response.data[0]);
                $scope.plotts_selected_flag = response.data[0];
                $scope.predictions_selected_flag = response.data[1];
                $scope.measures_selected_flag = response.data[2];
                $scope.applications_selected_flag = response.data[3];
                $scope.show_secondary_sidebar = response.data[4];
                $scope.left_content_row_flag = response.data[5];
                $scope.main_function_title = response.data[6]
            });
    };

    // $scope.redirect_to_workbench_charts()

    $scope.redirect_to_workbench_applications = function () {
        $http.get(url + '/render_workbench_applications')
            .then(function mySuccess(response) {
                console.log('test-angular-harindu-applications');
                console.log(response.data);
                console.log(response.data[0]);
                $scope.plotts_selected_flag = response.data[0];
                $scope.predictions_selected_flag = response.data[1];
                $scope.measures_selected_flag = response.data[2];
                $scope.applications_selected_flag = response.data[3];
                $scope.show_secondary_sidebar = response.data[4];
                $scope.left_content_row_flag = response.data[5];
                $scope.main_function_title = response.data[6];
                $scope.get_saved_applications()
            });
    };

    // $scope.redirect_to_workbench_applications()

    grid = GridStack.init({float: true});


    $scope.$watch('grid_lock', function () {

        if ($scope.grid_lock == true) {
            grid.movable('.grid-stack-item', false);
            grid.resizable('.grid-stack-item', false);
        } else {
            grid.movable('.grid-stack-item', true);
            grid.resizable('.grid-stack-item', true);
        }


    });


    $scope.chart_storage_list = [];


    linechart_list = [];
    linechart_count = 0;

    barchart_list = [];
    barchart_count = 0;

    piechart_list = [];
    piechart_count = 0;

    table_list = [];
    table_count = 0;

    tile_list = [];
    tile_count = 0;

    items = [];
    count = 0;

    /*Line Chart functions*/
    $scope.add_line_chart_layout = function () {


        if (linechart_list.length == 0) {
            linechart_count = 0
        }

        const node = items[count] || {
            x: 0,
            y: 0,
            width: 6,
            height: 5,
            auto_position: true
        };
        $scope.linechart__template_id = "line_chart_template_".concat(linechart_count);
        $scope.linechart_id = "line_chart_".concat(linechart_count);
        var select_id = "line_chart_select_".concat(linechart_count);

        grid.addWidget('<div id=' + $scope.linechart__template_id.toString() + '><button type="button" onClick="delete_chart(this.parentNode.id)" class="close"  aria-label="Close">\n' +
            '  <span aria-hidden="true">&times;</span>\n' +
            '</button><div  id=' + $scope.linechart_id.toString() + ' class="grid-stack-item-content" style="margin-top:5px;background:#efefff;overflow:hidden;padding:5px; box-shadow: 0 2px 18px 1px rgba(49, 53, 72, 0.1)">' +
            '<div class="spinner-border-dmp" style="margin-top: 150px;" ng-show="bar_loadingInProgress"> <i class="fa fa-spinner fa-pulse"></i> </div></div></div>', node);

        linechart_count = linechart_count + 1;
        linechart_list.push($scope.linechart_id);

        $scope.plot_line_chart();
        // $scope.get_line_chart_initialize_data()

        $scope.template_layout_list.push($scope.linechart__template_id)


    };
    $scope.get_line_chart_initialize_data = function () {
        $('.select2-selection__choice').remove();
        $scope.line_chart_selected_x = [];
        $scope.line_chart_selected_y = [];
        $scope.title_name = '';

        $scope.loadingInProgressLine = true;
        $scope.y_loadingInProgressLine = true;
        $http.get(url + '/line_chart_init')
            .then(function mySuccess(response) {
                // console.log(response.data)
                $scope.loadingInProgressLine = false;
                $scope.y_loadingInProgressLine = false;
                $scope.line_chart_dimension_x = response.data;
                console.log(response.data)
            });
    };

    $scope.$watch('line_chart_selected_x', function () {
        console.log($scope.line_chart_selected_x);
        $scope.line_chart_dimension_y = [];


        if ($scope.line_chart_selected_x.length > 1) {
            alert('For line chart you cannot select multiple x columns');
            $('.select2-selection__choice').remove();
            $scope.line_chart_selected_x = []

        } else {

            if ($scope.line_chart_selected_x != '') {
                var obj = JSON.stringify({
                    "line_chart_selected_x": $scope.line_chart_selected_x.toString(),
                });
                console.log('Harindu line chart 1');
                // console.log(obj)
                $scope.y_loadingInProgressLine = true;
                $http({
                    method: 'POST',
                    url: url + '/line_chart_init',
                    data: obj
                }).then(function mySuccess(response) {
                    console.log(response.data);
                    $scope.y_loadingInProgressLine = false;
                    $scope.line_chart_dimension_y = response.data

                })

            }
        }


    });
    $scope.plot_line_chart = function () {

        var obj = JSON.stringify({
            "x_column": $scope.line_chart_selected_x.toString(),
            "y_column": $scope.line_chart_selected_y.toString(),
        });

        console.log(obj);

        $http({
            method: 'POST',
            url: url + '/get_line_chart_data',
            data: obj
        }).then(function mySuccess(response) {

            console.log(response.data);
            console.log($scope.x_axis);
            console.log(response.data['x_column_data']);
            var x_data = JSON.parse(response.data)['x_column_data'];
            var y_data = JSON.parse(response.data)['y_column_data'];


            if ($scope.title == '') {
                $scope.title = 'No Title'
            }
            if ($scope.x_axis == '') {
                $scope.x_axis = $scope.line_chart_selected_x.toString()
            }

            if ($scope.y_axis == '') {
                $scope.y_axis = $scope.line_chart_selected_y.toString()
            }


            if (x_data.length != y_data.length) {
                $scope.google_multiline(x_data, y_data, $scope.x_axis, $scope.y_axis, $scope.title_name)

            } else {


                if (y_data[0][1]) {
                    $scope.google_multiline(x_data, y_data, $scope.x_axis, $scope.y_axis, $scope.title_name)
                } else {
                    $scope.google_line(x_data, y_data, $scope.x_axis, $scope.y_axis, $scope.title_name)
                }


            }


            $scope.save_chart_configuration($scope.linechart_id, 'line', $scope.title, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.line_chart_selected_x.toString(), $scope.line_chart_selected_y.toString(), '');
            $scope.title = '';
            $scope.x_axis = '';
            $scope.y_axis = ''
        })


    };

    /*Bar Chart functions*/
    $scope.add_bar_chart_layout = function () {

        if (barchart_list.length == 0) {
            barchart_count = 0
        }

        const node = items[count] || {
            x: 0,
            y: 0,
            width: 6,
            height: 5,
            auto_position: true
        };
        $scope.barchart__template_id = "bar_chart_template_".concat(barchart_count);
        $scope.barchart_id = "bar_chart_".concat(barchart_count);
        var
            select_id = "bar_chart_select_".concat(barchart_count);

        grid.addWidget(
            '<div id=' + $scope.barchart__template_id.toString() + '><button type="button" onClick="delete_chart(this.parentNode.id)" class="close" aria-label="Close">\n' +
            '  <span aria-hidden="true">&times;</span>\n' +
            '</button>' +
            '<div id=' + $scope.barchart_id.toString() + ' class="grid-stack-item-content" style="margin-top:5px;background:#efefff;overflow:hidden;padding:5px; box-shadow: 0 2px 18px 1px rgba(49, 53, 72, 0.1)">' +
            '<div class="spinner-border-dmp" style="margin-top: 150px;" ng-show="bar_loadingInProgress"> <i class="fa fa-spinner fa-pulse"></i> </div></div></div>', node);

        barchart_count = barchart_count + 1;
        barchart_list.push($scope.barchart_id);
        $scope.bar_loadingInProgress = true;
        $scope.plot_bar_chart();
        $scope.template_layout_list.push($scope.barchart__template_id)

    };
    $scope.get_bar_chart_initialize_data = function () {
        $('.select2-selection__choice').remove();
        $scope.bar_chart_selected_x = [];
        $scope.bar_chart_selected_y = [];
        $scope.title_name = '';

        $scope.loadingInProgress = true;
        $scope.y_loadingInProgress = true;
        $http.get(url + '/bar_chart_init')
            .then(function
                mySuccess(response) {
                console.log(response.data);
                $scope.loadingInProgress = false;
                $scope.y_loadingInProgress = false;
                $scope.bar_chart_dimension_x = response.data

            });

    };
    $scope.$watch('bar_chart_selected_x', function () {
        console.log($scope.bar_chart_selected_x);
        $scope.bar_chart_dimension_y = [];

        if ($scope.bar_chart_selected_x.length > 1) {
            alert('For bar chart you cannot select multiple x columns');
            $('.select2-selection__choice').remove();
            $scope.bar_chart_selected_x = []

        } else {

            if ($scope.bar_chart_selected_x != '') {
                var
                    obj = JSON.stringify({
                        "bar_chart_selected_x": $scope.bar_chart_selected_x.toString(),
                    });

                console.log(obj);
                $scope.y_loadingInProgress = true;
                $http({
                    method: 'POST',
                    url: url + '/bar_chart_init',
                    data: obj

                }).then(function

                    mySuccess(response) {
                    console.log(response.data);
                    $scope.y_loadingInProgress = false;
                    $scope.bar_chart_dimension_y = response.data;
                    console.log($scope.bar_chart_dimension_y)
                })

            }
        }

    });
    $scope.plot_bar_chart = function () {

        var obj = JSON.stringify({
            "x_column": $scope.bar_chart_selected_x.toString(),
            "y_column": $scope.bar_chart_selected_y.toString(),
        });

        console.log(obj);

        $http({
            method: 'POST',
            url: url + '/get_bar_chart_data',
            data: obj
        }).then(function
            mySuccess(response) {
            console.log(response.data);
            // console.log($scope.x_axis)
            var x_data = JSON.parse(response.data)['x_column_data'];
            var y_data = JSON.parse(response.data)['y_column_data'];

            if ($scope.title == '') {
                $scope.title = 'No Title'
            }
            if ($scope.x_axis == '') {
                $scope.x_axis = $scope.bar_chart_selected_x.toString()
            }

            if ($scope.y_axis == '') {
                $scope.y_axis = $scope.bar_chart_selected_y.toString()
            }


            console.log($scope.x_axis);

            if (x_data.length != y_data.length) {
                $scope.google_multibar(x_data, y_data, $scope.x_axis, $scope.y_axis, $scope.title_name)

            } else {

                if (y_data[0][1]) {
                    $scope.google_multibar(x_data, y_data, $scope.x_axis, $scope.y_axis, $scope.title_name)
                } else {
                    $scope.google_bar(x_data, y_data, $scope.x_axis, $scope.y_axis, $scope.title_name)
                }


            }

            $scope.save_chart_configuration($scope.barchart_id, 'bar', $scope.title, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.bar_chart_selected_x.toString(), $scope.bar_chart_selected_y.toString(), '');
            $scope.title = '';
            $scope.x_axis = '';
            $scope.y_axis = ''

        })

    };

    /*Pie Chart functions*/
    $scope.add_pie_chart_layout = function () {

        if (piechart_list.length == 0) {
            piechart_count = 0
        }

        const node = items[count] || {
            x: 0,
            y: 0,
            width: 6,
            height: 5,
            auto_position: true
        };
        $scope.piechart__template_id = "pie_chart_template_".concat(piechart_count);
        $scope.piechart_id = "pie_chart_".concat(piechart_count);
        var select_id = "pie_chart_select_".concat(piechart_count);

        grid.addWidget(
            '<div id=' + $scope.piechart__template_id.toString() + '><button type="button" onClick="delete_chart(this.parentNode.id)" class="close" aria-label="Close">\n' +
            '  <span aria-hidden="true">&times;</span>\n' +
            '</button>' +
            '<div id=' + $scope.piechart_id.toString() + ' class="grid-stack-item-content" style="margin-top:5px;background:#efefff;overflow:hidden;padding:5px; box-shadow: 0 2px 18px 1px rgba(49, 53, 72, 0.1)">' +
            '<div class="spinner-border-dmp" style="margin-top: 150px;" ng-show="pie_loadingInProgress"> <i class="fa fa-spinner fa-pulse"></i> </div></div></div>', node);

        piechart_count = piechart_count + 1;
        piechart_list.push($scope.piechart_id);
        $scope.pie_loadingInProgress = true;
        $scope.plot_pie_chart();
        $scope.template_layout_list.push($scope.piechart__template_id)
    };
    $scope.get_pie_chart_initialize_data = function () {
        $('.select2-selection__choice').remove();
        $scope.pie_chart_selected_x = [];
        // $scope.bar_chart_selected_y = []
        $scope.pie_title_name = '';

        $scope.pieloadingInProgress = true;
        $http.get(url + '/pie_chart_init')
            .then(function
                mySuccess(response) {
                console.log(response.data);
                $scope.pieloadingInProgress = false;
                $scope.pie_chart_dimension_x = response.data
            });
    };
    $scope.$watch('pie_chart_selected_x', function () {
        // console.log($scope.bar_chart_selected_x)
        // $scope.bar_chart_dimension_y = []

        if ($scope.pie_chart_selected_x != '') {
            var
                obj = JSON.stringify({
                    "pie_chart_selected_x": $scope.pie_chart_selected_x.toString(),
                });
            console.log(obj);
            $http({
                method: 'POST',
                url: url + '/pie_chart_init',
                data: obj
            }).then(function
                mySuccess(response) {
                console.log(response.data)
            })
        }

    });
    $scope.plot_pie_chart = function () {
        var obj = JSON.stringify({
            "x_column": $scope.pie_chart_selected_x.toString(),
            // "y_column": $scope.bar_chart_selected_y.toString(),
        });
        console.log(obj);
        $http({
            method: 'POST',
            url: url + '/get_pie_chart_data',
            data: obj
        }).then(function
            mySuccess(response) {
            console.log(response.data);
            // console.log($scope.x_axis)
            var x_data = JSON.parse(response.data)['labels'];
            var y_data = JSON.parse(response.data)['values'];
            // var y_data = response.data['y_column_data']

            if ($scope.title == '') {
                $scope.title = 'No Title'
            }
            if ($scope.x_axis == '') {
                $scope.x_axis = $scope.pie_chart_selected_x.toString()
            }

            // if ($scope.y_axis == '') {
            //     $scope.y_axis = $scope.bar_chart_selected_y.toString()
            // }

            console.log($scope.x_axis);
            $scope.google_pie(x_data, y_data, $scope.x_axis, $scope.pie_title_name);

            // if (x_data.length != y_data.length) {
            //     $scope.google_multibar(x_data, y_data, $scope.x_axis, $scope.y_axis, $scope.title_name)
            //
            // } else {
            //
            //     if (y_data[0][1]) {
            //         $scope.google_multibar(x_data, y_data, $scope.x_axis, $scope.y_axis, $scope.title_name)
            //     } else {
            //         $scope.google_bar(x_data, y_data, $scope.x_axis, $scope.y_axis, $scope.title_name)
            //     }
            // }

            $scope.save_chart_configuration($scope.piechart_id, 'pie', $scope.pie_title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.pie_chart_selected_x.toString(), $scope.bar_chart_selected_y.toString(), '');
            $scope.title = '';
            $scope.x_axis = '';
            $scope.y_axis = ''
        })

    };

    /*Table functions*/
    $scope.add_table_layout = function () {
        $scope.method_executed = 0;

        if (table_list.length == 0) {
            table_count = 0
        }

        const node = items[count] || {
            x: 0,
            y: 0,
            width: 6,
            height: 5,
            auto_position: true
        };
        $scope.table__template_id = "table_chart_template_".concat(table_count);
        $scope.table_id = "table_chart_".concat(table_count);
        $scope.table_toolbar_id = "table_toolbar_".concat(table_count);
        var select_id = "table_select_".concat(table_count);

        grid.addWidget(
            '<div id=' + $scope.table__template_id.toString() + '><button type="button" onClick="delete_chart(this.parentNode.id)" class="close" aria-label="Close">\n' +
            '  <span aria-hidden="true">&times;</span>\n' +
            '</button><div id=' + $scope.table_id.toString() + ' class="grid-stack-item-content" style="margin-top:5px;background:#efefff;overflow:hidden;padding:5px; box-shadow: 0 2px 18px 1px rgba(49, 53, 72, 0.1)">' +
            '<div class="spinner-border-dmp" style="margin-top: 150px;" ng-show="bar_loadingInProgress"> <i class="fa fa-spinner fa-pulse"></i> </div></div><br></div>', node);
// <div id=' + $scope.table_toolbar_id.toString() + ' class="grid-stack-item-content" style="background:lightblue;overflow:hidden;padding:5px">
        table_count = table_count + 1;
        table_list.push($scope.table_id);

        // $scope.get_table_initialize_data()

        $scope.template_layout_list.push($scope.table__template_id);
        $scope.plot_table()
    };
    $scope.get_table_initialize_data = function () {
        $('.select2-selection__choice').remove();
        $scope.table_selected_x = [];
        $scope.table_selected_y = [];
        $scope.title_name = '';

        $scope.method_executed = 0;
        console.log($scope.method_executed);
        $scope.loadingInProgress = true;
        $http.get(url + '/table_chart_init')
            .then(function
                mySuccess(response) {
                console.log(response.data);
                $scope.loadingInProgress = false;
                $scope.table_dimension_x = response.data;
                $scope.method_executed = 1;
                console.log($scope.method_executed)
            });

    };
    $scope.$watch('table_selected_x', function () {
        // console.log($scope.table_selected_x)
        $scope.bar_chart_dimension_y = [];


        if ($scope.table_selected_x != '') {
            var
                obj = JSON.stringify({
                    "table_selected_x": $scope.table_selected_x.toString(),
                });

            console.log(obj);

            $http({
                method: 'POST',
                url: url + '/table_chart_init',
                data: obj
            }).then(function
                mySuccess(response) {
                console.log(response.data)

                // $scope.bar_chart_dimension_y = response.data

            })

        }


    });
    $scope.plot_table = function () {

        var obj = JSON.stringify({
            "x_column": $scope.table_selected_x.toString(),
        });

        console.log(obj);

        $http({
            method: 'POST',
            url: url + '/get_table_data',
            data: obj
        }).then(function
            mySuccess(response) {

            var data_ = JSON.parse(response.data.x_column_data);
            console.log(data_);



            if ($scope.title == '') {
                $scope.title = 'No Title'
            }
            if ($scope.x_axis == '') {
                $scope.x_axis = $scope.table_selected_x.toString()
            }


            var genColNames = $scope.x_axis.split(',');
            console.log(genColNames);

            $scope.google_table(data_, genColNames, $scope.title_name);


            $scope.save_chart_configuration($scope.table_id, 'table', $scope.title, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.table_selected_x.toString(), '', '');
            $scope.title = '';
            $scope.x_axis = '';
            $scope.y_axis = ''
        })

    };

    /*Tile chart functions*/
    $scope.add_tile_layout = function () {

        if (tile_list.length == 0) {
            tile_count = 0
        }

        const node = items[count] || {
            x: 0,
            y: 0,
            width: 2,
            height: 2,
            auto_position: true
        };
        $scope.tilechart__template_id = "tile_chart_template_".concat(tile_count);
        $scope.tilechart_id = "tile_chart_".concat(tile_count);
        $scope.tilevalue_id = "tile_value_".concat(tile_count);
        $scope.tiledescription_id = "tile_description_".concat(tile_count);
        var
            select_id = "tile_select_".concat(tile_count);

        grid.addWidget(
            '<div id=' + $scope.tilechart__template_id.toString() + '><button type="button" onClick="delete_chart(this.parentNode.id)" class="close" aria-label="Close">\n' +
            '  <span aria-hidden="true">&times;</span>\n' +
            '</button><div id=' + $scope.tilechart_id.toString() + ' class="grid-stack-item-content" style="background:#28d094;overflow:hidden; border-radius: 15px">' +
            '<h1 id=' + $scope.tilevalue_id.toString() + ' class="grid-stack-item-content" style="background:none;overflow:hidden;font-weight: bold;padding-top: 35px"></h1><h3 id=' + $scope.tiledescription_id.toString() + ' class="grid-stack-item-content" style="background:none;overflow:hidden;"></h3>' +
            '<div class="spinner-border-dmp" style="margin-top: 150px;" ng-show="tile_loadingInProgress"> <i class="fa fa-spinner fa-pulse"></i> </div></div>' +
            '</div>', node);

        tile_count = tile_count + 1;
        tile_list.push($scope.tilechart_id);
        $scope.tile_loadingInProgress = true;
        $scope.plot_tile_chart();
        // $scope.get_tile_initialize_data()
        // console.log($scope.tilechart__template_id)
        $scope.template_layout_list.push($scope.tilechart__template_id)
    };
    $scope.get_tile_initialize_data = function () {
        $('.select2-selection__choice').remove();
        $scope.tile_chart_selected_x = [];
        $scope.tile_chart_selected_measurements = [];
        $scope.tileChartDescription = '';

        $scope.loadingInProgress = true;
        $http.get(url + '/tiles_chart_init')
            .then(function
                mySuccess(response) {
                // console.log(response.data)
                $scope.loadingInProgress = false;
                $scope.tile_dimension_x = response.data
            });
    };
    $scope.$watch('tile_chart_selected_measurements', function () {
        // console.log($scope.tile_chart_selected_x)
        // console.log($scope.tile_chart_selected_measurements)

        if ($scope.tile_chart_selected_measurements.length > 1) {
            alert('For tile chart you cannot select multiple measurement');
            $('.select2-selection__choice').remove();
            $scope.tile_chart_selected_measurements = [];
            if ($scope.tile_chart_selected_x.length > 1) {
                alert('For tile chart you cannot select multiple columns');
                $('.select2-selection__choice').remove();
                $scope.tile_chart_selected_measurements = []
            }
        } else {
            if ($scope.tile_chart_selected_x != '') {
                if ($scope.tile_chart_selected_measurements != '') {
                    var
                        obj = JSON.stringify({
                            "tile_chart_selected_x": $scope.tile_chart_selected_x.toString(),
                        });

                    // console.log(obj)
                }
            }
        }
    });
    $scope.$watch('tile_chart_selected_x', function () {
        // console.log($scope.tile_chart_selected_x)

        if ($scope.tile_chart_selected_x.length > 1) {
            alert('For tile chart you cannot select multiple columns');
            $('.select2-selection__choice').remove();
            $scope.tile_chart_selected_measurements = []

        } else {
            if ($scope.tile_chart_selected_x != '') {
                var
                    obj = JSON.stringify({
                        "tile_chart_selected_x": $scope.tile_chart_selected_x.toString(),
                    });

                // console.log(obj)

                $http({
                    method: 'POST',
                    url: url + '/tiles_chart_init',
                    data: obj
                }).then(function
                    mySuccess(response) {
                    // console.log(response.data)
                })
            }
        }
    });
    $scope.plot_tile_chart = function () {

        var obj = JSON.stringify({
            "selected_column": $scope.tile_chart_selected_x.toString(),
            "selected_measure": $scope.tile_chart_selected_measurements.toString(),
        });

        // console.log(obj)

        $http({
            method: 'POST',
            url: url + '/get_tiles_chart_data',
            data: obj
        }).then(function
            mySuccess(response) {
            toastr.success('', 'Tile Chart added', {"closeButton": true});
            var response_value = response.data['response'];
            // console.log(response_value[0])
            $scope.final_value = response_value;
            var tileChartValue = document.getElementById($scope.tilevalue_id);
            tileChartValue.innerHTML = response_value[0];
            var tileChartDescription = document.getElementById($scope.tiledescription_id);
            if ($scope.tileChartDescription == '') {
                tileChartDescription.innerHTML = $scope.tile_chart_selected_measurements.toString() + ' ' + $scope.tile_chart_selected_x.toString()
            } else {
                tileChartDescription.innerHTML = $scope.tileChartDescription
            }
            $scope.save_chart_configuration($scope.tilechart_id, 'tile', $scope.tileChartDescription, $scope.x_axis, $scope.final_value, $scope.tile_chart_selected_measurements.toString(), $scope.tile_chart_selected_x.toString(), '', '');
            $scope.title = '';
            $scope.x_axis = '';
            $scope.y_axis = '';

            var chart_conf_json = {'data': response_value[0]};

            var json_ = {'chart_id': $scope.tilechart_id, 'chart_data': chart_conf_json};

            $scope.chart_storage_list.push(json_)

        })

    };

    /*Link Chart functions*/
    $scope.add_link_chart_layout = function () {

        const node = items[count] || {
            x: 0,
            y: 0,
            width: 6,
            height: 5,
            auto_position: true
        };
        $scope.linkchart__template_id = "link_chart_template_".concat(linechart_count);
        $scope.linkchart_id = "link_chart_".concat(linechart_count);
        var select_id = "link_chart_select_".concat(linechart_count);

        // console.log($scope.iFrameLink.toString())
        // console.log($scope.iFrameLinkTitle.toString())
        grid.addWidget('<div  id=' + $scope.linkchart__template_id.toString() + '><button type="button" onClick="delete_chart(this.parentNode.id)" class="close"  aria-label="Close">\n' +
            '  <span aria-hidden="true">&times;</span>\n' +
            '</button><div  id=' + $scope.linkchart_id.toString() + ' class="grid-stack-item-content" style="background:white;overflow:hidden;padding:5px"><br><iframe style="position: relative; height: 100%; width: 100%;" src=' + $scope.iFrameLink.toString() + '></iframe></div></div>', node);

//
    };

    /*Textbox chart functions*/
    $scope.add_textbox_chart_layout = function () {


        const node = items[count] || {
            x: 0,
            y: 0,
            width: 6,
            height: 5,
            auto_position: true
        };
        $scope.textboxchart__template_id = "link_chart_template_".concat(linechart_count);
        $scope.textboxchart_id = "textbox_chart_".concat(linechart_count);
        var select_id = "textbox_chart_select_".concat(linechart_count);

        grid.addWidget('<div  id=' + $scope.textboxchart__template_id.toString() + '><button type="button" onClick="delete_chart(this.parentNode.id)" class="close"  aria-label="Close">\n' +
            '  <span aria-hidden="true">&times;</span>\n' +
            '</button><div  class="grid-stack-item-content" style="background:white;"><br><div style="height: 70%;" id=' + $scope.textboxchart_id.toString() + '></div></div></div>', node);


        $scope.textboxchart_id = '#'.concat($scope.textboxchart_id);
        // console.log($scope.textboxchart_id)
        var quill = new Quill($scope.textboxchart_id, {
            modules: {
                toolbar: [
                    [{header: [1, 2, true]}],
                    ['bold', 'italic', 'underline'],
                    ['image', 'code-block']
                ]
            },
            placeholder: 'Compose an epic...',
            theme: 'snow'  // or 'bubble'
        });
        quill.enable();
        quill.insertText(0, 'Hello', 'bold', true);
    };

    // delete chart
    delete_chart = function (template_id) {
        // console.log($scope.chart_storage_list)
        // console.log(template_id)
        // console.log('deleting the selected chart')
        grid.removeWidget(template_id);
        var id_ = '#'.concat(template_id);
        $(id_).remove();

        var template_id_str = template_id;
        var chart_id_split = template_id_str.split('_');
        // console.log(chart_id_split)
        var chart_id = chart_id_split[0].concat('_', chart_id_split[1], '_', chart_id_split[3]);
        // console.log(chart_id)
        // console.log($scope.chart_storage_list)

        var i;
        for (i = 0; i < $scope.chart_storage_list.length; i++) {
            // console.log($scope.chart_storage_list[i]['chart_id'])
            if ($scope.chart_storage_list[i]['chart_id'] == chart_id) {

                $scope.chart_storage_list.splice(i)

            }

        }

        // console.log($scope.chart_storage_list)

        try {
            $scope.template_layout_list.pop(template_id_str)
        } catch (e) {

        }


        // var obj = JSON.stringify({
        //     "chart_id": chart_id,
        //
        // });
        //
        //
        // $http({
        //     method: 'POST',
        //     url: url + '/remove_chart',
        //     data: obj
        // }).then(function
        //     mySuccess(response) {
        //
        //
        // })
    };


    $scope.google_line = function (x_data, y_data, xaxis, yaxis, title) {
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        var x_type = typeof x_data[0];
        var y_type = typeof y_data[0];

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
                },
                grid: {
                    row: {
                        colors: ['#545454', 'transparent'], // takes an array which will be repeated on columns
                        opacity: 0.5
                    },
                },
                stroke: {
                    curve: 'smooth'
                },
            };

            var chart = new google.visualization.LineChart(document.getElementById($scope.linechart_id));

            chart.draw(data, options);
            toastr.success('', 'Line Chart added', {"closeButton": true});


            var chart_conf_json = {'options': options, 'data': data};

            var json_ = {'chart_id': $scope.linechart_id, 'chart_data': chart_conf_json};

            $scope.chart_storage_list.push(json_)


        }


    };
    $scope.google_multiline = function (x_data, y_data, xaxis, yaxis, title) {
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);


        var x_type = typeof x_data[0];


        function drawChart() {

            var data = new google.visualization.DataTable();
            data.addColumn(x_type, xaxis);

            var yaxis_spllit = yaxis.split(',');
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

            var chart = new google.visualization.LineChart(document.getElementById($scope.linechart_id));

            chart.draw(data, options);
            toastr.success('', 'Line Chart added', {"closeButton": true});


            var chart_conf_json = {'options': options, 'data': data};

            var json_ = {'chart_id': $scope.linechart_id, 'chart_data': chart_conf_json};

            $scope.chart_storage_list.push(json_)


        }


    };

    $scope.google_bar = function (x_data, y_data, xaxis, yaxis, title) {

        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawBasic);

        var x_type = typeof x_data[0];
        var y_type = typeof y_data[0];

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

            var chart = new google.visualization.ColumnChart(document.getElementById($scope.barchart_id));

            chart.draw(data, options);
            toastr.success('', 'Bar Chart added', {"closeButton": true});

            var chart_conf_json = {'options': options, 'data': data};

            var json_ = {'chart_id': $scope.barchart_id, 'chart_data': chart_conf_json};

            $scope.chart_storage_list.push(json_)


        }


    };
    $scope.google_multibar = function (x_data, y_data, xaxis, yaxis, title) {

        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawBasic);

        var x_type = typeof x_data[0];


        function drawBasic() {


            var data = new google.visualization.DataTable();
            data.addColumn(x_type, xaxis);

            var yaxis_spllit = yaxis.split(',');
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

            var chart = new google.visualization.ColumnChart(document.getElementById($scope.barchart_id));

            chart.draw(data, options);
            toastr.success('', 'Bar Chart added', {"closeButton": true});

            var chart_conf_json = {'options': options, 'data': data};

            var json_ = {'chart_id': $scope.barchart_id, 'chart_data': chart_conf_json};

            $scope.chart_storage_list.push(json_)


        }


    };

    $scope.google_pie = function (x_data, y_data, xaxis, title) {

        google.charts.load('current', {packages: ['corechart']});
        google.charts.setOnLoadCallback(drawBasic);

        var x_type = typeof x_data[0];
        var y_type = typeof y_data[0];

        function drawBasic() {

            var data = new google.visualization.DataTable();
            data.addColumn(x_type, xaxis);
            data.addColumn(y_type, 'yaxis');

            for (var i = 0; i < x_data.length; i++) {
                // console.log(x_data[i])
                // console.log(y_data[i])
                var row = [x_data[i], y_data[i]];
                // console.log(row)
                data.addRow(row)
            }

            var options = {
                "chartArea": {
                    "width": '85%',
                    "height": '90%'
                },
                title: title,
                hAxis: {
                    title: xaxis,
                },
            };

            var chart = new google.visualization.PieChart(document.getElementById($scope.piechart_id));

            chart.draw(data, options);
            toastr.success('', 'Pie Chart added', {"closeButton": true});

            var chart_conf_json = {'options': options, 'data': data};

            var json_ = {'chart_id': $scope.piechart_id, 'chart_data': chart_conf_json};

            $scope.chart_storage_list.push(json_)
        }
    };

    $scope.google_table = function (x_data, genColNames, title) {

        function draw() {
            drawTable();
            // drawToolbar();
        }

        google.charts.load('current', {'packages': ['table']});
        google.charts.setOnLoadCallback(draw);

        function drawToolbar() {
            var components = [
                {
                    type: 'igoogle', datasource: 'https://spreadsheets.google.com/tq?key=pCQbetd-CptHnwJEfo8tALA',
                    gadget: 'https://www.google.com/ig/modules/pie-chart.xml',
                    userprefs: {'3d': 1}
                },
                {type: 'html', datasource: 'https://spreadsheets.google.com/tq?key=pCQbetd-CptHnwJEfo8tALA'},
                {type: 'csv', datasource: 'https://spreadsheets.google.com/tq?key=pCQbetd-CptHnwJEfo8tALA'},
                {
                    type: 'htmlcode', datasource: 'https://spreadsheets.google.com/tq?key=pCQbetd-CptHnwJEfo8tALA',
                    gadget: 'https://www.google.com/ig/modules/pie-chart.xml',
                    userprefs: {'3d': 1},
                    style: 'width: 800px; height: 700px; border: 3px solid purple;'
                }
            ];
            // var container = (document.getElementById($scope.table_toolbar_id))
            google.visualization.drawToolbar(container, components);
        }

        function drawTable() {




            var data = new google.visualization.DataTable();

            // console.log(x_data)

            var colNames = [];
            var colTypes = [];
            var a = 0;
            for (a in x_data) {
                var column = Object.keys(x_data[a]);
                var value = Object.values(x_data[a]);
                colNames.push(column);
                // console.log(column)
                // console.log(value)
                if (a == 1) {
                    for (var b in value) {
                        var type = typeof value[b];
                        colTypes.push(type)
                    }

                }
            }

            var j = 0;
            for (var i in colNames) {
                var colname = colNames[i];

                for (j; j < colname.length; j++) {
                    data.addColumn(colTypes[j], colname[j])

                }
            }

            for (var i in x_data) {
                var value = Object.values(x_data[i]);
                data.addRows([value])
            }
            var table = new google.visualization.Table(document.getElementById($scope.table_id));


            // chart.draw(data, options);
            table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
            toastr.success('', 'Table added', {"closeButton": true});

            var chart_conf_json = {'data': data};

            var json_ = {'chart_id': $scope.table_id, 'chart_data': chart_conf_json};

            $scope.chart_storage_list.push(json_)
        }
    };

    grid.on('gsresizestop', function (event, element) {

        // console.log('resizing the selected chart')
        // console.log(element.id)

        var template_id_str = element.id;
        var chart_id_split = template_id_str.split('_');
        // console.log(chart_id_split)
        var chart_id = chart_id_split[0].concat('_', chart_id_split[1], '_', chart_id_split[3]);
        // console.log(chart_id)
        var newHeight = element.getAttribute('data-gs-height');

        // console.log($scope.chart_storage_list)
        var i;
        for (i = 0; i < $scope.chart_storage_list.length; i++) {

            if ($scope.chart_storage_list[i]['chart_id'] == chart_id) {

                if (chart_id_split[0] == "line") {
                    var chart = new google.visualization.LineChart(document.getElementById(chart_id));
                    var chart_data = $scope.chart_storage_list[i]['chart_data'];

                    chart.draw(chart_data['data'], chart_data['options']);
                } else if (chart_id_split[0] == "bar") {
                    var chart = new google.visualization.ColumnChart(document.getElementById(chart_id));
                    var chart_data = $scope.chart_storage_list[i]['chart_data'];

                    chart.draw(chart_data['data'], chart_data['options']);
                } else if (chart_id_split[0] == "pie") {
                    var chart = new google.visualization.PieChart(document.getElementById(chart_id));
                    var chart_data = $scope.chart_storage_list[i]['chart_data'];

                    chart.draw(chart_data['data'], chart_data['options']);
                } else if (chart_id_split[0] == "table") {
                    var tables = new google.visualization.Table(document.getElementById(chart_id));
                    var table_data = $scope.chart_storage_list[i]['chart_data'];
                    tables.draw(table_data['data'], {showRowNumber: true, width: '100%', height: '100%'});
                    // console.log("Table resizing")
                } else if (chart_id_split[0] == "tile") {
                    // $scope.final_value = response_value
                    var tileChartValue = document.getElementById($scope.tilevalue_id);
                    tileChartValue.innerHTML = $scope.final_value[0];
                    // console.log("Tile resizing")
                }
            }
        }


    });


    $scope.save_chart_configuration = function (chart_id, chart_type, title, xaxis, yaxis, zaxis, x_column, y_column, z_column) {

        var obj = JSON.stringify({
            "chart_id": chart_id,
            "chart_type": chart_type,
            "title": title,
            "xaxis": xaxis,
            "yaxis": yaxis,
            "zaxis": zaxis,
            "x_column": x_column,
            "y_column": y_column,
            "z_column": z_column,
        });


        $http({
            method: 'POST',
            url: url + '/save_chart',
            data: obj
        }).then(function
            mySuccess(response) {
            console.log(response.data)
        })

    };

    $scope.save_application = function () {
        console.log($scope.template_layout_list);

        let obj;
        let grid_height;
        let window_height;
        let height;
        let width;
        let y;
        let x;
        const layout_list = [];
        let i = 0;
        for (i; i < $scope.template_layout_list.length; i++) {
            var id__ = $scope.template_layout_list[i];


            x = document.getElementById(id__).getAttribute("data-gs-x");
            y = document.getElementById(id__).getAttribute("data-gs-y");
            width = document.getElementById(id__).getAttribute("data-gs-width");
            height = document.getElementById(id__).getAttribute("data-gs-height");
            window_height = document.getElementById("advanced-grid").style.height;
            grid_height = 0;//document.getElementById("advanced-grid").getAttribute("data-gs-current-height");


            obj = JSON.stringify({
                "chart_id": id__.toString(),
                "x": x.toString(),
                "y": y.toString(),
                "width": width.toString(),
                "height": height.toString(),
                "window_height": window_height.toString(),
                "grid_height": grid_height.toString()

            });

            layout_list.push(obj)


        }

        obj = JSON.stringify({
            "layout_list": layout_list,
            "app_description": $scope.app_description_provided.toString()
        });

        $http({
            method: 'POST',
            url: url + '/save_template_layout',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response.data);
            console.log("DMP-Save");
            $scope.get_saved_applications();
            $scope.main_function_selection('Applications')
            // $window.location.href = 'render_workbench_view';
        })

    };

    $scope.get_saved_applications = function () {
        console.log("Get Saved Applications");
        $http.get(url + '/get_saved_applications')
            .then(function
                mySuccess(response) {
                console.log(response.data);
                let created_apps_data;
                $scope.created_apps = [];
                created_apps_data = JSON.parse(response.data['response']);
                console.log(created_apps_data);
                // console.log(created_apps_data[0]['app_name'])

                $scope.created_apps = created_apps_data
            });
    };

    $scope.view_selected_application = function (index) {
        console.log(index);
        console.log($scope.created_apps[index]['app_name']);

        var obj = JSON.stringify({
            "app_name": $scope.created_apps[index]['app_name'],
            "meta_file_name": $scope.created_apps[index]['meta_file_name'],
            "template_layout_file_name_": $scope.created_apps[index]['template_layout_file_name'],
            "dataset_name": $scope.created_apps[index]['file_name'],
        });
        $http({
            method: 'POST',
            url: url + '/send_application_data_to_workbench_view',
            data: obj
        }).then(function mySuccess(response) {
            $window.location.href = '/render_workbench_view';
        })
    };


    /////////////////////////////////////////////////////////# start of source upload code/////////////////////////////////////////////
    $scope.table_data = null;
    $scope.datatypes_list = ['Measure', 'Dimension', 'DateTime'];
    $scope.get_uploaded_file_data = function () {
        console.log('yoyoyoy');
        $http.get(url + '/get_uploaded_file_data')
            .then(function mySuccess(response) {
                console.log(response.data);
                $scope.load_data_to_view = false;
                $scope.load_data_image = false;
                var data = JSON.parse(response.data);
                $scope.table_data = JSON.parse(data['json_converted_table']);
                $scope.table_data_types = data['data_type_list'];
                try {
                    $scope.source_files_table = [];
                    $scope.source_files_table.push({rows: $scope.table_data, cols: Object.keys($scope.table_data[0])});
                } catch (e) {
                    $scope.source_files_table = []
                }

            });

    };

    // $("#table-card").ready(function () {
    //     const ps = new PerfectScrollbar('#table-card');
    //     ps.update();
    // });

    // This method would re-set the charts section when a new data set is uploaded
    $("#data_set_save_button").click(function () {
        $("#advanced-grid").empty();
    });

    // $(document).ready(function () {
    //     $(".select2").select2();
    //     $('.select2').on("select2:open", function () {
    //         $('.select2-results__options').perfectScrollbar();
    //     });
    // });

    // Block page Custom
    $(".block-page-2").on("click", function () {
        $.blockUI({
            message: '<div class="spinner-grow" style="color: #c695ec; margin-top: 5px"></div><span class="semibold"><b>Preparing Workspace...</b></span>',
            timeout: 0, //unblock after 2 seconds
            onUnblock: $scope.workbench_initialized,
            overlayCSS: {
                backgroundColor: "#000",
                opacity: 0.7,
                cursor: "wait"
            },
            css: {
                border: 'none',
                padding: '15px',
                backgroundColor: '#000',
                '-webkit-border-radius': '10px',
                '-moz-border-radius': '10px',
                opacity: .5,
                color: '#fff'
            }
        });
    });

    $scope.upload_meta_data = function () {
        // $("#advanced-grid").empty();
        // $scope.template_layout_list = []
        $scope.entered_dataset_name = '';
        console.log($scope.table_data_types);
        console.log($scope.entered_dataset_name);
        obj = JSON.stringify({
            "table_data_types": $scope.table_data_types,
            "entered_dataset_name": $scope.entered_dataset_name,
        });

        $http({
            method: 'POST',
            url: url + '/upload_sequence',
            data: obj
        }).then(function mySuccess(response) {

            $scope.main_function_title = 'Charts';
            $scope.plotts_selected_flag = 1;
            $scope.predictions_selected_flag = 0;
            $scope.measures_selected_flag = 0;
            $scope.applications_selected_flag = 0;
            $scope.show_secondary_sidebar = 1;
            $scope.left_content_row_flag = 1;
            $scope.datasets_selected_flag = 0;
            $scope.workbench_initialise()


        })

    }


}
]);

//////////////////////////////////////////////////////
///////////// WORKBENCH VIEW CONTROLLER /////////////
////////////////////////////////////////////////////

workbench.controller('workbench_view_controller', ['$scope', '$http', '$interval', '$route', '$window', '$timeout', '$sce', function ($scope, $http, $interval, $route, $window, $timeout, $sce) {
    var url = 'http://' + String(location.host);
    var grid = GridStack.init({float: true});

    // $scope.plotts_selected_flag = 0
    // $scope.predictions_selected_flag = 0
    // $scope.measures_selected_flag = 0
    // $scope.applications_selected_flag = 0
    //
    // $scope.show_secondary_sidebar = 1
    // $scope.left_content_row_flag = 1
    // $scope.main_function_title='Charts'
    $scope.workbench_view_initialise = function () {

        $http.get(url + '/workbench_view_initialise')
            .then(function mySuccess(response) {
                console.log(response.data);
                $scope.chart_conf = response.data;
                console.log('workbench_view_initialise');
                $scope.workbench_loading_layout()
            });
    };

    $scope.workbench_view_initialise();

    $scope.workbench_loading_layout = function () {
        console.log('workbench_loading_layout');
        $http.get(url + '/loading_template_layout')
            .then(function mySuccess(response) {
                console.log(response.data);
                var i = 0;
                for (i; i < response.data.length; i++) {


                    var template_id_str = response.data[i]['chart_id'];
                    var chart_id_split = template_id_str.split('_');
                    var chart_id = chart_id_split[0].concat('_', chart_id_split[1], '_', chart_id_split[3]);

                    var x = response.data[i]['x'];
                    var y = response.data[i]['y'];
                    var width = response.data[i]['width'];
                    var height = response.data[i]['height'];
                    const node = {
                        x: x,
                        y: y,
                        width: width,
                        height: height,
                        auto_position: true
                    };
                    var tileValue = $scope.tilevalue_id;
                    var tileDescription = $scope.tiledescription_id;

                    grid.addWidget('<div  id=' + template_id_str + '><button type="button" onClick="delete_chart(this.parentNode.id)" class="close"  aria-label="Close">\n' +
                        '  <span aria-hidden="true">&times;</span>\n' +
                        '</button><div  id=' + chart_id + ' class="grid-stack-item-content" style="background:lightblue;overflow:hidden;padding:5px"></div></div>', node);


                }

                $scope.workbench_loading_chart_configuration()
            });
    };

    $scope.workbench_loading_chart_configuration = function () {
        console.log('ada');
        $http.get(url + '/loading_chart_configuration')
            .then(function mySuccess(response) {
                console.log(response.data);
                $scope.chart_data = response.data;
                $scope.plotting_charts($scope.chart_conf, $scope.chart_data)

            })
    };



    $scope.plotting_charts = function (chart_conf, chart_data) {
        var i = 0;
        for (i; i < chart_conf.length; i++) {

            var chart_type = chart_conf[i].chart_type;
            var chart_id = chart_conf[i].chart_id;
            var title = chart_conf[i].title;
            var x_axis = chart_conf[i].xaxis;
            var y_axis = chart_conf[i].yaxis;
            var z_axis = chart_conf[i].zaxis;
            var x_column_name = chart_conf[i].x_column;
            var y_column_name = chart_conf[i].y_column;
            var z_column_name = chart_conf[i].z_column;


            if (chart_type == "bar") {
                var x_data = chart_data[i]['x_column_data'];
                var y_data = chart_data[i]['y_column_data'];


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

                var x_data = chart_data[i]['x_column_data'];
                var y_data = chart_data[i]['y_column_data'];


                if (x_data.length != y_data.length) {
                    $scope.google_multiline(x_data, y_data, x_axis, y_axis, title, chart_id)

                } else {

                    if (y_data[0][1]) {
                        $scope.google_multiline(x_data, y_data, x_axis, y_axis, title, chart_id)
                    } else {
                        $scope.google_line(x_data, y_data, x_axis, y_axis, title, chart_id)
                    }
                }

            } else if (chart_type == "table") {

                var json_converted_data = JSON.parse(chart_data[i]['table_data']);
                $scope.google_table(json_converted_data, chart_id, title)

            } else if (chart_type == "tile") {
                var testValue = (chart_conf[i].yaxis + chart_conf[i].title);
                // var tileChartValue = document.getElementById($scope.tilevalue_id)
                var tileChartDesc = document.getElementById(chart_id);
                // tileChartValue.innerHTML = chart_conf[i].yaxis
                tileChartDesc.innerHTML = testValue;
                console.log(chart_data)
                // var json_converted_data = JSON.parse(chart_data[i]['table_data'])

            }
        }
    };


    $scope.google_line = function (x_data, y_data, xaxis, yaxis, title, chart_id) {
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        var x_type = typeof x_data[1];
        var y_type = typeof y_data[1];

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


    };
    $scope.google_multiline = function (x_data, y_data, xaxis, yaxis, title, chart_id) {
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);


        var x_type = typeof x_data[1];


        function drawChart() {

            var data = new google.visualization.DataTable();
            data.addColumn(x_type, xaxis);

            var yaxis_spllit = yaxis.split(',');
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


    };

    $scope.google_bar = function (x_data, y_data, xaxis, yaxis, title, chart_id) {

        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawBasic);

        var x_type = typeof x_data[0];
        var y_type = typeof y_data[0];

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


    };
    $scope.google_multibar = function (x_data, y_data, xaxis, yaxis, title, chart_id) {

        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawBasic);

        var x_type = typeof x_data[0];


        function drawBasic() {


            var data = new google.visualization.DataTable();
            data.addColumn(x_type, xaxis);

            var yaxis_spllit = yaxis.split(',');
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


    };

    $scope.google_table = function (x_data, chart_id, title) {

        function draw() {
            drawTable();
            // drawToolbar();
        }

        google.charts.load('current', {'packages': ['table']});
        google.charts.setOnLoadCallback(draw);

        function drawToolbar() {
            var components = [
                {
                    type: 'igoogle', datasource: 'https://spreadsheets.google.com/tq?key=pCQbetd-CptHnwJEfo8tALA',
                    gadget: 'https://www.google.com/ig/modules/pie-chart.xml',
                    userprefs: {'3d': 1}
                },
                {type: 'html', datasource: 'https://spreadsheets.google.com/tq?key=pCQbetd-CptHnwJEfo8tALA'},
                {type: 'csv', datasource: 'https://spreadsheets.google.com/tq?key=pCQbetd-CptHnwJEfo8tALA'},
                {
                    type: 'htmlcode', datasource: 'https://spreadsheets.google.com/tq?key=pCQbetd-CptHnwJEfo8tALA',
                    gadget: 'https://www.google.com/ig/modules/pie-chart.xml',
                    userprefs: {'3d': 1},
                    style: 'width: 800px; height: 700px; border: 3px solid purple;'
                }
            ];
            var container = (document.getElementById($scope.table_toolbar_id))
            // google.visualization.drawToolbar(container, components);
        }

        function drawTable() {

            var data = new google.visualization.DataTable();

            console.log(x_data);

            var colNames = [];
            var colTypes = [];
            var a = 0;
            for (a in x_data) {
                var column = Object.keys(x_data[a]);
                var value = Object.values(x_data[a]);
                colNames.push(column);

                if (a == 1) {
                    for (var b in value) {
                        var type = typeof value[b];
                        colTypes.push(type)
                    }

                }
            }
            var j = 0;
            for (var i in colNames) {
                var colname = colNames[i];

                for (j; j < colname.length; j++) {
                    data.addColumn(colTypes[j], colname[j])

                }
            }

            for (var i in x_data) {
                var value = Object.values(x_data[i]);
                data.addRows([value])
            }
            var table = new google.visualization.Table(document.getElementById(chart_id));
            table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
        }
    };


    $scope.redirect_to_workbench = function (selected_menu_option) {

        if (selected_menu_option == 'Applications') {
            var obj = JSON.stringify({
                "Plotts_selected_flag": 0,
                "Predictions_selected_flag": 0,
                "Measures_selected_flag": 0,
                "Applications_selected_flag": 1,
                "Show_secondary_sidebar": 0,
                "Left_content_row_flag": 0,
                "Main_function_title": 'Applications',
            });
            $http({
                method: 'POST',
                url: url + '/render_workbench_applications',
                data: obj
            }).then(function mySuccess(response) {
                console.log('test102');
                console.log(response.data);
                $window.location.href = '/render_workbench';
            })
        }
        if (selected_menu_option == 'Charts') {
            var obj = JSON.stringify({
                "Plotts_selected_flag": 1,
                "Predictions_selected_flag": 0,
                "Measures_selected_flag": 0,
                "Applications_selected_flag": 0,
                "Show_secondary_sidebar": 1,
                "Left_content_row_flag": 1,
                "Main_function_title": 'Charts',
            });
            $http({
                method: 'POST',
                url: url + '/render_workbench_charts',
                data: obj
            }).then(function mySuccess(response) {
                console.log('test101');
                console.log(response.data);
                $window.location.href = '/render_workbench';
            })
        }
    };

    $scope.get_saved_applications = function () {
        console.log("Get Saved Applications");
        $http.get(url + '/get_saved_applications')
            .then(function
                mySuccess(response) {
                console.log(response.data);
                let created_apps_data;
                $scope.created_apps = [];
                created_apps_data = JSON.parse(response.data['response']);
                console.log(created_apps_data);

                $scope.created_apps = created_apps_data
            });
    }


}
]);
