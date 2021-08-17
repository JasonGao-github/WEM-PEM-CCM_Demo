var myApp3 = angular.module("app3", []);

myApp3.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
}]);


myApp3.controller('tiles_data_send_controller', ['$scope', '$http', '$interval', function ($scope, $http, $interval) {


    $http.get('http://127.0.0.1:8000/dashboard_load')
        .then(function mySuccess(response) {

            var data = JSON.parse(response.data);
            console.log(data[0].total_sales)


            $scope.total_sales = data[0].total_sales
            $scope.average_sales = data[0].average_sales
            $scope.total_quantity = data[0].total_quantity

            $scope.average_quantity = data[0].average_quantity
            $scope.common_sale = data[0].common_sale
            $scope.common_quantity = data[0].common_quantity


            //console.log(Object.keys(data[0]));
            //$scope.list = Object.keys(data[0])

            $scope.names = [
                'Jani',
                'Carl',
                'Margareth',
                'Hege',
                'Joe',
                'Gustav',
                'Birgit',
                'Mary',
                'Kai'
            ];


            console.log($scope.names)

        });


}]);


myApp3.controller('dashboard_angular_controller', ['$scope', '$http', '$interval', function ($scope, $http, $interval) {


    var url = 'http://' + String(location.host)
    console.log(url)
    $scope.searchQuery = '';
    $scope.time_period = ["Weekly", "Monthly", "Yearly"];
    $scope.selectedName = $scope.time_period[0];
    $scope.date_range_submit_flag = 0;


    $scope.start = {
        value: new Date(2003, 2, 24)
    };

    $scope.end = {
        value: new Date(2003, 11, 22)
    };

    $scope.reverse = true;
    $scope.sortBy = function (propertyName) {
        $scope.reverse = ($scope.propertyName === propertyName) ? !$scope.reverse : false;
        $scope.propertyName = propertyName;
    };


    $scope.date_range = function () {

        $scope.date_range_submit_flag = 1;


        console.log('date range submitting')
        $scope.date_range_submit_flag = 1;
        console.log($scope.start.value)
        console.log($scope.end.value)
        var obj = JSON.stringify({"start": $scope.start.value, "end": $scope.end.value});
        $http({

            method: 'POST',
            url: url + '/ajax_get_date_range',
            data: obj
        }).then(function mySuccess(response) {

            var data = JSON.parse(response.data);
            console.log(data)

            console.log(data.barchart)
            var barchart_ = JSON.parse(data.barchart);
            var sales = []
            var profit = []
            var date = []

            for (i = 0; i < barchart_.length; i++) {
                sales.push(barchart_[i].sales);
                profit.push(barchart_[i].profit);
                date.push(barchart_[i].date)

            }
            $scope.bar_chart(sales, profit, date);


            $scope.table_data = JSON.parse(data.table);


            var item_names = []
            var item_count_data = []
            var category_count_data = []

            $scope.item_count_data = JSON.parse(data.piechart);
            console.log($scope.item_count_data)

            for (i = 0; i < $scope.item_count_data.length; i++) {
                item_names.push($scope.item_count_data[i].item_names);
                item_count_data.push($scope.item_count_data[i].item_names_count_data);
                //category_count_data.push($scope.item_count_data[i].category_names_count_data)

            }

            $scope.pie_chart(item_count_data, item_names)


        })


    };


    $http.get(url + '/ajax_all_measurements')
        .then(function mySuccess(response) {

            var measurement_data = JSON.parse(response.data);
            console.log(measurement_data[0].total_sales)


            $scope.total_sales = measurement_data[0].total_sales
            $scope.average_sales = measurement_data[0].average_sales
            $scope.total_quantity = measurement_data[0].total_quantity

            $scope.average_quantity = measurement_data[0].average_quantity
            $scope.common_sale = measurement_data[0].common_sale
            $scope.common_quantity = measurement_data[0].common_quantity


        })


    $scope.$watch('selectedName', function () {

        console.log('time period submitting')
        console.log($scope.selectedName);
        $scope.date_range_submit_flag = 0;
        var obj = JSON.stringify({"time_period": $scope.selectedName});
        $http({

            method: 'POST',
            url: url + '/ajax_get_time_period',
            data: obj
        }).then(function mySuccess(response) {
            console.log('helloooowowow')

            var sales = []
            var profit = []
            var date = []

            $scope.barchar_data = JSON.parse(response.data);

            for (i = 0; i < $scope.barchar_data.length; i++) {
                sales.push($scope.barchar_data[i].sales);
                profit.push($scope.barchar_data[i].profit);
                date.push($scope.barchar_data[i].date)

            }


            $scope.bar_chart(sales, profit, date);


        })


    });


    $scope.bar_chart = function (sales, profit, date) {

        var title = String($scope.selectedName) + " Retail Sales"
        var x_axis_title = ""
        if (String($scope.selectedName) == "Weekly" && $scope.date_range_submit_flag == 0) {
            x_axis_title = "Weeks"
        } else if (String($scope.selectedName) == "Monthly" && $scope.date_range_submit_flag == 0) {
            x_axis_title = "Months"
        } else if (String($scope.selectedName) == "Yearly" && $scope.date_range_submit_flag == 0) {
            x_axis_title = "Years"
        } else {
            x_axis_title = "Days"
            title = "Daily Retail Sales"
        }

        var myPlot = document.getElementById('bar_chart')
        var sales_bar_grpah_data = {
            x: date,
            y: sales,
            type: 'bar',
            name: 'Sales '
        }
        var profit_bar_grpah_data = {
            x: date,
            y: profit,
            type: 'bar',
            name: 'Profit '
        }


        var data = [sales_bar_grpah_data, profit_bar_grpah_data];

        var layout = {
            legend: {
                x: 0,
                y: -0.2,
                "orientation": "h"
            },
            title: title,
            xaxis: {
                autorange: true,
                title: x_axis_title,
                tickfont: {
                    size: 14,
                    color: 'rgb(107, 107, 107)'
                }
            },
            yaxis: {
                autorange: true,
                title: 'Sales ($1000)',
                titlefont: {
                    size: 16,
                    color: 'rgb(107, 107, 107)'
                }
            },


        }

        $scope.bar_plot_ = Plotly.newPlot('bar_chart', data, layout, {responsive: true});
        myPlot.on('plotly_click', function (data) {
            $scope.data_selected = data.points[0].x
            console.log(data.points[0].x);
            var obj = JSON.stringify({"date_selected": data.points[0].x});
            $http({

                method: 'POST',
                url: url + '/ajax_get_date_select',
                data: obj
            }).then(function mySuccess(response) {

                var item_names = []
                var item_count_data = []
                //var category_count_data = []

                $scope.item_count_data = JSON.parse(response.data);
                console.log($scope.item_count_data)

                for (i = 0; i < $scope.item_count_data.length; i++) {
                    item_names.push($scope.item_count_data[i].item_names);
                    item_count_data.push($scope.item_count_data[i].item_names_count_data);
                    //category_count_data.push($scope.item_count_data[i].category_names_count_data)

                }

                $scope.pie_chart(item_count_data, item_names)


            })


        });


    };


    $scope.pie_chart = function (values, labels) {
        var title = ""
        if ($scope.date_range_submit_flag == 1 && $scope.data_selected == null) {
            title = "Percentages Of Items Sold In Given Range"

        } else {
            title = "Percentages Of Items Sold In " + String($scope.data_selected)
            $scope.data_selected = ""
        }


        var data = [{
            values: values,
            labels: labels,
            domain: {column: 2},
            name: 'Profit Stats',
            hoverinfo: 'label+percent+name',
            hole: .3,
            type: 'pie'
        }];

        var layout = {
            title: title,
            showlegend: true,
            annotations: [
                {
                    font: {
                        size: 10
                    },
                    showarrow: false,
                    text: 'Percentages',

                }
            ],


            grid: {rows: 0.3, columns: 4}
        };

        $scope.pie_plot = Plotly.newPlot('pie_chart', data, layout, {responsive: true});


    }


}]);


