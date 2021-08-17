var workbench = angular.module("workbench", ['ngRoute']);

workbench.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';

}]);


workbench.controller('workbench_controller', ['$scope', '$http', '$interval', '$route', '$window', '$timeout', '$sce', function ($scope, $http, $interval, $route, $window, $timeout, $sce) {
    var url = 'https://' + String(location.host)

    $scope.multiplot_count = 0

    $scope.app_name = null
    $scope.quill = null
    $scope.grid_lock = null

    $scope.title_name = null
    $scope.x_axis = null
    $scope.y_axis = null
    $scope.z_axis = null
    $scope.plot_selected = null
    $scope.column_selected_x = []
    $scope.column_selected_y = []
    $scope.column_selected_z = []
    $scope.x_columns = []
    $scope.y_columns = []
    $scope.chart_type_selected = '2DPlot'
    $scope.numberof_statpills_selected = null
    $scope.pills_discription_list = []
    $scope.pills_selected_columns_list = []
    $scope.link_address = null
    $scope.stock_trigger = null

    $scope.initial_user_columns = null
    $scope.measurements_columns = null


    $scope.unit_price_column = null
    $scope.quantity_column = null
    $scope.date_column = null
    $scope.revenue_column = null
    $scope.customer_id_column = null
    $scope.quantity_column = null
    $scope.math_operation_column = null
    $scope.selected_maths_operation = null


    $scope.maths_operations = ['Mode', 'Mean', 'Median']
    $scope.resampling_operations = ['Weekly', 'Monthly', 'Yearly']
    $scope.link_list_dummy = ["Bunker Stats Api", "Crude Barrel Production Api", "Brent Oil Api", "World Wide Petroleum Production"]
    $scope.dummy_link_select = null
    $scope.flag = 0


    $scope.start = {
        value: null
    };


    $scope.end = {
        value: null
    };
    $scope.pill_numbers = [1, 2, 3, 4, 5]
    $scope.plot_2d_chart_names = ["Bar", "Line"]
    $scope.plot_3d_chart_names = ["Geo Map", "3Dscatter", "Multiple Bar", "Multiple Line"]
    $scope.chart_type = ["2DPlot", '3DPlot', "Table", "Pie", "Text Box", "Stat Pills", "Multiplot", "Link"]
    $scope.plot_multiple_chart_names = ["Bar", "Line"]


    $scope.resultsWithInfo = [{
        name: "Baseline",
        id: "something_unique1",
        idx: 1,
        eui: 100
    }, {
        name: "Alt1",
        id: "something_unique2",
        idx: 2,
        eui: 90
    }, {
        name: "Alt2",
        id: "something_unique3",
        idx: 3,
        eui: 80
    }, {
        name: "Alt3",
        id: "something_unique4",
        idx: 4,
        eui: 75
    }, {
        name: "Alt4",
        id: "something_unique5",
        idx: 5,
        eui: 60
    }];

    // MultiSelect dropdown
    // I want it to store the whole JSON object {id, name, idx, eui}

    // 1.11.8
    // If I do $scope.selected_baselines = []; => multiselect works but only stores 'id'
    // $scope.selected_baselines = {}; => multiselect doesn't work, AND only stores 'id'

    // 2.0.0-beta.10
    // $scope.selected_baselines = {}; => $scope.selectedModel.indexOf is not a function
    // $scope.selected_baselines = []; => works
    // I want it to store the whole JSON object {id, name, idx, eui}
    $scope.selected_baselines = [];
    $scope.selected_baseline_settings = {
        template: '<b>{{option.name}}</b>',
        searchField: 'name',
        enableSearch: true,
        selectionLimit: 4,
        selectedToTop: true // Doesn't work
    };

    $scope.selected_baselines_customTexts = {buttonDefaultText: 'Select Users'};


    $http.get(url + '/save_meta_data_initialise')
        .then(function mySuccess(response) {
            console.log('metadata_initialised')
        });

    $http.get(url + '/get_models')
        .then(function mySuccess(response) {
            try {
                var data = JSON.parse(response.data);
                console.log(Object.keys(data[0]));
                $scope.columns = Object.keys(data[0])
                $scope.initial_user_columns = Object.keys(data[0])

            } catch (err) {
                console.log('pause');
            }
        }, function (response) {

            $http.get(url + '/dashboard_get_columns')
                .then(function mySuccess(response) {
                    try {
                        var data = JSON.parse(response.data);
                        console.log(Object.keys(data[0]));
                        $scope.columns = Object.keys(data[0])
                        $scope.initial_user_columns = Object.keys(data[0])

                    } catch (err) {
                        console.log('pause');
                    }
                });


        });


    $scope.$watch('column_selected_x', function () {
        console.log($scope.column_selected_x)

        if ($scope.chart_type_selected == "2DPlot" && $scope.column_selected_x.length > 1) {
            alert('Please Select Only One column')
            $scope.column_selected_x = []
        }


    })

    $scope.$watch('dummy_link_select', function () {
        console.log($scope.column_selected_x)

        if ($scope.dummy_link_select == "Bunker Stats Api") {
            $scope.link_address = "https://shipandbunker.com/prices#IFO180"
        } else if ($scope.dummy_link_select == "Crude Barrel Production Api") {

            $scope.link_address = "https://www.eia.gov/opendata/embed/iframe.php?series_id=PET.WCESTP11.W;PET.WCESTP21.W;PET.WCESTP41.W;PET.WCESTP31.W;PET.WCESTP51.W&periods=10A"
        } else if ($scope.dummy_link_select == "Brent Oil Api") {
            $scope.link_address = "https://www.eia.gov/opendata/embed/iframe.php?series_id=PET.RWTC.D;PET.RBRTE.D&start=2005"
        } else if ($scope.dummy_link_select == "World Wide Petroleum Production") {
            $scope.link_address = "https://www.eia.gov/opendata/embed/iframe.php?geoset_id=INTL.53-1-TBPD.Q&map=world&relation_mode=line&regions=USA;SAU&start=2005Q1&end=2015Q1&analysis=indexval"
        }


    })


    $scope.$watch('column_selected_y', function () {
        console.log($scope.column_selected_y)

        if ($scope.chart_type_selected == "2DPlot" && $scope.column_selected_y.length > 1) {
            alert('Please Select Only One column')
            $scope.column_selected_y = []
        }


    })

    $scope.$watch('grid_lock', function () {
        console.log($scope.grid_lock)

        if ($scope.grid_lock == true) {

            // $('.grid-stack').data('gridstack').movable('.grid-stack-item', false);
            // $('.grid-stack').data('gridstack').resizable('.grid-stack-item', false);

            var i
            console.log('resize false')
            for (i = 1; i < 7; i++) {
                var id__ = "chart";
                id__ = id__.concat(i.toString(), "_");
                document.getElementById(id__).setAttribute("data-gs-no-move", true);
                document.getElementById(id__).classList.add("ui-draggable-disabled")

            }


        } else {
            // $('.grid-stack').data('gridstack').movable('.grid-stack-item', true);
            // $('.grid-stack').data('gridstack').resizable('.grid-stack-item', true);


            // var i
            // for (i = 1; i < 7; i++) {
            //     var id__ = "chart";
            //     id__ = id__.concat(i.toString(), "_");
            //     document.getElementById(id__).setAttribute("data-gs-no-move", 0);
            //
            // }


        }


    })

    $scope.$watch('numberof_statpills_selected', function () {
        console.log($scope.numberof_statpills_selected)
        $scope.list_of_pills = []
        var i;
        for (i = 0; i < $scope.numberof_statpills_selected; i++) {
            $scope.list_of_pills.push(i)
        }


    })

    $scope.availableColors = ['Age', 'Name', 'Salary', 'Address'];

    $scope.singleDemo = {};
    $scope.singleDemo.color = '';
    $scope.multipleDemo = {};
    $scope.multipleDemocolors = ['Age', 'Name'];
    $scope.multipleDemo.colors2 = ['Age', 'Name'];

    $scope.$watch('chart_type_selected', function () {
        console.log($scope.chart_type_selected)
        if ($scope.chart_type_selected == "2DPlot") {
            $scope.table_selected = false
            $scope.plot2d_selected = true
            $scope.plot3d_selected = false
            $scope.pie_selected = false
            $scope.textbox_selected = false
            $scope.stat_pills_selected = false
            $scope.multiplot_selected = false
            $scope.link_selected = false
        } else if ($scope.chart_type_selected == "3DPlot") {
            $scope.table_selected = false
            $scope.plot2d_selected = false
            $scope.plot3d_selected = true
            $scope.pie_selected = false
            $scope.textbox_selected = false
            $scope.stat_pills_selected = false
            $scope.multiplot_selected = false
            $scope.link_selected = false
        } else if ($scope.chart_type_selected == "Table") {
            $scope.table_selected = true
            $scope.plot2d_selected = false
            $scope.plot3d_selected = false
            $scope.pie_selected = false
            $scope.textbox_selected = false
            $scope.stat_pills_selected = false
            $scope.multiplot_selected = false
            $scope.link_selected = false

        } else if ($scope.chart_type_selected == "Pie") {
            $scope.table_selected = false
            $scope.plot2d_selected = false
            $scope.plot3d_selected = false
            $scope.pie_selected = true
            $scope.textbox_selected = false
            $scope.stat_pills_selected = false
            $scope.multiplot_selected = false
            $scope.link_selected = false

        } else if ($scope.chart_type_selected == "Text Box") {
            $scope.table_selected = false
            $scope.plot2d_selected = false
            $scope.plot3d_selected = false
            $scope.pie_selected = false
            $scope.textbox_selected = true
            $scope.stat_pills_selected = false
            $scope.multiplot_selected = false
            $scope.link_selected = false
        } else if ($scope.chart_type_selected == "Stat Pills") {
            $scope.table_selected = false
            $scope.plot2d_selected = false
            $scope.plot3d_selected = false
            $scope.pie_selected = false
            $scope.textbox_selected = false
            $scope.stat_pills_selected = true
            $scope.multiplot_selected = false
            $scope.link_selected = false
        } else if ($scope.chart_type_selected == "Multiplot") {
            $scope.table_selected = false
            $scope.plot2d_selected = false
            $scope.plot3d_selected = false
            $scope.pie_selected = false
            $scope.textbox_selected = false
            $scope.stat_pills_selected = false
            $scope.multiplot_selected = true
            $scope.link_selected = false
        } else if ($scope.chart_type_selected == "Link") {
            $scope.table_selected = false
            $scope.plot2d_selected = false
            $scope.plot3d_selected = false
            $scope.pie_selected = false
            $scope.textbox_selected = false
            $scope.stat_pills_selected = false
            $scope.multiplot_selected = false
            $scope.link_selected = true
        }

    })


    $scope.chart_ = function (chart_id) {
        let obj;
        console.log(chart_id)
        console.log($scope.chart_type_selected)


        if ($scope.chart_type_selected == "Text Box") {
            if ($scope.quill == null) {
                $scope.text_box_chart(chart_id)
            } else {
                alert('You have already added a text box')
            }
        } else if ($scope.chart_type_selected == "Link") {
            $scope.iframe(chart_id)
            $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'link', $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.link_address, $scope.column_selected_y, $scope.column_selected_z)


        } else if ($scope.chart_type_selected == "Stat Pills") {

            obj = JSON.stringify({
                "chart_type": $scope.chart_type_selected,
                "pill_data_columns": $scope.pills_selected_columns_list,

            });
            $http({

                method: 'POST',
                url: url + '/ajax_pills',
                data: obj
            }).then(function mySuccess(response) {
                console.log(response.data)

                var data = JSON.parse(response.data)
                console.log(data)

                $scope.pill_addition_chart(chart_id, data.pill_data)
                console.log(data.pill_data)
                $scope.pill_datavalues = data.pill_data
                $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'pills', $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.pills_discription_list, $scope.pill_datavalues, $scope.column_selected_z)


            })

        } else if ($scope.chart_type_selected == "Multiplot") {
            console.log('yoyo')
            obj = JSON.stringify({
                "chart_type": $scope.chart_type_selected,
                "plot_type": $scope.plot_selected,
                "x_columns": $scope.x_columns,
                "y_columns": $scope.y_columns,
                "stock_trigger": $scope.stock_trigger

            });
            $http({

                method: 'POST',
                url: url + '/ajax_multiplot',
                data: obj
            }).then(function mySuccess(response) {
                console.log('getting data')
                console.log(response.data)
                var data = JSON.parse(response.data)
                console.log(data)
                $scope.multiple_charts(chart_id, data, $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis)
                if ($scope.multiplot_count == 0) {
                    $scope.x_columns.push('rolling_date_one')
                    $scope.x_columns.push('rolling_date_two')
                    $scope.y_columns.push('rolling_mean_one')
                    $scope.y_columns.push('rolling_mean_two')
                    $scope.multiplot_count = 1
                }


                $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'multiplot', $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.x_columns, $scope.y_columns, $scope.column_selected_z)

            })


        } else {

            console.log($scope.title_name)
            console.log($scope.x_axis)
            console.log($scope.y_axis)
            console.log($scope.plot_selected)
            console.log($scope.column_selected_x)
            console.log($scope.column_selected_y)
            console.log($scope.start.value)
            console.log($scope.end.value)
            console.log($scope.chart_type_selected)

            $scope.table_ = []


            obj = JSON.stringify({
                "chart_type": $scope.chart_type_selected,
                "column_selected_x": $scope.column_selected_x,
                "column_selected_y": $scope.column_selected_y,
                "column_selected_z": $scope.column_selected_z,
                "range_type": null
            });
            $http({

                method: 'POST',
                url: url + '/ajax_chart',
                data: obj
            }).then(function mySuccess(response) {

                let values;
                let headerNames;
                let date;
                let y;
                let x;
                let z;
                let data;

                if ($scope.chart_type_selected == '2DPlot') {

                    data = JSON.parse(response.data);
                    console.log(data)
                    y = [];
                    x = [];


                    for (i = 0; i < data.length; i++) {
                        y.push(data[i][$scope.column_selected_y.toString()]);
                        x.push(data[i][$scope.column_selected_x.toString()])

                    }


                    if ($scope.plot_selected.toString() == 'Bar') {
                        console.log($scope.y_axis)
                        console.log($scope.x_axis)

                        if ($scope.x_axis == null && $scope.y_axis == null) {
                            console.log($scope.column_selected_x)
                            $scope.bar_chart(chart_id, y, x, $scope.title_name, $scope.column_selected_x[0], $scope.column_selected_y[0]);
                            $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'bar', $scope.title_name, $scope.column_selected_x[0], $scope.column_selected_y[0], null, $scope.column_selected_x, $scope.column_selected_y, $scope.column_selected_z)
                        } else {
                            $scope.bar_chart(chart_id, y, x, $scope.title_name, $scope.x_axis, $scope.y_axis);
                            $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'bar', $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.column_selected_x, $scope.column_selected_y, $scope.column_selected_z)
                        }


                    } else if ($scope.plot_selected.toString() == 'Line') {
                        if ($scope.x_axis == null && $scope.y_axis == null) {
                            $scope.line_chart(chart_id, y, x, $scope.title_name, $scope.column_selected_x[0], $scope.column_selected_y[0]);
                            $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'line', $scope.title_name, $scope.column_selected_x[0], $scope.column_selected_y[0], null, $scope.column_selected_x, $scope.column_selected_y, $scope.column_selected_z)

                        } else {
                            $scope.line_chart(chart_id, y, x, $scope.title_name, $scope.x_axis, $scope.y_axis);
                            $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'line', $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.column_selected_x, $scope.column_selected_y, $scope.column_selected_z)

                        }


                    }


                } else if ($scope.chart_type_selected == '3DPlot') {
                    data = JSON.parse(response.data);
                    console.log(data)
                    y = [];
                    x = [];
                    z = [];


                    for (i = 0; i < data.length; i++) {
                        y.push(data[i][$scope.column_selected_y.toString()]);
                        x.push(data[i][$scope.column_selected_x.toString()])
                        z.push(data[i][$scope.column_selected_z.toString()])

                    }
                    if ($scope.plot_selected.toString() == "Geo Map") {
                        $scope.geo_map_chart(chart_id, y, x, z, $scope.title_name, $scope.x_axis, $scope.y_axis);
                        $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'geomap', $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.column_selected_x, $scope.column_selected_y, $scope.column_selected_z)

                    } else if ($scope.plot_selected.toString() == "3Dscatter") {
                        $scope.scatter_chart(chart_id, y, x, z, $scope.title_name, $scope.x_axis, $scope.y_axis);
                        $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'scatter', $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.column_selected_x, $scope.column_selected_y, $scope.column_selected_z)
                    } else if ($scope.plot_selected.toString() == "Multiple Bar") {


                        if ($scope.x_axis == null && $scope.y_axis == null) {
                            console.log($scope.column_selected_x)
                            $scope.multiple_bar_chart(chart_id, y, x, z, $scope.title_name, $scope.column_selected_x[0], $scope.column_selected_y[0], $scope.column_selected_z[0]);
                            $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'multiple_bar', $scope.title_name, $scope.column_selected_x[0], $scope.column_selected_y[0], null, $scope.column_selected_x, $scope.column_selected_y, $scope.column_selected_z)
                        } else {
                            $scope.multiple_bar_chart(chart_id, y, x, z, $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis)
                            $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'multiple_bar', $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.column_selected_x, $scope.column_selected_y, $scope.column_selected_z)

                        }


                    } else if ($scope.plot_selected.toString() == "Multiple Line") {


                        if ($scope.x_axis == null && $scope.y_axis == null) {
                            console.log($scope.column_selected_x)
                            $scope.multiple_line_chart(chart_id, y, x, z, $scope.title_name, $scope.column_selected_x[0], $scope.column_selected_y[0], $scope.column_selected_z[0]);
                            $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'multiple_line', $scope.title_name, $scope.column_selected_x[0], $scope.column_selected_y[0], null, $scope.column_selected_x, $scope.column_selected_y, $scope.column_selected_z)
                        } else {
                            $scope.multiple_line_chart(chart_id, y, x, z, $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis)
                            $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'multiple_line', $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.column_selected_x, $scope.column_selected_y, $scope.column_selected_z)

                        }


                    }


                } else if ($scope.chart_type_selected == 'Table') {
                    data = JSON.parse(response.data);
                    console.log(data)
                    headerNames = Object.keys(data[0])
                    values = []
                    for (y = 0; y < headerNames.length; y++) {

                        var temp = []
                        for (x = 0; x < data.length; x++) {
                            temp.push(data[x][headerNames[y].toString()])
                        }
                        values.push(temp)
                    }

                    console.log(values)
                    console.log(headerNames)


                    $scope.table_chart(chart_id, headerNames, values, $scope.title_name)
                    $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'table', $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.column_selected_x, $scope.column_selected_y, $scope.column_selected_z)


                } else if ($scope.chart_type_selected == 'Pie') {
                    data = JSON.parse(response.data);
                    console.log(data)
                    y = [];
                    x = [];

                    for (i = 0; i < data.length; i++) {
                        x.push(data[i]['labels']);
                        y.push(data[i]['values'])
                    }

                    $scope.pie_chart(chart_id, $scope.title_name, x, y)
                    $scope.save_meta_data(chart_id, $scope.chart_type_selected, 'pie', $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.column_selected_x, $scope.column_selected_y, $scope.column_selected_z)
                    $scope.title_name = n
                }

            })

        }


    }
    $scope.measurement_flags = function (measure_flag_type) {
        $scope.measure_flag_type_store = measure_flag_type

        if (measure_flag_type == 'Revenue') {
            $scope.revenue_meaure_flag = 1
            $scope.monthly_revenue_meaure_flag = 0
            $scope.monthly_customer_count_flag = 0
            $scope.math_functions_flag = 0
            $scope.monthly_order_quanity_flag = 0
            $scope.resampling_functions_flag = 0
        } else if (measure_flag_type == 'Monthly_revenue') {
            $scope.revenue_meaure_flag = 0
            $scope.monthly_customer_count_flag = 0
            $scope.monthly_order_quanity_flag = 0
            $scope.math_functions_flag = 0
            $scope.monthly_revenue_meaure_flag = 1
            $scope.resampling_functions_flag = 0
        } else if (measure_flag_type == 'Monthly_customer_count') {
            $scope.revenue_meaure_flag = 0
            $scope.monthly_revenue_meaure_flag = 0
            $scope.monthly_order_quanity_flag = 0
            $scope.math_functions_flag = 0
            $scope.monthly_customer_count_flag = 1
            $scope.resampling_functions_flag = 0
        } else if (measure_flag_type == 'Monthly_order_count') {
            $scope.revenue_meaure_flag = 0
            $scope.monthly_revenue_meaure_flag = 0
            $scope.monthly_customer_count_flag = 0
            $scope.math_functions_flag = 0
            $scope.monthly_order_quanity_flag = 1
            $scope.resampling_functions_flag = 0
        } else if (measure_flag_type == 'maths_functions') {
            $scope.revenue_meaure_flag = 0
            $scope.monthly_revenue_meaure_flag = 0
            $scope.monthly_customer_count_flag = 0
            $scope.monthly_order_quanity_flag = 0
            $scope.math_functions_flag = 1
            $scope.resampling_functions_flag = 0
        } else if (measure_flag_type == 'resampling_functions') {
            $scope.revenue_meaure_flag = 0
            $scope.monthly_revenue_meaure_flag = 0
            $scope.monthly_customer_count_flag = 0
            $scope.monthly_order_quanity_flag = 0
            $scope.math_functions_flag = 0
            $scope.resampling_functions_flag = 1
        }


    }


    $scope.initialize_measure = function () {
        $scope.revenue_meaure_flag = 0
        $scope.monthly_revenue_meaure_flag = 0
        $scope.monthly_customer_count_flag = 0
        $scope.monthly_order_quanity_flag = 0
        $scope.math_functions_flag = 0
        $scope.resampling_functions_flag = 0

    }


    $scope.$watch('unit_price_column', function () {
        console.log($scope.unit_price_column)


    })


    $scope.measures = function () {

        let obj
        let data;

        if ($scope.measure_flag_type_store == 'Revenue') {
            let data

            obj = JSON.stringify({
                "measure_type": $scope.measure_flag_type_store,
                "unit_price_column": $scope.unit_price_column,
                "quantity_column": $scope.quantity_column,

            });
            console.log(obj)
            $http({

                method: 'POST',
                url: url + '/ajax_measure',
                data: obj
            }).then(function mySuccess(response) {

                data = response.data
                console.log(data)


                $scope.update_columns()


            })

        } else if ($scope.measure_flag_type_store == 'Monthly_revenue') {

            obj = JSON.stringify({
                "measure_type": $scope.measure_flag_type_store,
                "date_column": $scope.date_column,


            });
            console.log(obj)
            $http({

                method: 'POST',
                url: url + '/ajax_measure',
                data: obj
            }).then(function mySuccess(response) {

                data = response.data
                console.log(data)


                $scope.update_columns()


            })
        } else if ($scope.measure_flag_type_store == 'Monthly_customer_count') {

            obj = JSON.stringify({
                "measure_type": $scope.measure_flag_type_store,
                "date_column": $scope.date_column,
                "customer_id_column": $scope.customer_id_column,


            });
            console.log(obj)
            $http({

                method: 'POST',
                url: url + '/ajax_measure',
                data: obj
            }).then(function mySuccess(response) {

                data = response.data
                console.log(data)


                $scope.update_columns()


            })
        } else if ($scope.measure_flag_type_store == 'Monthly_order_count') {


            obj = JSON.stringify({
                "measure_type": $scope.measure_flag_type_store,
                "date_column": $scope.date_column,
                "quantity_column": $scope.quantity_column,


            });
            console.log(obj)
            $http({

                method: 'POST',
                url: url + '/ajax_measure',
                data: obj
            }).then(function mySuccess(response) {

                data = response.data
                console.log(data)


                $scope.update_columns()


            })
        } else if ($scope.measure_flag_type_store == 'maths_functions') {
            obj = JSON.stringify({
                "measure_type": $scope.measure_flag_type_store,
                "selected_maths_operation": $scope.selected_maths_operation,
                "math_operation_column": $scope.math_operation_column
            });

            $http({

                method: 'POST',
                url: url + '/ajax_measure',
                data: obj
            }).then(function mySuccess(response) {

                data = response.data
                console.log(data)


                $scope.update_columns()


            })

        } else if ($scope.measure_flag_type_store == 'resampling_functions') {
            obj = JSON.stringify({
                "measure_type": $scope.measure_flag_type_store,
                "selected_resampling_operation": $scope.selected_resampling_operation,
                "resampling_operation_column": $scope.resampling_operation_column,
                "resampling_operation_date_column": $scope.resampling_operation_date_column
            });

            $http({

                method: 'POST',
                url: url + '/ajax_measure',
                data: obj
            }).then(function mySuccess(response) {

                $scope.update_columns()
            })


        }


    }

    $scope.update_columns = function () {
        $http.get(url + '/dashboard_get_columns')
            .then(function mySuccess(response) {
                try {
                    var data = JSON.parse(response.data);
                    console.log(Object.keys(data[0]));
                    $scope.columns = Object.keys(data[0])
                    $scope.measurements_columns = $scope.difference($scope.initial_user_columns, $scope.columns)
                    console.log($scope.measurements_columns)
                    alert('New Measurement Added')

                } catch (err) {
                    console.log('pause');
                }
            });
    }


    $scope.bar_chart = function (chart_id, y, x, title, x_axis_name, y_axis_name) {
        let data;
        let data_;
        let layout;
        let selectorOptions;
        console.log(chart_id)
        document.getElementById(chart_id).innerHTML = ""


        selectorOptions = {
            buttons: [{
                step: 'days',
                stepmode: 'backward',
                count: 30,
                label: '1m'
            }, {
                step: 'month',
                stepmode: 'backward',
                count: 6,
                label: '6m'
            }, {
                step: 'year',
                stepmode: 'todate',
                count: 1,
                label: 'YTD'
            }, {
                step: 'year',
                stepmode: 'backward',
                count: 1,
                label: '1y'
            }, {
                step: 'all',
            }],
        };


        data_ = {
            x: x,
            y: y,
            type: 'bar',
            name: $scope.column_selected
        }


        data = [data_];

        layout = {
            legend: {
                x: 0,
                y: -0.2,
                "orientation": "h"
            },
            title: title,

            xaxis: {
                autorange: true,
                rangeselector: selectorOptions,
                title: x_axis_name,
                tickfont: {
                    size: 14,
                    color: 'rgb(107, 107, 107)'
                }
            },
            yaxis: {
                autorange: true,
                title: y_axis_name,
                titlefont: {
                    size: 16,
                    color: 'rgb(107, 107, 107)'
                }
            },


        }

        Plotly.newPlot(chart_id, data, layout, {responsive: true, displayModeBar: false});


    }


    $scope.line_chart = function (chart_id, y, x, title, x_axis_name, y_axis_name) {
        let data;
        let layout;
        let data_;
        document.getElementById(chart_id).innerHTML = ""


        data_ = {
            x: x,
            y: y,
            type: 'scatter',
            mode: 'lines+markers',
            name: $scope.column_selected
        }


        data = [data_];

        layout = {
            legend: {
                x: 0,
                y: -0.2,
                "orientation": "h"
            },
            title: title,

            xaxis: {
                autorange: true,
                title: x_axis_name,
                rangeslider: {},
                tickfont: {
                    size: 14,
                    color: 'rgb(107, 107, 107)'
                }
            },
            yaxis: {
                autorange: true,
                title: y_axis_name,
                titlefont: {
                    size: 16,
                    color: 'rgb(107, 107, 107)'
                }
            },


        }

        Plotly.newPlot(chart_id, data, layout, {responsive: true, displayModeBar: false});
        //$scope.publish('line', chart_id, title, x_axis_name, y_axis_name, $scope.column_selected_x, $scope.column_selected_y)


    }


    $scope.geo_map_chart = function (chart_id, y, x, z, title, x_axis_name, y_axis_name) {
        let layout;
        let data;
        document.getElementById(chart_id).innerHTML = ""
        data = [
            {
                type: "scattermapbox",
                text: z,

                lon: y,
                lat: x,
                marker: {color: "fuchsia", size: 4}
            }
        ];

        layout = {
            dragmode: "zoom",
            mapbox: {style: "open-street-map", center: {lat: 12, lon: 30}, zoom: 1.5},
            margin: {
                l: 0,
                r: 0,
                b: 0,
                t: 0,
                pad: 1
            },


        };

        Plotly.newPlot(chart_id, data, layout, {responsive: true, displayModeBar: false});


    }

    $scope.scatter_chart = function (chart_id, y, x, z, title, x_axis_name, y_axis_name) {
        let layout;
        let data;
        document.getElementById(chart_id).innerHTML = ""
        data = [{
            x: x,
            y: y,
            z: z,
            mode: 'markers',
            type: 'scatter3d',
            marker: {
                color: 'rgb(23, 190, 207)',
                size: 2
            }
        }, {
            alphahull: 7,
            opacity: 0.1,
            type: 'mesh3d',
            x: x,
            y: y,
            z: z
        }];

        layout = {
            autosize: true,

        };

        Plotly.newPlot(chart_id, data, layout, {responsive: true, displayModeBar: false});


    }


    $scope.table_chart = function (chart_id, header, values, title) {
        let data;
        let layout;
        document.getElementById(chart_id).innerHTML = ""

        data = [{
            type: 'table',
            header: {
                values: header,
                align: "center",
                line: {width: 1, color: 'black'},
                fill: {color: "grey"},
                font: {family: "Arial", size: 12, color: "white"}
            },
            cells: {
                values: values,
                align: "center",
                line: {color: "black", width: 1},
                font: {family: "Arial", size: 11, color: ["black"]}
            }
        }];

        layout = {
            title: title,

        }

        Plotly.newPlot(chart_id, data, layout, {responsive: true, displayModeBar: false});

    }


    $scope.pie_chart = function (chart_id, title, labels, values) {
        let layout;
        let data;
        document.getElementById(chart_id).innerHTML = ""
        data = [{
            values: values,
            labels: labels,
            type: 'pie'
        }];

        layout = {
            title: title,

        };

        Plotly.newPlot(chart_id, data, layout, {responsive: true, displayModeBar: false});
    }

    $scope.text_box_chart = function (chart_id) {
        let gridstack_card_element;
        let chart_id_editor;
        document.getElementById(chart_id).innerHTML = ""

        chart_id_editor = ""
        console.log(chart_id)
        chart_id_editor = chart_id_editor.concat('#', chart_id);
        console.log(chart_id_editor)
        $scope.text_box_chart_id = chart_id

        gridstack_card_element = angular.element(document.querySelector(chart_id_editor));
        gridstack_card_element.append("<div id='text_box_id' class='card bg-white'>" + "</div>")

        $scope.text_box_chart_type_selected = $scope.chart_type_selected
        $scope.quill = new Quill('#text_box_id', {
            modules: {
                // ImageResize: {},
                toolbar: [
                    [{'header': [1, 2, 3, 4, 5, 6, false]}],
                    // [{ 'header': 1 }, { 'header': 2 }],
                    [{'size': ['small', false, 'large', 'huge']}],  // custom dropdown
                    ['bold', 'italic', 'underline', 'strike', 'link'],
                    [{'color': []}, {'background': []}],          // dropdown with defaults from theme
                    [{'font': []}],
                    [{'align': []}],
                    ['clean'],                                         // remove formatting button
                    ['blockquote', 'code-block'],
                    ['video', 'image'],
                    [{'list': 'ordered'}, {'list': 'bullet'}],
                    [{'script': 'sub'}, {'script': 'super'}],      // superscript/subscript
                    [{'indent': '-1'}, {'indent': '+1'}],          // outdent/indent
                ]
            },
            placeholder: 'Compose an epic...',
            theme: 'snow'  // or 'bubble'
        });

    }

    $scope.multiple_bar_chart = function (chart_id, y, x, z, title, x_axis_name, y_axis_name, z_axis_name) {
        var data;
        var layout;
        let selectorOptions;
        let data_1;
        let data_2;
        console.log(chart_id)
        document.getElementById(chart_id).innerHTML = ""


        selectorOptions = {
            buttons: [{
                step: 'days',
                stepmode: 'backward',
                count: 30,
                label: '1m'
            }, {
                step: 'month',
                stepmode: 'backward',
                count: 6,
                label: '6m'
            }, {
                step: 'year',
                stepmode: 'todate',
                count: 1,
                label: 'YTD'
            }, {
                step: 'year',
                stepmode: 'backward',
                count: 1,
                label: '1y'
            }, {
                step: 'all',
            }],
        };


        data_1 = {
            x: x,
            y: y,
            type: 'bar',
            name: y_axis_name
        }

        data_2 = {
            x: x,
            y: z,
            type: 'bar',
            name: z_axis_name
        }


        data = [data_1, data_2];

        layout = {
            legend: {
                x: 0,
                y: -0.2,
                "orientation": "h"
            },
            title: title,

            xaxis: {
                autorange: true,
                rangeselector: selectorOptions,
                title: x_axis_name,
                tickfont: {
                    size: 14,
                    color: 'rgb(107, 107, 107)'
                }
            },
            yaxis: {
                autorange: true,

                titlefont: {
                    size: 16,
                    color: 'rgb(107, 107, 107)'
                }
            },


        }

        Plotly.newPlot(chart_id, data, layout, {responsive: true, displayModeBar: false});

    }

    $scope.multiple_line_chart = function (chart_id, y, x, z, title, x_axis_name, y_axis_name, z_axis_name) {
        let data;
        let layout;
        let data_1;
        let data_2;
        document.getElementById(chart_id).innerHTML = ""


        data_1 = {
            x: x,
            y: y,
            type: 'scatter',
            mode: 'lines+markers',
            name: y_axis_name
        }

        data_2 = {
            x: x,
            y: z,
            type: 'scatter',
            mode: 'lines+markers',
            name: z_axis_name
        }


        data = [data_1, data_2];

        layout = {
            legend: {
                x: 0,
                y: -0.2,
                "orientation": "h"
            },
            title: title,

            xaxis: {
                autorange: true,
                title: x_axis_name,
                rangeslider: {},
                tickfont: {
                    size: 14,
                    color: 'rgb(107, 107, 107)'
                }
            },
            yaxis: {
                autorange: true,

                titlefont: {
                    size: 16,
                    color: 'rgb(107, 107, 107)'
                }
            },


        }

        Plotly.newPlot(chart_id, data, layout, {responsive: true, displayModeBar: false});
    }


    $scope.pill_addition_chart = function (chart_id, pill_data) {
        let pill_data_values;
        let description;
        let chart_id_editor;
        let i;
        let pill_elements;
        document.getElementById(chart_id).innerHTML = ""


        chart_id_editor = ""
        console.log(chart_id)
        chart_id_editor = chart_id_editor.concat('#', chart_id);
        pill_elements = angular.element(document.querySelector(chart_id_editor));
        for (i = 0; i < $scope.pills_discription_list.length; i++) {
            description = $scope.pills_discription_list[i]
            pill_data_values = pill_data[i];

            pill_elements.append("<div class='col' style='padding: 5px'> <div class='card bg-info'> <div class='card-content'> <div class='card-body' style='padding: 10px'> <div class='media d-flex'> <div class='align-self-center'> <i class='icon-pencil text-white font-large-2 float-left'></i> </div> <div class='media-body text-white text-right'> <h3 class='text-white'>" + pill_data_values.toString() + "</h3> <span>" + description.toString() + "</span> </div> </div> </div> </div> </div> </div>")

        }


    }

    $scope.multiple_charts = function (chart_id, data, title, x_axis_name, y_axis_name, z_axis_name) {
        let i;
        let trace_list;
        let y_column_data;
        let x_column_data;
        let trace;
        let layout;
        document.getElementById(chart_id).innerHTML = ""


        console.log(data[0].x_data)

        trace_list = []
        for (i = 0; i < data.length; i++) {

            console.log('chart')
            console.log(i)


            x_column_data = data[i].x_data
            console.log(x_column_data)
            y_column_data = data[i].y_data
            console.log(y_column_data)


            if (i == 0) {
                trace = {
                    x: x_column_data,
                    y: y_column_data,
                    mode: 'lines',
                    name: 'Singapore 180cst Close',
                    line: {
                        color: 'rgb(48,94,191)',
                        width: 2
                    },

                }
            } else if (i == 2) {
                trace = {
                    x: x_column_data,
                    y: y_column_data,
                    mode: 'lines',
                    name: 'Trigger One',
                    line: {
                        color: 'rgb(191,36,62)',
                        width: 2
                    },

                }
            } else if (i == 3) {
                trace = {
                    x: x_column_data,
                    y: y_column_data,
                    mode: 'lines',
                    name: 'Trigger Two',
                    line: {
                        color: 'rgb(17,191,15)',
                        width: 2
                    },

                }
            } else {
                trace = {
                    x: x_column_data,
                    y: y_column_data,
                    mode: 'lines',
                    name: 'Forecast Stock',
                    line: {
                        color: 'rgb(191,97,20)',
                        width: 2
                    },

                }
            }


            trace_list.push(trace)


        }


        layout = {
            legend: {
                x: 0,
                y: -0.2,
                "orientation": "h"
            },
            title: title,

            xaxis: {
                autorange: true,
                title: x_axis_name,
                rangeslider: {},
                tickfont: {
                    size: 14,
                    color: 'rgb(107, 107, 107)'
                }
            },
            yaxis: {
                autorange: true,
                title: y_axis_name,
                titlefont: {
                    size: 16,
                    color: 'rgb(107, 107, 107)'
                }
            },


        }


        Plotly.newPlot(chart_id, trace_list, layout, {responsive: true, displayModeBar: false});

    }


    $scope.iframe = function (chart_id) {
        let chart_id_editor;
        document.getElementById(chart_id).innerHTML = ""
        console.log($scope.link_address.toString())
        chart_id_editor = ""
        console.log(chart_id)
        chart_id_editor = chart_id_editor.concat('#', chart_id);
        $scope.url = $sce.trustAsResourceUrl($scope.link_address.toString());


        if ($scope.dummy_link_select == "Bunker Stats Api") {
            $(chart_id_editor).append('<iframe id="iframe"  src=' + $scope.url.toString() + ' style="position:absolute;width:100%;border:none;height:110%;top:-100px;bottom:-100px"></iframe>')

        } else {
            $(chart_id_editor).append('<iframe id="iframe" src=' + $scope.url.toString() + ' style="width:100%;border:none;height:100%"></iframe>')
        }


        return $scope.url.toString()

    }

    $scope.difference = function (a1, a2) {

        var a = [], diff = [];

        for (var i = 0; i < a1.length; i++) {
            a[a1[i]] = true;
        }

        for (var i = 0; i < a2.length; i++) {
            if (a[a2[i]]) {
                delete a[a2[i]];
            } else {
                a[a2[i]] = true;
            }
        }

        for (var k in a) {
            diff.push(k);
        }

        return diff;
    }


    $scope.save_meta_data = function (chart_id, chart_type, plot_type, title, x_axis_name, y_axis_name, z_axis_name, x_column, y_column, z_column) {

        var obj = JSON.stringify({
            "chart_id": chart_id,
            "chart_type": chart_type,
            "plot_type": plot_type,
            "title": title,
            "x_axis_name": x_axis_name,
            "y_axis_name": y_axis_name,
            "z_axis_name": z_axis_name,
            "x_column": x_column,
            "y_column": y_column,
            "z_column": z_column,


        });


        $scope.title_name = null
        $scope.x_axis = null
        $scope.y_axis = null
        $scope.z_axis = null

        $scope.column_selected_x = null
        $scope.column_selected_y = null
        $scope.column_selected_z = null


        $http({

            method: 'POST',
            url: url + '/save_meta_data',
            data: obj
        }).then(function mySuccess(response) {
            console.log('meta_saved')

        })
    }


    $scope.send_layout_data = function () {


        let obj;
        let grid_height;
        let window_height;
        let height;
        let width;
        let y;
        let x;
        const data_list = [];
        let i = 1;
        for (i; i < 7; i++) {
            var id__ = "chart";
            id__ = id__.concat(i.toString(), "_");

            x = document.getElementById(id__).getAttribute("data-gs-x");
            y = document.getElementById(id__).getAttribute("data-gs-y");
            width = document.getElementById(id__).getAttribute("data-gs-width");
            height = document.getElementById(id__).getAttribute("data-gs-height");
            window_height = document.getElementById("advanced-grid").style.height;
            grid_height = document.getElementById("advanced-grid").getAttribute("data-gs-current-height");


            obj = JSON.stringify({
                "chart_id": i,
                "x": x,
                "y": y,
                "width": width,
                "height": height,
                "window_height": window_height,
                "grid_height": grid_height

            });

            data_list.push(obj)


        }
        obj = JSON.stringify({
            "data_list": data_list,
        });

        $http({

            method: 'POST',
            url: url + '/template_layout_store',
            data: obj
        }).then(function mySuccess(response) {
            var obj;
            console.log(id__)
            console.log('chart layout added')
            obj = JSON.stringify({
                "app_name": $scope.app_name,
                "app_description": $scope.app_description,
            });
            console.log(obj)
            $http({

                method: 'POST',
                url: url + '/publish',
                data: obj
            }).then(function mySuccess(response) {
                $window.location.href = 'view_created_applications';
            })
        })


    }


    $scope.publish_sequential = function () {
        try {
            $scope.save_meta_data($scope.text_box_chart_id, $scope.text_box_chart_type_selected, 'text_box', $scope.title_name, $scope.x_axis, $scope.y_axis, $scope.z_axis, $scope.quill.getContents(), $scope.column_selected_y, $scope.column_selected_z)
            $timeout($scope.send_layout_data, 5000);


        } catch (e) {
            $scope.send_layout_data()
            console.log('no text bexes')
        }
    }

    $scope.publish_dashboard = function () {

        $scope.publish_sequential()


    }


}
])
