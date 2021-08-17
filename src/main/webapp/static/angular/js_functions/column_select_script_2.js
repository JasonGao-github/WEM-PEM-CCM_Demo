







var box0_id_ = 0;
var box1_id_ = 0;
var box2_id_ = 0;
var box3_id_ = 0;
var box4_id_ = 0;
var box5_id_ = 0;
var box6_id_ = 0;
var box7_id_ = 0;


var box8_id_ = 0;
var box9_id_ = 0;
var box10_id_ = 0;
var box11_id_ = 0;
var box12_id_ = 0;
var box13_id_ = 0;
var box14_id_ = 0;
var box15_id_ = 0;

var box16_id_ = 0;
var box17_id_ = 0;
var box18_id_ = 0;
var box19_id_ = 0;
var box20_id_ = 0;

function allowDrop_(ev) {
    ev.preventDefault();
}

function drop_(ev) {
    ev.preventDefault();
    var id = ev.dataTransfer.getData("text");

    ev.target.appendChild(document.getElementById(id));
}

function drag_(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop0_(ev) {
    ev.preventDefault();
    box0_id_ = ev.dataTransfer.getData("text");
    console.log(box0_id_)
    ev.target.appendChild(document.getElementById(box0_id_));
    document.getElementById("box0_").value = box0_id_
    document.getElementById("box0_id_").style.borderStyle = "solid";
    document.getElementById("box0_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("customer_id_message");
    // if (element_exist) {
    //     document.getElementById("customer_id_message").remove()
    // }


}

function drag0_(ev) {
    //   ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box0_id_").style.borderStyle = "dotted";
    document.getElementById("box0_id_").style.borderColor = "black";
}

function drop1_(ev) {
    ev.preventDefault();
    box1_id_ = ev.dataTransfer.getData("text");
    console.log(box1_id_)
    ev.target.appendChild(document.getElementById(box1_id_));
    document.getElementById("box1_").value = box1_id_
    document.getElementById("box1_id_").style.borderStyle = "solid";
    document.getElementById("box1_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("date_field_message");
    // if (element_exist) {
    //     document.getElementById("date_field_message").remove()
    // }
}

function drag1_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box1_id_").style.borderStyle = "dotted";
    document.getElementById("box1_id_").style.borderColor = "black";
}


function drop2_(ev) {
    ev.preventDefault();
    box2_id_ = ev.dataTransfer.getData("text");
    console.log(box2_id_)
    ev.target.appendChild(document.getElementById(box2_id_));
    document.getElementById("box2_").value = box2_id_
    document.getElementById("box2_id_").style.borderStyle = "solid";
    document.getElementById("box2_id_").style.borderColor = "red";

    // var element_exist = document.getElementById("quantity_field_message");
    // if (element_exist) {
    //     document.getElementById("quantity_field_message").remove()
    // }
}

function drag2_(ev) {
    //   ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box2_id_").style.borderStyle = "dotted";
    document.getElementById("box2_id_").style.borderColor = "black";
}


function drop3_(ev) {
    ev.preventDefault();
    box3_id_ = ev.dataTransfer.getData("text");
    console.log(box3_id_)
    ev.target.appendChild(document.getElementById(box3_id_));
    document.getElementById("box3_").value = box3_id_
    document.getElementById("box3_id_").style.borderStyle = "solid";
    document.getElementById("box3_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("item_name_field_message");
    // if (element_exist) {
    //     document.getElementById("item_name_field_message").remove()
    // }
}

function drag3_(ev) {
    //    ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box3_id_").style.borderStyle = "dotted";
    document.getElementById("box3_id_").style.borderColor = "black";
}


function drop4_(ev) {
    ev.preventDefault();
    box4_id_ = ev.dataTransfer.getData("text");
    console.log(box4_id_)
    ev.target.appendChild(document.getElementById(box4_id_));
    document.getElementById("box4_").value = box4_id_
    document.getElementById("box4_id_").style.borderStyle = "solid";
    document.getElementById("box4_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("category_field_message");
    // if (element_exist) {
    //     document.getElementById("category_field_message").remove()
    // }
}


function drag4_(ev) {
    //   ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box4_id_").style.borderStyle = "dotted";
    document.getElementById("box4_id_").style.borderColor = "black";
}


function drop5_(ev) {
    ev.preventDefault();
    box5_id_ = ev.dataTransfer.getData("text");
    console.log(box5_id_)
    ev.target.appendChild(document.getElementById(box5_id_));
    document.getElementById("box5_").value = box5_id_
    document.getElementById("box5_id_").style.borderStyle = "solid";
    document.getElementById("box5_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("unit_price_field_message");
    // if (element_exist) {
    //     document.getElementById("unit_price_field_message").remove()
    // }
}

function drag5_(ev) {
    // ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box5_id_").style.borderStyle = "dotted";
    document.getElementById("box5_id_").style.borderColor = "black";
}


function drop6_(ev) {
    ev.preventDefault();
    box6_id_ = ev.dataTransfer.getData("text");
    console.log(box6_id_)
    ev.target.appendChild(document.getElementById(box6_id_));
    document.getElementById("box6_").value = box6_id_
    document.getElementById("box6_id_").style.borderStyle = "solid";
    document.getElementById("box6_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("purchased_price_field_message");
    // if (element_exist) {
    //     document.getElementById("purchased_price_field_message").remove()
    // }
}

function drag6_(ev) {
    // ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box6_id_").style.borderStyle = "dotted";
    document.getElementById("box6_id_").style.borderColor = "black";
}


function drop7_(ev) {
    ev.preventDefault();
    box7_id_ = ev.dataTransfer.getData("text");
    console.log(box7_id_)
    ev.target.appendChild(document.getElementById(box7_id_));
    document.getElementById("box7_").value = box7_id_
    document.getElementById("box7_id_").style.borderStyle = "solid";
    document.getElementById("box7_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag7_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box7_id_").style.borderStyle = "dotted";
    document.getElementById("box7_id_").style.borderColor = "black";
}


function drop8_(ev) {
    ev.preventDefault();
    box8_id_ = ev.dataTransfer.getData("text");
    console.log(box8_id_)
    ev.target.appendChild(document.getElementById(box8_id_));
    document.getElementById("box8_").value = box8_id_
    document.getElementById("box8_id_").style.borderStyle = "solid";
    document.getElementById("box8_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag8_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box8_id_").style.borderStyle = "dotted";
    document.getElementById("box8_id_").style.borderColor = "black";
}


function drop9_(ev) {
    ev.preventDefault();
    box9_id_ = ev.dataTransfer.getData("text");
    console.log(box9_id_)
    ev.target.appendChild(document.getElementById(box9_id_));
    document.getElementById("box9_").value = box9_id_
    document.getElementById("box9_id_").style.borderStyle = "solid";
    document.getElementById("box9_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag9_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box9_id_").style.borderStyle = "dotted";
    document.getElementById("box9_id_").style.borderColor = "black";
}


function drop10_(ev) {
    ev.preventDefault();
    box10_id_ = ev.dataTransfer.getData("text");
    console.log(box10_id_)
    ev.target.appendChild(document.getElementById(box10_id_));
    document.getElementById("box10_").value = box10_id_
    document.getElementById("box10_id_").style.borderStyle = "solid";
    document.getElementById("box10_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag10_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box10_id_").style.borderStyle = "dotted";
    document.getElementById("box10_id_").style.borderColor = "black";
}

function drop11_(ev) {
    ev.preventDefault();
    box11_id_ = ev.dataTransfer.getData("text");
    console.log(box11_id_)
    ev.target.appendChild(document.getElementById(box11_id_));
    document.getElementById("box11_").value = box11_id_
    document.getElementById("box11_id_").style.borderStyle = "solid";
    document.getElementById("box11_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag11_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box11_id_").style.borderStyle = "dotted";
    document.getElementById("box11_id_").style.borderColor = "black";
}


function drop12_(ev) {
    ev.preventDefault();
    box12_id_ = ev.dataTransfer.getData("text");
    console.log(box12_id_)
    ev.target.appendChild(document.getElementById(box12_id_));
    document.getElementById("box12_").value = box12_id_
    document.getElementById("box12_id_").style.borderStyle = "solid";
    document.getElementById("box12_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag12_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box12_id_").style.borderStyle = "dotted";
    document.getElementById("box12_id_").style.borderColor = "black";
}


function drop13_(ev) {
    ev.preventDefault();
    box13_id_ = ev.dataTransfer.getData("text");
    console.log(box13_id_)
    ev.target.appendChild(document.getElementById(box13_id_));
    document.getElementById("box13_").value = box13_id_
    document.getElementById("box13_id_").style.borderStyle = "solid";
    document.getElementById("box13_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag13_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box13_id_").style.borderStyle = "dotted";
    document.getElementById("box13_id_").style.borderColor = "black";
}


function drop14_(ev) {
    ev.preventDefault();
    box14_id_ = ev.dataTransfer.getData("text");
    console.log(box14_id_)
    ev.target.appendChild(document.getElementById(box14_id_));
    document.getElementById("box14_").value = box14_id_
    document.getElementById("box14_id_").style.borderStyle = "solid";
    document.getElementById("box14_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag14_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box14_id_").style.borderStyle = "dotted";
    document.getElementById("box14_id_").style.borderColor = "black";
}

function drop15_(ev) {
    ev.preventDefault();
    box15_id_ = ev.dataTransfer.getData("text");
    console.log(box15_id_)
    ev.target.appendChild(document.getElementById(box15_id_));
    document.getElementById("box15_").value = box15_id_
    document.getElementById("box15_id_").style.borderStyle = "solid";
    document.getElementById("box15_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag15_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box15_id_").style.borderStyle = "dotted";
    document.getElementById("box15_id_").style.borderColor = "black";
}


function drop16_(ev) {
    ev.preventDefault();
    box16_id_ = ev.dataTransfer.getData("text");
    console.log(box16_id_)
    ev.target.appendChild(document.getElementById(box16_id_));
    document.getElementById("box16_").value = box16_id_
    document.getElementById("box16_id_").style.borderStyle = "solid";
    document.getElementById("box16_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag16_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box16_id_").style.borderStyle = "dotted";
    document.getElementById("box16_id_").style.borderColor = "black";
}


function drop17_(ev) {
    ev.preventDefault();
    box17_id_ = ev.dataTransfer.getData("text");
    console.log(box17_id_)
    ev.target.appendChild(document.getElementById(box17_id_));
    document.getElementById("box17_").value = box7_id_
    document.getElementById("box17_id_").style.borderStyle = "solid";
    document.getElementById("box17_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag17_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box17_id_").style.borderStyle = "dotted";
    document.getElementById("box17_id_").style.borderColor = "black";
}

function drop18_(ev) {
    ev.preventDefault();
    box18_id_ = ev.dataTransfer.getData("text");
    console.log(box18_id_)
    ev.target.appendChild(document.getElementById(box18_id_));
    document.getElementById("box18_").value = box18_id_
    document.getElementById("box18_id_").style.borderStyle = "solid";
    document.getElementById("box18_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag18_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box18_id_").style.borderStyle = "dotted";
    document.getElementById("box18_id_").style.borderColor = "black";
}


function drop19_(ev) {
    ev.preventDefault();
    box19_id_ = ev.dataTransfer.getData("text");
    console.log(box19_id_)
    ev.target.appendChild(document.getElementById(box19_id_));
    document.getElementById("box19_").value = box19_id_
    document.getElementById("box19_id_").style.borderStyle = "solid";
    document.getElementById("box19_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag19_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box19_id_").style.borderStyle = "dotted";
    document.getElementById("box19_id_").style.borderColor = "black";
}


function drop20_(ev) {
    ev.preventDefault();
    box20_id_ = ev.dataTransfer.getData("text");
    console.log(box20_id_)
    ev.target.appendChild(document.getElementById(box20_id_));
    document.getElementById("box20_").value = box20_id_
    document.getElementById("box20_id_").style.borderStyle = "solid";
    document.getElementById("box20_id_").style.borderColor = "red";
    // var element_exist = document.getElementById("order_status_field_message");
    // if (element_exist) {
    //     document.getElementById("order_status_field_message").remove()
    // }
}


function drag20_(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box20_id_").style.borderStyle = "dotted";
    document.getElementById("box20_id_").style.borderColor = "black";
}


function reset1() {
    var container = document.getElementById("table_reset");
    container.innerHTML = html;
}


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


function done_() {




    var x = document.getElementById("select_parameters");
    x.style.display = "block";
    document.getElementById("heading53").classList.add("collapsed")
    document.getElementById("accordion53").classList.remove("show")


    var box0_title_ = document.getElementById("box0_").value;
    var box1_title_ = document.getElementById("box1_").value;
    var box2_title_ = document.getElementById("box2_").value;
    var box3_title_ = document.getElementById("box3_").value;
    var box4_title_ = document.getElementById("box4_").value;
    var box5_title_ = document.getElementById("box5_").value;
    var box6_title_ = document.getElementById("box6_").value;
    var box7_title_ = document.getElementById("box7_").value;


    var box8_title_ = document.getElementById("box8_").value;
    var box9_title_ = document.getElementById("box9_").value;
    var box10_title_ = document.getElementById("box10_").value;
    var box11_title_ = document.getElementById("box11_").value;
    var box12_title_ = document.getElementById("box12_").value;
    var box13_title_ = document.getElementById("box13_").value;
    var box14_title_ = document.getElementById("box14_").value;
    var box15_title_ = document.getElementById("box15_").value;
    var box16_title_ = document.getElementById("box16_").value;
    var box17_title_ = document.getElementById("box17_").value;
    var box18_title_ = document.getElementById("box18_").value;
    var box19_title_ = document.getElementById("box19_").value;
    var box20_title_ = document.getElementById("box20_").value;


    //var box9_title = document.getElementById("box1").value;
    console.log(box1_title_)

    var str_ = ''
    var data_string_ = str_.concat(box0_title_.toString() + ':' + box0_id_.toString(), ',', box1_title_.toString() + ':' + box1_id_.toString(), ',', box2_title_.toString() + ':' + box2_id_.toString(), ',', box3_title_.toString() + ':' + box3_id_.toString(), ',', box4_title_.toString() + ':' + box4_id_.toString(), ',', box5_title_.toString() + ':' + box5_id_.toString(), ',', box6_title_.toString() + ':' + box6_id_.toString(), ',', box7_title_.toString() + ':' + box7_id_.toString(), ',', box8_title_.toString() + ':' + box8_id_.toString(), ',', box9_title_.toString() + ':' + box9_id_.toString(), ',', box10_title_.toString() + ':' + box10_id_.toString(), ',', box11_title_.toString() + ':' + box11_id_.toString(), ',', box12_title_.toString() + ':' + box12_id_.toString(), ',', box13_title_.toString() + ':' + box13_id_.toString(), ',', box14_title_.toString() + ':' + box14_id_.toString(), ',', box15_title_.toString() + ':' + box15_id_.toString(), ',', box16_title_.toString() + ':' + box16_id_.toString(), ',', box17_title_.toString() + ':' + box17_id_.toString(), ',', box18_title_.toString() + ':' + box18_id_.toString(), ',', box19_title_.toString() + ':' + box19_id_.toString(), ',', box20_title_.toString() + ':' + box20_id_.toString())
    console.log(data_string_)
    $.ajax({
        type: 'POST',
        url: 'create_dataset',
        data: {
            user_file_column_structure: data_string_,
            csrfmiddlewaretoken: getCookie('csrftoken'),

        },

        success: function (data) {
            x.style.display = "none";
            document.getElementById("heading56").click()
            document.getElementById("heading56").classList.remove("collapsed")
            document.getElementById("accordion56").classList.add("show")


        }
    })


}