//previous version

/*

myApp3.controller('dashboard_angular_controller', ['$scope', '$http', '$interval', function ($scope, $http, $interval) {
    $scope.searchQuery = '';
    $scope.time_period = ["Weekly", "Monthly", "Yearly"];
    $scope.selectedName = $scope.time_period[0]


    $scope.start = {
        value: new Date(2003, 2, 24)
    };

    $scope.end = {
        value: new Date(2003, 11, 22)
    };


    $scope.date_range = function () {
        console.log('date range submitting')
        console.log($scope.start.value)
        console.log($scope.end.value)
        var obj = JSON.stringify({"start": $scope.start.value, "end": $scope.end.value});
        $http({

            method: 'POST',
            url: 'http://127.0.0.1:8000/ajax_date_range_call',
            data: obj
        }).then(function mySuccess(response) {
            // alert('hellow')
            $scope.filter_function()
        })


    };


    $scope.filter_function = function () {

        $http.get('http://127.0.0.1:8000/ajax_all_data_call')
            .then(function mySuccess(response) {
                var data = JSON.parse(response.data);
                console.log(data)
                $scope.data = data

            });


        $http.get('http://127.0.0.1:8000/ajax_date_range_barchart_call')
            .then(function mySuccess(response) {

                var sales = []
                var profit = []
                var date = []

                $scope.date_range_data = JSON.parse(response.data);

                for (i = 0; i < $scope.date_range_data.length; i++) {
                    sales.push($scope.date_range_data[i].sales);
                    profit.push($scope.date_range_data[i].profit);
                    date.push($scope.date_range_data[i].date)

                }


                $scope.bar_chart(sales, profit, date);


            })


        $http.get('http://127.0.0.1:8000/ajax_item_count_call')
            .then(function mySuccess(response) {

                var item_names = []
                var item_count_data = []
                //var category_count_data = []

                $scope.item_count_data = JSON.parse(response.data);
                console.log($scope.item_count_data)

                for (i = 0; i < $scope.item_count_data.length; i++) {
                    item_names.push($scope.item_count_data[i].item_names);
                    item_count_data.push($scope.item_count_data[i].item_names_count_data);
                    //category_count_data.push($scope.item_count_data[i].category_names_count_data)

                }
                //
                //
                // $scope.bar_chart(weekly_sales, weekly_profit, date);
                $scope.pie_chart(item_count_data, item_names)


            })

    }


    $http.get('http://127.0.0.1:8000/ajax_all_data_call')
        .then(function mySuccess(response) {
            var data = JSON.parse(response.data);
            console.log(data)
            $scope.data = data

        });


    $http.get('http://127.0.0.1:8000/ajax_weekly_call')
        .then(function mySuccess(response) {

            var weekly_sales = []
            var weekly_profit = []
            var date = []

            $scope.weekly_data = JSON.parse(response.data);

            for (i = 0; i < $scope.weekly_data.length; i++) {
                weekly_sales.push($scope.weekly_data[i].weekly_sampled_sales);
                weekly_profit.push($scope.weekly_data[i].weekly_sampled_profit);
                date.push($scope.weekly_data[i].date)

            }


            $scope.bar_chart(weekly_sales, weekly_profit, date);


        })


    $http.get('http://127.0.0.1:8000/ajax_item_count_call')
        .then(function mySuccess(response) {

            var item_names = []
            var item_count_data = []
            //var category_count_data = []

            $scope.item_count_data = JSON.parse(response.data);
            console.log($scope.item_count_data)

            for (i = 0; i < $scope.item_count_data.length; i++) {
                item_names.push($scope.item_count_data[i].item_names);
                item_count_data.push($scope.item_count_data[i].item_names_count_data);
                //category_count_data.push($scope.item_count_data[i].category_names_count_data)

            }
            //
            //
            // $scope.bar_chart(weekly_sales, weekly_profit, date);
            $scope.pie_chart(item_count_data, item_names)


        })


    $http.get('http://127.0.0.1:8000/ajax_all_measurements_call')
        .then(function mySuccess(response) {

            var measurement_data = JSON.parse(response.data);
            console.log(measurement_data[0].total_sales)


            $scope.total_sales = measurement_data[0].total_sales
            $scope.average_sales = measurement_data[0].average_sales
            $scope.total_quantity = measurement_data[0].total_quantity

            $scope.average_quantity = measurement_data[0].average_quantity
            $scope.common_sale = measurement_data[0].common_sale
            $scope.common_quantity = measurement_data[0].common_quantity


        })


    $scope.$watch('selectedName', function () {
        console.log($scope.selectedName);


        if ($scope.selectedName == "Weekly") {
            $http.get('http://127.0.0.1:8000/ajax_weekly_call')
                .then(function mySuccess(response) {

                    var weekly_sales = []
                    var weekly_profit = []
                    var date = []

                    $scope.weekly_data = JSON.parse(response.data);

                    for (i = 0; i < $scope.weekly_data.length; i++) {
                        weekly_sales.push($scope.weekly_data[i].weekly_sampled_sales);
                        weekly_profit.push($scope.weekly_data[i].weekly_sampled_profit);
                        date.push($scope.weekly_data[i].date)

                    }


                    $scope.bar_chart(weekly_sales, weekly_profit, date);


                })


        } else if ($scope.selectedName == "Monthly") {
            console.log('monthly ajax call')

            $http.get('http://127.0.0.1:8000/ajax_monthly_call')
                .then(function mySuccess(response) {

                    var monthly_sales = []
                    var monthly_profit = []
                    var date = []

                    $scope.monthly_data = JSON.parse(response.data);

                    for (i = 0; i < $scope.monthly_data.length; i++) {
                        monthly_sales.push($scope.monthly_data[i].monthly_sampled_sales);
                        monthly_profit.push($scope.monthly_data[i].monthly_sampled_profit);
                        date.push($scope.monthly_data[i].date)

                    }


                    $scope.bar_chart(monthly_sales, monthly_profit, date);


                })


        } else if ($scope.selectedName == "Yearly") {

            console.log('yearly ajax call')

            $http.get('http://127.0.0.1:8000/ajax_yearly_call')
                .then(function mySuccess(response) {

                    var yearly_sales = []
                    var yearly_profit = []
                    var date = []

                    $scope.yearly_data = JSON.parse(response.data);
                    console.log($scope.yearly_data)

                    for (i = 0; i < $scope.yearly_data.length; i++) {
                        yearly_sales.push($scope.yearly_data[i].yearly_sampled_sales);
                        yearly_profit.push($scope.yearly_data[i].yearly_sampled_profit);
                        date.push($scope.yearly_data[i].date)

                    }


                    $scope.bar_chart(yearly_sales, yearly_profit, date);


                })


        }


    });


    $scope.bar_chart = function (sales, profit, date) {
        var myPlot = document.getElementById('bar_chart')
        var sales_bar_grpah_data = {
            x: date,
            y: sales,
            type: 'bar',
            name: 'Sales '
        }
        var profit_bar_grpah_data = {
            x: date,
            y: profit,
            type: 'bar',
            name: 'Profit '
        }


        var data = [sales_bar_grpah_data, profit_bar_grpah_data];

        var layout = {
            legend: {
                x: 0,
                y: -0.2,
                "orientation": "h"
            },
            title: 'Yearly Retail Sales',
            xaxis: {
                autorange: true,
                title: 'Months',
                tickfont: {
                    size: 14,
                    color: 'rgb(107, 107, 107)'
                }
            },
            yaxis: {
                autorange: true,
                title: 'Sales ($1000)',
                titlefont: {
                    size: 16,
                    color: 'rgb(107, 107, 107)'
                }
            },


        }

        $scope.bar_plot_ = Plotly.newPlot('bar_chart', data, layout, {responsive: true});
        myPlot.on('plotly_click', function (data) {
            console.log(data.points[0].x);
            var obj = JSON.stringify({"date_selected": data.points[0].x});
            $http({

                method: 'POST',
                url: 'http://127.0.0.1:8000/ajax_date_select_call',
                data: obj
            }).then(function mySuccess(response) {
                // alert('hellow')
                $scope.filter_function()
            })


        });


    };


    $scope.pie_chart = function (values, labels) {
        var data = [{
            values: values,
            labels: labels,
            domain: {column: 2},
            name: 'Profit Stats',
            hoverinfo: 'label+percent+name',
            hole: .3,
            type: 'pie'
        }];

        var layout = {
            title: 'Profit From Each Sector',
            showlegend: true,
            annotations: [
                {
                    font: {
                        size: 10
                    },
                    showarrow: false,
                    text: 'Total Profit $568',

                }
            ],


            grid: {rows: 0.3, columns: 4}
        };

        $scope.pie_plot = Plotly.newPlot('pie_chart', data, layout, {responsive: true});


    }


}]);



*/