var app = angular.module("create_dataset_app", []);

app.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
}]);

app.controller('create_dataset_controller', ['$scope', '$http', '$interval', '$window', function ($scope, $http, $interval, $window) {

    var url = 'http://' + String(location.host)

    var filter_initialize_count = 0
    var inspect_count = 0
    $scope.select_all_2 = null

    $scope.excel_workbook_detection_flag = 0
    $scope.default_detection_flag = 1
    $scope.workbook_sheet_selected = null
    $scope.initial_row_index = null
    $scope.workbook_data_flag = 0


    $scope.filter_initilize_table = null
    $scope.all_catergorical_flag = 0

    $scope.select_parameter_flag = 1
    $scope.data_clensing_flag = 0
    $scope.data_inspect_flag = 0


    $scope.forecast_steps = 0
    $scope.timeseries_date = null
    $scope.timeseries_target = null
    $scope.date_frequency_selected = null
    $scope.date_frequencies = ['Daily', 'Weekly', 'Monthly', 'Yearly']


    $scope.get_column_names_initial = function () {
        $http.get(url + '/get_columns')
            .then(function mySuccess(response) {
                console.log('getting_columns')
                try {
                    var data = JSON.parse(response.data);
                    console.log(data);
                    console.log(Object.keys(data[0]));
                    $scope.column_list_ = Object.keys(data[0])
                    $scope.select_parameter_flag = 0
                    angular.element(document.getElementById("heading53").click())


                } catch (err) {
                    var data = JSON.parse(response.data);
                    console.log(data);
                    $scope.excel_workbook_detection_flag = 1
                    $scope.default_detection_flag = 0
                    $scope.select_parameter_flag = 0
                    $scope.excel_sheet_names = data.data
                    angular.element(document.getElementById("heading53").click())
                    console.log($scope.excel_sheet_names)

                }
            });
    }


    $scope.get_column_names_workbook = function () {
        $http.get(url + '/get_columns')
            .then(function mySuccess(response) {
                console.log('getting_columns')
                try {
                    var data = JSON.parse(response.data);
                    console.log(data);
                    console.log(Object.keys(data[0]));
                    $scope.column_list = Object.keys(data[0])
                    $scope.select_parameter_flag = 0

                } catch (err) {
                }
            });
    }


    $scope.getCookie = function (name) {
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }


    $scope.workbook_done = function () {


        $scope.temp_column_list = $scope.column_list
        $scope.column_list = null
        $scope.column_renames = []
        $scope.selected_columns = []
        var j


        for (j = 0; j < $scope.temp_column_list.length; j++) {
            var checkbox_id_name = 'selected_columns_'.concat($scope.temp_column_list[j].toString())
            var column_selected = document.getElementById(checkbox_id_name).checked
            if (column_selected == true) {
                var column_names = 'column_names_'.concat($scope.temp_column_list[j].toString())
                $scope.selected_columns.push(document.getElementById(column_names).value);

            } else {
                $scope.selected_columns.push(0)
                $scope.temp_column_list[j] = 0

            }


        }

        console.log($scope.selected_columns)

        var x = document.getElementById("select_parameters");
        x.style.display = "block";
        document.getElementById("heading53").classList.add("collapsed")
        document.getElementById("accordion53").classList.remove("show")

        var i = 0
        var str_ = ""
        for (i; i < $scope.temp_column_list.length; i++) {

            if (i == $scope.temp_column_list.length - 1) {
                str_ = str_.concat($scope.selected_columns[i].toString() + ':' + $scope.temp_column_list[i].toString())

            } else {
                str_ = str_.concat($scope.selected_columns[i].toString() + ':' + $scope.temp_column_list[i].toString(), ',')

            }


        }
        console.log(str_)

        $.ajax({
            type: 'POST',
            url: 'create_dataset',
            data: {
                user_file_column_structure: str_,
                csrfmiddlewaretoken: $scope.getCookie('csrftoken'),

            },

            success: function (data) {
                x.style.display = "none";
                document.getElementById("heading56").click()
                document.getElementById("heading56").classList.remove("collapsed")
                document.getElementById("accordion56").classList.add("show")


            }
        })

    }


    $scope.select_all_1_func = function () {


        $scope.temp_column_list = $scope.column_list
        $scope.column_list = null
        $scope.column_renames = []
        var j
        for (j = 0; j < $scope.temp_column_list.length; j++) {

            var column_names = 'column_names_'.concat($scope.temp_column_list[j].toString())
            $scope.column_renames.push(document.getElementById(column_names).value);
        }

        console.log($scope.column_renames)

        var x = document.getElementById("select_parameters");
        x.style.display = "block";
        document.getElementById("heading53").classList.add("collapsed")
        document.getElementById("accordion53").classList.remove("show")

        var i = 0
        var str_ = ""
        for (i; i < $scope.temp_column_list.length; i++) {

            if (i == $scope.temp_column_list.length - 1) {
                str_ = str_.concat($scope.column_renames[i].toString() + ':' + $scope.temp_column_list[i].toString())

            } else {
                str_ = str_.concat($scope.column_renames[i].toString() + ':' + $scope.temp_column_list[i].toString(), ',')

            }


        }
        console.log(str_)

        $.ajax({
            type: 'POST',
            url: 'create_dataset',
            data: {
                user_file_column_structure: str_,
                csrfmiddlewaretoken: $scope.getCookie('csrftoken'),

            },

            success: function (data) {
                x.style.display = "none";
                document.getElementById("heading56").click()
                document.getElementById("heading56").classList.remove("collapsed")
                document.getElementById("accordion56").classList.add("show")


            }
        })

    }


    $scope.select_all_2_func = function () {

        $scope.temp_column_list = $scope.column_list_
        $scope.column_list_ = null

        var x = document.getElementById("select_parameters");
        x.style.display = "block";
        document.getElementById("heading53").classList.add("collapsed")
        document.getElementById("accordion53").classList.remove("show")

        var i = 0
        var str_ = ""
        for (i; i < $scope.temp_column_list.length; i++) {

            if (i == $scope.temp_column_list.length - 1) {
                str_ = str_.concat($scope.temp_column_list[i].toString() + ':' + $scope.temp_column_list[i].toString())

            } else {
                str_ = str_.concat($scope.temp_column_list[i].toString() + ':' + $scope.temp_column_list[i].toString(), ',')

            }


        }
        console.log(str_)

        $.ajax({
            type: 'POST',
            url: 'create_dataset',
            data: {
                user_file_column_structure: str_,
                csrfmiddlewaretoken: $scope.getCookie('csrftoken'),

            },

            success: function (data) {
                x.style.display = "none";
                document.getElementById("heading56").click()
                document.getElementById("heading56").classList.remove("collapsed")
                document.getElementById("accordion56").classList.add("show")


            }
        })

    }


    $scope.$watch('workbook_sheet_selected', function () {
        console.log($scope.workbook_sheet_selected)


        if ($scope.workbook_sheet_selected != null) {
            $scope.workbook_data_flag = 1
            console.log('hellow')
            var obj = JSON.stringify({"sheet_name_selected": $scope.workbook_sheet_selected});
            console.log(obj)
            $http({
                method: 'POST',
                url: url + '/get_sheet_data',
                data: obj
            }).then(function mySuccess(response) {
                console.log(response.data)
                $scope.data_ = JSON.parse(response.data);
                $scope.workbook_sheet_table = []
                $scope.workbook_sheet_table.push({rows: $scope.data_, cols: Object.keys($scope.data_[0])});
                $scope.workbook_data_flag = 0

            });
        }

    })


    $scope.workbook_load = function () {

        console.log($scope.initial_row_index)
        $scope.workbook_data_flag = 1

        var obj = JSON.stringify({
            "initial_row_index": $scope.initial_row_index,
            "sheet_name_selected": $scope.workbook_sheet_selected
        });
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/get_sheet_data',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response.data)
            $scope.data_ = JSON.parse(response.data);
            $scope.workbook_sheet_table = []
            $scope.workbook_sheet_table.push({rows: $scope.data_, cols: Object.keys($scope.data_[0])});
            $scope.workbook_data_flag = 0
            $scope.get_column_names_workbook()
        });


    }


    $scope.get_column_names_update = function () {
        $http.get(url + '/get_updated_columns')
            .then(function mySuccess(response) {
                try {
                    var data = JSON.parse(response.data);
                    console.log(Object.keys(data[0]));
                    $scope.column_list = Object.keys(data[0])
                    $scope.select_parameter_flag = 0
                    //angular.element(document.getElementById("heading53").click())


                } catch (err) {
                    console.log('pause');

                }
            });
    }

    $scope.get_column_names_initial()

    $scope.filter_initialize = function () {
        if (filter_initialize_count == 0 && $scope.filter_initilize_table == null) {
            $scope.data_clensing_flag = 1
            $scope.filter_initilize_table = []
            $http.get(url + '/filter_initialize')
                .then(function mySuccess(response) {

                    try {
                        var data = JSON.parse(response.data);
                        $scope.filter_initilize_table = []
                        $scope.filter_initilize_table.push({rows: data, cols: Object.keys(data[0])});
                        $scope.data_clensing_flag = 0
                        $('.chatWindow').toggleClass('active')
                        $('.LuChatBtn').toggleClass('active')
                        // $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">Hello! I\'m Einstein and I\'m here to help you make the most of my platform!</p></div>')
                        $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text"> All good , Auto Filtering is done,Please click action button to perform any data transformations.</p></div>')

                        var delayInMilliseconds = 10000; //1 second

                        setTimeout(function () {
                            $('.LuChatBtn').removeClass('active')

                            $('.chatWindow').removeClass('active')
                        }, delayInMilliseconds);

                        $scope.get_column_names_update()
                    } catch (e) {
                        console.log('issue_detected')
                        $scope.filter_initilize_table = []
                        $scope.data_clensing_flag = 0
                        $scope.all_catergorical_flag = 1
                    }


                }, function (response) {


                    $('.chatWindow').toggleClass('active')
                    $('.LuChatBtn').toggleClass('active')
                    // $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">Hello! I\'m Einstein and I\'m here to help you make the most of my platform!</p></div>')
                    $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text"> Hmm.. Looks like you are giving me some hard work, Dont worry will notify once complete.</p></div>')

                    var delayInMilliseconds = 10000; //1 second

                    setTimeout(function () {
                        $('.LuChatBtn').removeClass('active')

                        $('.chatWindow').removeClass('active')
                    }, delayInMilliseconds);


                    // angular.element(document.getElementById('StartChat').click())
                    // var myEl = angular.element(document.querySelector('#chatwindow'));
                    // myEl.append("<div style='width: 100%;'><span id='StuLife" + '0' + "' class='options' style='float:left;margin-right: 40px;background-color:#77DD77' onclick='test.myFunction(event,this)'>" + 'Hmm.. Looks like you are giving me some hard work, Dont worry will notify once complete' + "</span></div><div style='clear: both'></div>");
                    $scope.filter_done()

                });
            filter_initialize_count = 1
        } else {
            filter_initialize_count = 0
        }


    }


    $scope.filter_done = function () {
        $http.get(url + '/filter_done_check')
            .then(function mySuccess(response) {
                console.log('getting result from filter done check')
                try {

                    if (response.data.toString() == "emptydf") {
                        console.log('issue_detected')
                        $scope.filter_initilize_table = []
                        $scope.data_clensing_flag = 0
                        $scope.all_catergorical_flag = 1
                    } else {
                        var data = JSON.parse(response.data);
                        console.log(data)
                        $scope.filter_initilize_table = []
                        $scope.filter_initilize_table.push({rows: data, cols: Object.keys(data[0])});
                        $scope.data_clensing_flag = 0
                    }


                } catch (err) {
                    $scope.filter_done()
                    console.log('checking if the filtering is done')
                }

            }, function (response) {
                console.log('issue_detected')
                $scope.filter_initilize_table = []
                $scope.data_clensing_flag = 0
                $scope.all_catergorical_flag = 1
            })
    }

    $scope.action_ = function (action_type, index) {

        $scope.data_clensing_flag = 1
        console.log(index)
        var name = $scope.filter_initilize_table[0].rows;
        var column_name = name[index].Names

        var obj = JSON.stringify({"action": action_type, "column_name": column_name});
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/filter_actions',
            data: obj
        }).then(function mySuccess(response) {
            $scope.data_clensing_flag = 0
            filter_initialize_count = 0
            $scope.filter_initilize_table = null
            $scope.filter_initialize()


        });


    }

    $scope.filter_stat_dash = function (index) {
        $scope.data_clensing_flag = 1
        console.log(index)
        var name = $scope.filter_initilize_table[0].rows;
        var column_name = name[index].Names

        var obj = JSON.stringify({"column_name": column_name});
        console.log(obj)
        $http({
            method: 'POST',
            url: url + '/filter_stat_dash',
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

            $scope.data_clensing_flag = 0


        });

    }

    $scope.time_series_forecast_func = function () {
        if ($scope.timeseries_date != null && $scope.timeseries_target != null && $scope.date_frequency_selected != null && $scope.forecast_steps != null) {

            angular.element(document.getElementById("heading52").click())

            $('.chatWindow').toggleClass('active')
            $('.LuChatBtn').toggleClass('active')
            // $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">Hello! I\'m Einstein and I\'m here to help you make the most of my platform!</p></div>')
            $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">Great! ,Predictive Model Training Started</p></div>')
            $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">Will Notify Once Model Training Completed!</p></div>')
            var delayInMilliseconds = 10000; //1 second

            setTimeout(function () {
                $('.LuChatBtn').removeClass('active')

                $('.chatWindow').removeClass('active')
            }, delayInMilliseconds);


            var obj = JSON.stringify({
                "timeseries_date": $scope.timeseries_date,
                "timeseries_target": $scope.timeseries_target,
                "date_frequency": $scope.date_frequency_selected,
                "forecast_steps": $scope.forecast_steps,
                "data": "dataa"
            });
            console.log(obj)
            $http({
                method: 'POST',
                url: url + '/predictive_models',
                data: obj
            }).then(function mySuccess(response) {


            });
        } else {
            alert('Please fill all the required fields')
        }


    }

    $scope.inspect_table = function () {


        if (inspect_count == 0) {
            $scope.data_inspect_flag = 1

            $scope.inspect_data_table = []
            $http({
                method: 'POST',
                url: url + '/filter_inspect_data',
                data: '1'
            }).then(function mySuccess(response) {
                var data = JSON.parse(response.data);
                $scope.inspect_data_table.push({rows: data, cols: Object.keys(data[0])});
                $scope.data_inspect_flag = 0


            });
            inspect_count = 1
        } else {
            inspect_count = 0
        }


    }

    $scope.goto_workbench = function () {
        $http.get(url + '/goto_workbench')
            .then(function mySuccess(response) {
                $window.location.href = 'dashboard_workbench';
            });
    }

    $scope.save_dataset = function () {

        $http.get(url + '/save_dataset')
            .then(function mySuccess(response) {
                $window.location.href = 'datasets';
            });
    }

}])
;
