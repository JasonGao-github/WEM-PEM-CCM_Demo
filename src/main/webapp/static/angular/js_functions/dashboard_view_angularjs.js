var workbench = angular.module("view", ['ngRoute']);

workbench.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
}]);


workbench.controller('view_controller', ['$scope', '$http', '$interval', '$route', '$window', '$sce', function ($scope, $http, $interval, $route, $window, $sce) {
    var url = 'https://' + String(location.host)


    $scope.widget_slider = 500
    $scope.filter_resolution = $scope.widget_slider
    $scope.start_dp = 500
    $scope.end_dp = 0

    var all_data = null
    $scope.plotting_completed = true
    $scope.table_ = []

    $scope.app_selected = null
    $scope.app_list = []

    $scope.column_selected = null
    $scope.item_selected = null

    $scope.applied_filters = []
    $scope.widget_slider = null
    $scope.remove_filter_flag = '0'
    $scope.filter_select = null

    $scope.applications_avilable_flag = 0

    $scope.template_structure_rendering = function () {
        // document.getElementById('advanced-grid').style.height="3500px"
        // document.getElementById('advanced-grid').setAttribute("data-gs-current-height",50);
        $http.get(url + '/get_template_structure')
            .then(function mySuccess(response) {
                $scope.template_structure_data = JSON.parse(response.data);
                console.log($scope.template_structure_data)
                var count_ = 1;
                angular.forEach($scope.template_structure_data, function (value, index) {
                    var id__ = "chart";
                    id__ = id__.concat(value.chart_id.toString(), "_");
                    console.log(id__);

                    if (count_ == 1) {
                        document.getElementById('advanced-grid').style.height = value.window_height.toString()
                        document.getElementById('advanced-grid').setAttribute("data-gs-current-height", value.grid_height);

                    }


                    document.getElementById(id__).setAttribute("data-gs-height", value.height);
                    document.getElementById(id__).setAttribute("data-gs-width", value.width);
                    document.getElementById(id__).setAttribute("data-gs-x", value.x);
                    document.getElementById(id__).setAttribute("data-gs-y", value.y);
                    // console.log(value.chart_id);
                    console.log(value.height);
                    console.log(value.width);
                    console.log(value.x);
                    console.log(value.y);
                    count_ = count_ + 1
                    // chart_count = chart_count + 1;
                })
            })
    }


    $scope.remove_filter = function (filter_type, filter_index) {
        alert('Do you want to remove this filter?')
        $scope.remove_filter_flag = '1'
        var obj = JSON.stringify({
            "filter_type": filter_type.toString(),
            "remove_filter": $scope.remove_filter_flag,
            "percentage": $scope.widget_slider,
            "selected_column": $scope.column_selected,
            "selected_category": $scope.item_selected,
        });
        $http({

            method: 'POST',
            url: url + '/filter_add',
            data: obj
        }).then(function mySuccess(response) {
            $scope.applied_filters.splice(filter_index, 1);
            console.log($scope.applied_filters)
            $scope.plotting_function()
            $scope.remove_filter_flag = '0'

        })
    }

    $scope.get_raw_data = function () {
        $http.get(url + '/get_raw_data')
            .then(function mySuccess(response) {


                $scope.column_names = JSON.parse(response.data);

            });

    }

    $scope.$watch('column_selected', function () {
        let obj;
        console.log($scope.column_selected)

        if ($scope.column_selected != null) {
            obj = JSON.stringify({
                'column_selected': $scope.column_selected
            });
            $http({
                method: 'POST',
                url: url + '/get_raw_data',
                data: obj
            }).then(function mySuccess(response) {
                $scope.item_names = JSON.parse(response.data);
                console.log($scope.item_names)

            })
        }


    });

    $scope.filter_function = function (filter_type) {

        let obj;
        if (filter_type == 'Resolution Filter') {
            alert('Do you want to change the resolution ?')
            $scope.filter_resolution = $scope.widget_slider
            // obj = JSON.stringify({
            //     "filter_type": filter_type.toString(),
            //     "remove_filter": $scope.remove_filter_flag,
            //     "percentage": $scope.widget_slider,
            //     "selected_column": $scope.column_selected,
            //     "selected_category": $scope.item_selected,
            // });
            // $http({
            //
            //     method: 'POST',
            //     url: url + '/filter_add',
            //     data: obj
            // }).then(function mySuccess(response) {
            //     $scope.plotting_function()
            //     $scope.applied_filters.push('Resolution Filter')
            //     console.log($scope.applied_filters)
            //
            //
            // })
        } else if (filter_type == 'Categorical Filter') {
            obj = JSON.stringify({
                "filter_type": filter_type.toString(),
                "remove_filter": $scope.remove_filter_flag,
                "percentage": $scope.widget_slider,
                "selected_column": $scope.column_selected,
                "selected_category": $scope.item_selected,
            });
            $http({

                method: 'POST',
                url: url + '/filter_add',
                data: obj
            }).then(function mySuccess(response) {
                $scope.plotting_function()
                $scope.applied_filters.push('Categorical Filter')
                console.log($scope.applied_filters)


            })
        }

    }


    $scope.set_as_home = function (index) {
        $scope.app_selected = index
        alert('Are you sure you want to set this app as your home view?')
    }

    $scope.view_created_apps = function () {
        $http.get(url + '/created_apps')
            .then(function mySuccess(response) {
                let created_apps_data;
                $scope.created_apps = []
                created_apps_data = JSON.parse(response.data);
                console.log(created_apps_data)
                $scope.created_apps = created_apps_data
            });
    }


    $scope.edit_app = function (index) {
        alert('Are you sure you want to edit this app?')
        var obj = JSON.stringify({
            "index": index.toString()
        });
        $http({

            method: 'POST',
            url: url + '/edit_app',
            data: obj
        }).then(function mySuccess(response) {


            $window.location.href = '/dashboard_workbench';


        })

    }

    $scope.select_app = function (index) {
        console.log(index)
        if (index == $scope.app_selected) {
            var obj = JSON.stringify({
                "index": index.toString(),
                "app_selected": 1,
            });
        } else {
            var obj = JSON.stringify({
                "index": index.toString(),
                "app_selected": 0,
            });
            $scope.app_selected = null
        }

        $http({

            method: 'POST',
            url: url + '/created_apps',
            data: obj
        }).then(function mySuccess(response) {


            $window.location.href = '/home_view';


        })


    }

    $scope.delete_app = function (index) {
        alert('Are you sure you want to delete the selected app ?')
        var obj = JSON.stringify({
            "index": index.toString(),
            "app_selected": 0,
        });
        $http({

            method: 'POST',
            url: url + '/delete_app',
            data: obj
        }).then(function mySuccess(response) {
            $scope.view_created_apps()
            alert('app deleted')
            console.log('app deleted')
        })
    }


    $scope.previous_function = function () {
        $scope.start_dp = $scope.start_dp + $scope.filter_resolution
        $scope.plotting_initialise()
    }

    $scope.next_function = function () {
        if ($scope.start_dp >= $scope.filter_resolution) {
            $scope.start_dp = $scope.start_dp - $scope.filter_resolution
            $scope.plotting_initialise()
        }

    }

    $scope.plotting_initialise = function () {
        $scope.applications_avilable_flag = 1
        var obj = JSON.stringify({
            "data_points": $scope.start_dp,

        });
        $http({

            method: 'POST',
            url: url + '/view_published',
            data: obj
        }).then(function mySuccess(response) {

            console.log(response.data)
            var all_data = JSON.parse(response.data);
            // console.log(all_data)

            var meta = JSON.parse(all_data.meta);
            console.log(meta)

            var raw_data = all_data.column_data;
            console.log(raw_data)


            var chart_type
            var plot_type
            var chart_id
            var title
            var x_axis_name
            var y_axis_name
            var z_axis_name
            var x_column
            var y_column
            var z_column

            var x
            var y
            var z
            for (i = 0; i < meta.length; i++) {

                chart_type = meta[i].chart_type
                plot_type = meta[i].plot_type
                chart_id = meta[i].chart_id
                title = meta[i].title
                x_axis_name = meta[i].x_axis_name
                y_axis_name = meta[i].y_axis_name
                z_axis_name = meta[i].z_axis_name
                x_column = meta[i].x_column
                y_column = meta[i].y_column
                z_column = meta[i].z_column


                x = raw_data[i].x_column
                y = raw_data[i].y_column
                z = raw_data[i].z_column

                // console.log(x)
                // console.log(y)
                // console.log(z)
                console.log(chart_type)

                if (plot_type.toString() == 'bar') {
                    console.log('yoyoyodsfsd')
                    $scope.bar_chart(chart_id, y, x, title, x_axis_name, y_axis_name)
                } else if (plot_type.toString() == 'line') {
                    $scope.line_chart(chart_id, y, x, title, x_axis_name, y_axis_name)

                } else if (plot_type.toString() == 'geomap') {
                    $scope.geo_map_chart(chart_id, y, x, z, title, x_axis_name, y_axis_name);

                } else if (plot_type.toString() == 'scatter') {
                    $scope.scatter_chart(chart_id, y, x, z, title, x_axis_name, y_axis_name);

                } else if (plot_type.toString() == 'table') {

                    // var table_json = JSON.parse(x)
                    // $scope.total_data_length = table_json.length
                    // $scope.table_.push({rows: table_json, cols: Object.keys(table_json[0])});

                    var data = JSON.parse(x)
                    var headerNames = Object.keys(data[0])
                    var values = []
                    for (y = 0; y < headerNames.length; y++) {

                        var temp = []
                        for (x = 0; x < data.length; x++) {
                            temp.push(data[x][headerNames[y].toString()])
                        }
                        values.push(temp)
                    }

                    // console.log(values)
                    // console.log(headerNames)


                    $scope.table_chart(chart_id, headerNames, values, $scope.title_name)


                } else if (plot_type.toString() == 'pie') {
                    console.log('dsfdsfs')
                    $scope.pie_chart(chart_id, title, x, y)
                } else if (plot_type.toString() == 'text_box') {
                    console.log(x)
                    var data_ = JSON.parse(x)

                    var raw_textbox_data = data_.replace(/'/g, '"');
                    var text_data = JSON.parse(raw_textbox_data)


                    $scope.text_box_chart(chart_id, text_data.ops)

                } else if (plot_type.toString() == 'multiple_bar') {
                    $scope.multiple_bar_chart(chart_id, y, x, z, title, x_axis_name, y_axis_name, z_axis_name)

                } else if (plot_type.toString() == 'multiple_line') {
                    $scope.multiple_line_chart(chart_id, y, x, z, title, x_axis_name, y_axis_name, z_axis_name)

                } else if (plot_type.toString() == 'pills') {
                    // var pill_discription=JSON.parse(x)
                    // var pill_data=JSON.parse(y)
                    console.log('pill_configration')
                    // console.log(pill_discription)
                    // console.log(pill_data)
                    $scope.pill_addition_chart(chart_id, x.description, y.data)

                } else if (plot_type.toString() == 'multiplot') {
                    console.log('multiplot')
                    console.log(x)
                    var multiplot_data = JSON.parse(x)
                    console.log(multiplot_data)
                    $scope.multiple_charts(chart_id, multiplot_data, title, x_axis_name, y_axis_name, z_axis_name)
                    console.log('multiplot_plotting completed')
                } else if (plot_type.toString() == 'link') {
                    console.log('iframe link')
                    console.log(x)

                    $scope.iframe(chart_id, x)
                }


            }
            $scope.plotting_completed = false


        }, function (response) {
            $scope.applications_avilable_flag = 0
            $('.chatWindow').toggleClass('active')
            $('.LuChatBtn').toggleClass('active')
            // $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">Hello! I\'m Einstein and I\'m here to help you make the most of my platform!</p></div>')
            $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text"> Thank you for trying our product! This Alpha Release is just a teaser as to what is to come in future releases.</p></div>')
            $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text"> Please<a href="https://datampowered.com.au/LaunchingSoon#email" target="_blank" style="color:rgb(219,219,218)"> Subscribe </a> to our mailing list for future updates</p></div>')

            // var delayInMilliseconds = 10000; //1 second
            //
            // setTimeout(function () {
            //     $('.LuChatBtn').removeClass('active')
            //
            //     $('.chatWindow').removeClass('active')
            // }, delayInMilliseconds);


            console.log('no data')
        })
    }
    $scope.template_structure_rendering()
    $scope.plotting_initialise()


    $scope.plotting_function = function () {
        var obj = JSON.stringify({
            "file_name": '',
            "publish_meta_file_name": '',


        });

        $http({

            method: 'POST',
            url: url + '/view_sampling',
            data: obj

        }).then(function mySuccess(response) {

            $scope.applications_avilable_flag = 1
            var all_data = JSON.parse(response.data);
            console.log(all_data)

            var meta = JSON.parse(all_data.meta);
            console.log(meta)

            var raw_data = all_data.column_data;
            console.log(raw_data)


            var chart_type
            var chart_id
            var plot_type
            var title
            var x_axis_name
            var y_axis_name
            var x_column
            var y_column
            var z_column

            var x
            var y
            var z
            for (i = 0; i < meta.length; i++) {
                chart_type = meta[i].chart_type
                plot_type = meta[i].plot_type
                chart_id = meta[i].chart_id
                title = meta[i].title
                x_axis_name = meta[i].x_axis_name
                y_axis_name = meta[i].y_axis_name
                x_column = meta[i].x_column
                y_column = meta[i].y_column
                z_column = meta[i].z_column


                x = raw_data[i].x_column
                y = raw_data[i].y_column
                z = raw_data[i].z_column


                if (plot_type.toString() == 'bar') {
                    $scope.bar_chart(chart_id, y, x, title, x_axis_name, y_axis_name)
                } else if (plot_type.toString() == 'line') {
                    $scope.line_chart(chart_id, y, x, title, x_axis_name, y_axis_name)

                } else if (plot_type.toString() == 'geomap') {
                    $scope.geo_map_chart(chart_id, y, x, z, title, x_axis_name, y_axis_name);

                } else if (plot_type.toString() == 'scatter') {
                    $scope.scatter_chart(chart_id, y, x, z, title, x_axis_name, y_axis_name);

                } else if (plot_type.toString() == 'table') {
                    // $scope.table_ = []
                    // var table_json = JSON.parse(x)
                    // $scope.table_.push({rows: table_json, cols: Object.keys(table_json[0])});

                    var data = JSON.parse(x)
                    var headerNames = Object.keys(data[0])
                    var values = []
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


                } else if (plot_type.toString() == 'pie') {
                    $scope.pie_chart(chart_id, title, x, y)
                } else if (plot_type.toString() == 'text_box') {

                    var raw_textbox_data = x.replace(/'/g, '"');
                    var text_data = JSON.parse(raw_textbox_data)

                    $scope.text_box_chart(chart_id, text_data.ops)
                }

            }


            $scope.plotting_completed = false


        })
    }


    $scope.bar_chart = function (chart_id, y, x, title, x_axis_name, y_axis_name) {
        console.log(chart_id)

        if (title == 'None') {
            title = ''
        }


        let layout;
        let data;


        var selectorOptions = {
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
                automargin: true,
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
        console.log(chart_id)
        if (title == 'None') {
            title = ''
        }
        let data_;
        let layout;
        let data;


        data_ = {
            //  x: Array.from(x, x = Number(x)),
            // y: Array.from(y, y = Number(y)),
            x: x,
            y: y,
            mode: 'lines',
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
                automargin: true,
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
        console.log(chart_id)
        if (title == 'None') {
            title = ''
        }
        var data = [
            {
                type: "scattermapbox",
                text: z,

                lon: y,
                lat: x,
                marker: {color: "fuchsia", size: 4}
            }
        ];

        var layout = {
            dragmode: "zoom",
            mapbox: {style: "open-street-map", center: {lat: 12, lon: 30}, zoom: 1.5},
            margin: {
                l: 0,
                r: 0,
                b: 0,
                t: 0,
                pad: 10
            }


        };

        Plotly.newPlot(chart_id, data, layout, {responsive: true, displayModeBar: false});


    }

    $scope.scatter_chart = function (chart_id, y, x, z, title, x_axis_name, y_axis_name) {
        if (title == 'None') {
            title = ''
        }
        var data = [{
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

        var layout = {
            autosize: true,

        };

        Plotly.newPlot(chart_id, data, layout, {responsive: true, displayModeBar: false});


    }

    $scope.table_chart = function (chart_id, header, values, title) {
        if (title == 'None') {
            title = ''
        }
        console.log(chart_id)
        var data = [{
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
        }]

        var layout = {
            title: title,

        }

        Plotly.newPlot(chart_id, data, layout, {responsive: true, displayModeBar: false});

    }

    $scope.pie_chart = function (chart_id, title, labels, values) {
        if (title == 'None') {
            title = ''
        }
        var data = [{
            values: values,
            labels: labels,
            type: 'pie'
        }];

        var layout = {
            title: title,

        };

        Plotly.newPlot(chart_id, data, layout, {responsive: true, displayModeBar: false});
    }


    $scope.text_box_chart = function (chart_id, x) {
        var quill;
        let chart_id_editor = ""
        console.log(chart_id)
        chart_id_editor = chart_id_editor.concat('#', chart_id);
        console.log(chart_id_editor)

        var gridstack_card_element = angular.element(document.querySelector(chart_id_editor));
        gridstack_card_element.append("<div id='text_box_id' class='card bg-white'>" + "</div>")

        quill = new Quill('#text_box_id', {
            theme: 'snow', // or 'bubble'
            modules: {
                "toolbar": false
            }
        });


        quill.setContents(x);

    }

    $scope.multiple_bar_chart = function (chart_id, y, x, z, title, x_axis_name, y_axis_name, z_axis_name) {
        console.log(chart_id)
        if (title == 'None') {
            title = ''
        }


        let layout;
        let data;


        var selectorOptions = {
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


        var data_1 = {
            x: x,
            y: y,
            type: 'bar',
            name: y_axis_name
        }

        var data_2 = {
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
        if (title == 'None') {
            title = ''
        }
        let data_;
        let layout;
        let data;


        var data_1 = {
            x: x,
            y: y,
            type: 'scatter',
            mode: 'lines+markers',
            name: y_axis_name
        }

        var data_2 = {
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

    $scope.pill_addition_chart = function (chart_id, pill_description, pill_data) {
        document.getElementById(chart_id).innerHTML = ""
        console.log('yoyo')
        let chart_id_editor = ""
        console.log(chart_id)
        chart_id_editor = chart_id_editor.concat('#', chart_id);
        var pill_elements = angular.element(document.querySelector(chart_id_editor));
        var i
        for (i = 0; i < pill_description.length; i++) {
            var discription = pill_description[i]
            var pill_data_values = pill_data[i]

            pill_elements.append("<div class='col' style='padding: 5px'> <div class='card bg-info'> <div class='card-content'> <div class='card-body' style='padding: 10px'> <div class='media d-flex'> <div class='align-self-center'> <i class='icon-pencil text-white font-large-2 float-left'></i> </div> <div class='media-body text-white text-right'> <h3 class='text-white'>" + pill_data_values.toString() + "</h3> <span>" + discription.toString() + "</span> </div> </div> </div> </div> </div> </div>")

        }


    }

    $scope.multiple_charts = function (chart_id, data, title, x_axis_name, y_axis_name, z_axis_name) {


        // console.log(data[0].x_data)

        var trace_list = []
        var i
        for (i = 0; i < data.length; i++) {

            console.log('chart')
            console.log(i)


            var x_column_data = data[i].x_data
            console.log(x_column_data)
            var y_column_data = data[i].y_data
            console.log(y_column_data)


            if (i == 0) {
                var trace = {
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
                var trace = {
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
                var trace = {
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
                var trace = {
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

        var layout = {
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

    $scope.iframe = function (chart_id, link_address) {
        document.getElementById(chart_id).innerHTML = ""
        console.log(link_address.toString())
        let chart_id_editor = ""
        console.log(chart_id)
        chart_id_editor = chart_id_editor.concat('#', chart_id);
        $scope.url = $sce.trustAsResourceUrl(link_address.toString());
        // $(chart_id_editor).append('<iframe src = ' +$scope.url.toString()+ '>\n' +
        //     '  <p>Your browser does not support iframes.</p>\n' +
        //     '</iframe>')

        if ($scope.url.toString() == "https://shipandbunker.com/prices#IFO180") {
            $(chart_id_editor).append('<iframe id="iframe"  src=' + $scope.url.toString() + ' style="position:absolute;width:100%;border:none;height:110%;top:-100px;bottom:-100px;"></iframe>')

        } else {
            $(chart_id_editor).append('<iframe id="iframe" src=' + $scope.url.toString() + ' style="width:100%;border:none;height:100%"></iframe>')

        }


        return $scope.url.toString()

    }


}
])