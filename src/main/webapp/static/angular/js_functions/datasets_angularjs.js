var app = angular.module("dataset_app", []);
app.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
}]);

app.controller('dataset_controller', ['$scope', '$http', '$interval', '$window', function ($scope, $http, $interval, $window) {
    var url = 'http://' + String(location.host)
    $scope.dataset_table_flag = 1
    $scope.no_dataset_files_display_flag = 0

    $scope.merge_type_list = ['Direct','Add Data','Inner Join', 'Outer Join']

    $scope.merge_dataset_one = null
    $scope.merge_dataset_two = null
    $scope.merge_type_selected = null
    $scope.new_dataset_name = 'Merge_dataset'
    $scope.app_name_provided=''



    $scope.merge_datasets = function () {

        if ($scope.merge_dataset_one != null && $scope.merge_dataset_two != null && $scope.merge_type_selected != null & $scope.new_dataset_name != null) {

            const obj = JSON.stringify({
                "merge_dataset_one": $scope.merge_dataset_one,
                "merge_dataset_two": $scope.merge_dataset_two,
                "merge_type_selected": $scope.merge_type_selected,
                "new_dataset_name": $scope.new_dataset_name
            });


            $http({
                method: 'POST',
                url: url + '/merge_datasets',
                data: obj
            }).then(function mySuccess(response) {
                console.log(response.data)
                $scope.get_user_dataset_table()
            })


        } else {
            alert('Invalid Configuration')
        }


    }


    $scope.get_user_dataset_table = function () {
        $http({
            method: 'POST',
            url: url + '/get_dataset_table_data',
            data: '1'
        }).then(function mySuccess(response) {
            $scope.data = JSON.parse(response.data);
            console.log($scope.data)
            $scope.dataset_name_list = []
            var i = 0
            for (i; i < $scope.data.length; i++) {
                $scope.dataset_name_list.push($scope.data[i].dataset_name)
            }

            try {
                $scope.datasets_table = []
                $scope.datasets_table.push({rows: $scope.data, cols: Object.keys($scope.data[0])});
                $scope.dataset_table_flag = 0
            } catch (e) {
                $scope.datasets_table = []
                $scope.dataset_table_flag = 0
                $scope.no_dataset_files_display_flag = 1


                $('.chatWindow').toggleClass('active')
                $('.LuChatBtn').toggleClass('active')
                // $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">Hello! I\'m Einstein and I\'m here to help you make the most of my platform!</p></div>')
                $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text"> Hmm.. Looks like you havent created any datasets,Please goto sources to create dataset.</p></div>')

                var delayInMilliseconds = 10000; //1 second

                setTimeout(function () {
                    $('.LuChatBtn').removeClass('active')

                    $('.chatWindow').removeClass('active')
                }, delayInMilliseconds);


            }


        }, function (response) {

            $scope.dataset_table_flag = 0
            $scope.no_dataset_files_display_flag = 1
            $('.chatWindow').toggleClass('active')
            $('.LuChatBtn').toggleClass('active')
            // $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">Hello! I\'m Einstein and I\'m here to help you make the most of my platform!</p></div>')
            $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text"> Hmm.. Looks like you havent created any datasets,Please goto sources to create dataset.</p></div>')

            var delayInMilliseconds = 10000; //1 second

            setTimeout(function () {
                $('.LuChatBtn').removeClass('active')

                $('.chatWindow').removeClass('active')
            }, delayInMilliseconds);


        });
    }

    $scope.get_user_dataset_table()

    $scope.goto_workbench = function (index) {
        $('#application_name_input').modal('show')
        $scope.workbench_selected_dataset_name = $scope.data[index]['dataset_name']
    }

    $scope.goto_workbench_done=function(){

        var obj=JSON.stringify({"dataset_name":$scope.workbench_selected_dataset_name,"app_name":$scope.app_name_provided });
         $http({
            method: 'POST',
            url: url + '/goto_workbench_from_datasets',
            data: obj
        }).then(function mySuccess(response) {
            $window.location.href = 'render_workbench';
        })

    }

    $scope.delete_dataset = function (index) {
        const obj = JSON.stringify({"dataset_name": $scope.data[index]['dataset_name']});
        alert('Are you sure you want to delete this dataset ?')
        $http({
            method: 'POST',
            url: url + '/delete_dataset',
            data: obj
        }).then(function mySuccess(response) {
            $scope.dataset_table_flag = 1
            $http({
                method: 'POST',
                url: url + '/get_dataset_table_data',
                data: '1'
            }).then(function mySuccess(response) {
                $scope.data = JSON.parse(response.data);
                console.log($scope.data)
                try {
                    $scope.datasets_table = []
                    $scope.datasets_table.push({rows: $scope.data, cols: Object.keys($scope.data[0])});
                    $scope.dataset_table_flag = 0
                } catch (e) {
                    $scope.datasets_table = []
                }


            });
        });


    }

    $scope.view_dataset = function (index) {

        const obj = JSON.stringify({"dataset_name": $scope.data[index]['dataset_name']});
        $http({
            method: 'POST',
            url: url + '/view_dataset',
            data: obj
        }).then(function mySuccess(response) {
            $scope.data = JSON.parse(response.data);
            console.log($scope.data)
            try {
                $scope.datasets_view_table = []
                $scope.datasets_view_table.push({rows: $scope.data, cols: Object.keys($scope.data[0])});
                $scope.datasets_view_table_flag = 0
            } catch (e) {
                $scope.datasets_view_table = []
            }


        });


    }

}])