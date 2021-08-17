function getCookie(name) {
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


function check_new_notification_available() {
    var data_string = 'test user notify'
    // console.log(data_string)
    $.ajax({
        type: 'POST',
        url: 'user_notification_check',
        data: {
            data: data_string,
            csrfmiddlewaretoken: getCookie('csrftoken'),

        },

        success: function (data) {
            var dataElement = JSON.parse(data);
            // console.log(dataElement.unseen_count)
            document.getElementById('notification_bell').innerHTML = dataElement.unseen_count.toString()
            document.getElementById('notification_bell2').innerHTML = dataElement.unseen_count.toString().concat(' New')
        }


    })
    seq()
}

function notification_update() {
    // console.log('setTimeout fired afer 3 seconds');
    var data_string = 'notifications_seen'
    // console.log(data_string)
    $("#notification").append("<center> <div id='notification_spinner' class=\"spinner-border\" role=\"status\">\n" +
        "  <span class=\"sr-only\">Loading...</span>\n" +
        "</div></center>")


    $.ajax({
        type: 'POST',
        url: 'user_notification_update',
        data: {
            data: data_string,
            csrfmiddlewaretoken: getCookie('csrftoken'),

        },

        success: function (data) {

            var spinner_obj = document.getElementById("notification_spinner");
            spinner_obj.remove();

            var dataElement = JSON.parse(data);

            var today = new Date();
            var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var dateTime = date + ' ' + time;
            document.getElementById('notification').innerHTML = ""

            for (var i = 0; i < dataElement.length; i++) {
                var notification_id = dataElement[i].id;
                var notification_title = dataElement[i].notification_title;
                var notification_message = dataElement[i].notification_message;
                var notification_type = dataElement[i].notification_type;



                if (notification_type === 'File Upload') {
                    $("#notification").append("  <a id=\"notifyLink\" href=\"javascript:void(0)\">\n" +
                        "                                    <div id=\"notificationBar\" class=\"media\">\n" +
                        "                                        <div id=\"notificationMedia\" class=\"media-left align-self-center\">" +
                        "                                        <i class=\"ft-file icon-bg-circle bg-cyan mr-0\"></i></div>\n" +
                        "                                        <div id=\"notifyBody\" class=\"media-body\">\n" +
                        "                                            <h6 id=\"notificationHeading\" class=\"media-heading\">" + notification_title + "</h6>\n" +
                        "                                            <p id=\"notificationText\"\n" +
                        "                                               class=\"notification-text font-small-3 text-muted\">" + notification_message + "</p><small>\n" +
                        "                                            <time id=\"notifyTime\" class=\"media-meta text-muted\"\n" +
                        "                                                  datetime=\"2015-06-11T18:29:20+08:00\">" + dateTime +
                        "                                            </time>\n" +
                        "                                        </small>\n" +
                        "                                        </div>\n" +
                        "                                    </div>\n" +
                        "                                </a>"
                    );
                } else if (notification_type === 'Create Dataset') {
                    $("#notification").append("  <a id=\"notifyLink\" href=\"javascript:void(0)\">\n" +
                        "                                    <div id=\"notificationBar\" class=\"media\">\n" +
                        "                                        <div id=\"notificationMedia\" class=\"media-left align-self-center\">" +
                        "                                        <i class=\"ft-bar-chart icon-bg-circle bg-yellow mr-0\"></i></div>\n" +
                        "                                        <div id=\"notifyBody\" class=\"media-body\">\n" +
                        "                                            <h6 id=\"notificationHeading\" class=\"media-heading\">" + notification_title + "</h6>\n" +
                        "                                            <p id=\"notificationText\"\n" +
                        "                                               class=\"notification-text font-small-3 text-muted\">" + notification_message + "</p><small>\n" +
                        "                                            <time id=\"notifyTime\" class=\"media-meta text-muted\"\n" +
                        "                                                  datetime=\"2015-06-11T18:29:20+08:00\">" + dateTime +
                        "                                            </time>\n" +
                        "                                        </small>\n" +
                        "                                        </div>\n" +
                        "                                    </div>\n" +
                        "                                </a>"
                    );
                }else if (notification_type === 'Publish Dataset') {
                    $("#notification").append("  <a id=\"notifyLink\" href=\"javascript:void(0)\">\n" +
                        "                                    <div id=\"notificationBar\" class=\"media\">\n" +
                        "                                        <div id=\"notificationMedia\" class=\"media-left align-self-center\">" +
                        "                                        <i class=\"ft-monitor icon-bg-circle bg-red mr-0\"></i></div>\n" +
                        "                                        <div id=\"notifyBody\" class=\"media-body\">\n" +
                        "                                            <h6 id=\"notificationHeading\" class=\"media-heading\">" + notification_title + "</h6>\n" +
                        "                                            <p id=\"notificationText\"\n" +
                        "                                               class=\"notification-text font-small-3 text-muted\">" + notification_message + "</p><small>\n" +
                        "                                            <time id=\"notifyTime\" class=\"media-meta text-muted\"\n" +
                        "                                                  datetime=\"2015-06-11T18:29:20+08:00\">" + dateTime +
                        "                                            </time>\n" +
                        "                                        </small>\n" +
                        "                                        </div>\n" +
                        "                                    </div>\n" +
                        "                                </a>"
                    );
                }

            }
        }
    })
    //seq()
}

function seq() {
    setTimeout(function () {
        //notification_update()
        check_new_notification_available()
    }, 10000);
}

seq()

