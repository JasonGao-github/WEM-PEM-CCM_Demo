var app = angular.module("sources_app", []);
app.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.defaults.xsrfCookieName = 'csrftoken';
    $httpProvider.defaults.xsrfHeaderName = 'X-CSRFToken';
}]);

app.controller('source_controller', ['$scope', '$http', '$interval', '$window', function ($scope, $http, $interval, $window) {



    var url = 'http://' + String(location.host)
    $scope.selected_source = 'Local File Upload'
    $scope.source_list = ['Local File Upload', 'S3 Bucket', 'FTP', 'RDS']
    $scope.source_files_table = []
    $scope.no_source_files_display_flag = 0
    $scope.source_table_flag = 1
    $http({
        method: 'POST',
        url: url + '/source_files_table',
        data: '1'
    }).then(function mySuccess(response) {

        $scope.data = JSON.parse(response.data);
        // console.log($scope.data)
        try {
            $scope.source_files_table = []
            $scope.source_files_table.push({rows: $scope.data, cols: Object.keys($scope.data[0])});
            $scope.source_table_flag = 0
            $scope.no_source_files_display_flag = 0
        } catch (e) {
            $scope.source_files_table = []
            $scope.source_table_flag = 0
            $scope.no_source_files_display_flag = 1


            $('.chatWindow').toggleClass('active')
            $('.LuChatBtn').toggleClass('active')
            // $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">Hello! I\'m Einstein and I\'m here to help you make the most of my platform!</p></div>')
            $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text"> Hmm.. Looks like you havent uploaded any source files ,Please select a file and upload!.</p></div>')

            var delayInMilliseconds = 10000; //1 second

            setTimeout(function () {
                $('.LuChatBtn').removeClass('active')

                $('.chatWindow').removeClass('active')
            }, delayInMilliseconds);


        }


    }, function (response) {
        $scope.source_table_flag = 0
        $scope.no_source_files_display_flag = 1


        $('.chatWindow').toggleClass('active')
        $('.LuChatBtn').toggleClass('active')
        // $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">Hello! I\'m Einstein and I\'m here to help you make the most of my platform!</p></div>')
        $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text"> Hmm.. Looks like you havent uploaded any source files ,Please select a file and upload!.</p></div>')

        var delayInMilliseconds = 10000; //1 second

        setTimeout(function () {
            $('.LuChatBtn').removeClass('active')

            $('.chatWindow').removeClass('active')
        }, delayInMilliseconds);


    });


    $scope.view_selected_source_data = function (index) {
        const obj = JSON.stringify({"file_name_raw": $scope.data[index]['file_name']});
        $scope.selected_source_file_data_table = []
        $http({
            method: 'POST',
            url: url + '/source_selected_data_table',
            data: obj
        }).then(function mySuccess(response) {
            $scope.data_ = JSON.parse(response.data);

            try {
                $scope.selected_source_file_data_table = []
                $scope.selected_source_file_data_table.push({rows: $scope.data_, cols: Object.keys($scope.data_[0])});
            } catch (e) {
                $scope.selected_source_file_data_table = []
            }


        });

    }


    $scope.delete_selected_source_file = function (index) {
        const obj = JSON.stringify({"file_name_raw": $scope.data[index]['file_name']});
        $scope.selected_source_file_data_table = []
        alert('Are you sure you want to delete this data source ?')
        $http({
            method: 'POST',
            url: url + '/delete_selected_file',
            data: obj
        }).then(function mySuccess(response) {
            $http({
                method: 'POST',
                url: url + '/source_files_table',
                data: '1'
            }).then(function mySuccess(response) {
                $scope.data = JSON.parse(response.data);
                // console.log($scope.data)

                try {
                    $scope.source_files_table = []
                    $scope.source_files_table.push({rows: $scope.data, cols: Object.keys($scope.data[0])});
                } catch (e) {
                    $scope.source_files_table = []
                }


            });
        });

    }

    $scope.get_index = function (index) {
        $scope.index_ = index
    }


    $scope.create_dataset = function (dataset_name) {
        console.log(dataset_name)
        const obj = JSON.stringify({
            "file_name_raw": $scope.data[$scope.index_]['file_name'],
            "dataset_name": dataset_name
        });
        $scope.selected_source_file_data_table = []
        $http({
            method: 'POST',
            url: url + '/create_dataset_redirect',
            data: obj
        }).then(function mySuccess(response) {
            console.log(response.data)
            if (response.data === 'Dataset exists') {
                $scope.datasetExists = "This dataset name exists. Try a different name."
            } else {
                $window.location.href = 'create_dataset';
            }
        });
    }

}])