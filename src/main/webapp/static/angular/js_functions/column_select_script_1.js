

var box0_id = 0;
var box1_id = 0;
var box2_id = 0;
var box3_id = 0;
var box4_id = 0;
var box5_id = 0;
var box6_id = 0;
var box7_id = 0;



var box8_id = 0;
var box9_id = 0;
var box10_id = 0;
var box11_id = 0;
var box12_id = 0;
var box13_id = 0;
var box14_id = 0;
var box15_id = 0;

var box16_id = 0;
var box17_id = 0;
var box18_id = 0;
var box19_id = 0;
var box20_id = 0;

function allowDrop(ev) {
    ev.preventDefault();
}

function drop(ev) {
    ev.preventDefault();
    var id = ev.dataTransfer.getData("text");
    console.log(box0_id)
    ev.target.appendChild(document.getElementById(id));
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop0(ev) {
    ev.preventDefault();
    box0_id = ev.dataTransfer.getData("text");
    console.log(box0_id)
    ev.target.appendChild(document.getElementById(box0_id));
    document.getElementById("box0").value = box0_id
    document.getElementById("box0_id").style.borderStyle = "solid";
    document.getElementById("box0_id").style.borderColor = "red";
    var element_exist = document.getElementById("customer_id_message");
    if (element_exist) {
        document.getElementById("customer_id_message").remove()
    }


}

function drag0(ev) {
    //   ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box0_id").style.borderStyle = "dotted";
    document.getElementById("box0_id").style.borderColor = "black";
}

function drop1(ev) {
    ev.preventDefault();
    box1_id = ev.dataTransfer.getData("text");
    console.log(box1_id)
    ev.target.appendChild(document.getElementById(box1_id));
    document.getElementById("box1").value = box1_id
    document.getElementById("box1_id").style.borderStyle = "solid";
    document.getElementById("box1_id").style.borderColor = "red";
    var element_exist = document.getElementById("date_field_message");
    if (element_exist) {
        document.getElementById("date_field_message").remove()
    }
}

function drag1(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box1_id").style.borderStyle = "dotted";
    document.getElementById("box1_id").style.borderColor = "black";
}


function drop2(ev) {
    ev.preventDefault();
    box2_id = ev.dataTransfer.getData("text");
    console.log(box2_id)
    ev.target.appendChild(document.getElementById(box2_id));
    document.getElementById("box2").value = box2_id
    document.getElementById("box2_id").style.borderStyle = "solid";
    document.getElementById("box2_id").style.borderColor = "red";

    var element_exist = document.getElementById("quantity_field_message");
    if (element_exist) {
        document.getElementById("quantity_field_message").remove()
    }
}

function drag2(ev) {
    //   ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box2_id").style.borderStyle = "dotted";
    document.getElementById("box2_id").style.borderColor = "black";
}


function drop3(ev) {
    ev.preventDefault();
    box3_id = ev.dataTransfer.getData("text");
    console.log(box3_id)
    ev.target.appendChild(document.getElementById(box3_id));
    document.getElementById("box3").value = box3_id
    document.getElementById("box3_id").style.borderStyle = "solid";
    document.getElementById("box3_id").style.borderColor = "red";
    var element_exist = document.getElementById("item_name_field_message");
    if (element_exist) {
        document.getElementById("item_name_field_message").remove()
    }
}

function drag3(ev) {
    //    ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box3_id").style.borderStyle = "dotted";
    document.getElementById("box3_id").style.borderColor = "black";
}


function drop4(ev) {
    ev.preventDefault();
    box4_id = ev.dataTransfer.getData("text");
    console.log(box4_id)
    ev.target.appendChild(document.getElementById(box4_id));
    document.getElementById("box4").value = box4_id
    document.getElementById("box4_id").style.borderStyle = "solid";
    document.getElementById("box4_id").style.borderColor = "red";
    var element_exist = document.getElementById("category_field_message");
    if (element_exist) {
        document.getElementById("category_field_message").remove()
    }
}


function drag4(ev) {
    //   ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box4_id").style.borderStyle = "dotted";
    document.getElementById("box4_id").style.borderColor = "black";
}


function drop5(ev) {
    ev.preventDefault();
    box5_id = ev.dataTransfer.getData("text");
    console.log(box5_id)
    ev.target.appendChild(document.getElementById(box5_id));
    document.getElementById("box5").value = box5_id
    document.getElementById("box5_id").style.borderStyle = "solid";
    document.getElementById("box5_id").style.borderColor = "red";
    var element_exist = document.getElementById("unit_price_field_message");
    if (element_exist) {
        document.getElementById("unit_price_field_message").remove()
    }
}

function drag5(ev) {
    // ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box5_id").style.borderStyle = "dotted";
    document.getElementById("box5_id").style.borderColor = "black";
}


function drop6(ev) {
    ev.preventDefault();
    box6_id = ev.dataTransfer.getData("text");
    console.log(box6_id)
    ev.target.appendChild(document.getElementById(box6_id));
    document.getElementById("box6").value = box6_id
    document.getElementById("box6_id").style.borderStyle = "solid";
    document.getElementById("box6_id").style.borderColor = "red";
    var element_exist = document.getElementById("purchased_price_field_message");
    if (element_exist) {
        document.getElementById("purchased_price_field_message").remove()
    }
}

function drag6(ev) {
    // ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box6_id").style.borderStyle = "dotted";
    document.getElementById("box6_id").style.borderColor = "black";
}


function drop7(ev) {
    ev.preventDefault();
    box7_id = ev.dataTransfer.getData("text");
    console.log(box7_id)
    ev.target.appendChild(document.getElementById(box7_id));
    document.getElementById("box7").value = box7_id
    document.getElementById("box7_id").style.borderStyle = "solid";
    document.getElementById("box7_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag7(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box7_id").style.borderStyle = "dotted";
    document.getElementById("box7_id").style.borderColor = "black";
}



function drop8(ev) {
    ev.preventDefault();
    box8_id = ev.dataTransfer.getData("text");
    console.log(box8_id)
    ev.target.appendChild(document.getElementById(box8_id));
    document.getElementById("box8").value = box8_id
    document.getElementById("box8_id").style.borderStyle = "solid";
    document.getElementById("box8_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag8(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box8_id").style.borderStyle = "dotted";
    document.getElementById("box8_id").style.borderColor = "black";
}



function drop9(ev) {
    ev.preventDefault();
    box9_id = ev.dataTransfer.getData("text");
    console.log(box9_id)
    ev.target.appendChild(document.getElementById(box9_id));
    document.getElementById("box9").value = box9_id
    document.getElementById("box9_id").style.borderStyle = "solid";
    document.getElementById("box9_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag9(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box9_id").style.borderStyle = "dotted";
    document.getElementById("box9_id").style.borderColor = "black";
}


function drop10(ev) {
    ev.preventDefault();
    box10_id = ev.dataTransfer.getData("text");
    console.log(box10_id)
    ev.target.appendChild(document.getElementById(box10_id));
    document.getElementById("box10").value = box10_id
    document.getElementById("box10_id").style.borderStyle = "solid";
    document.getElementById("box10_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag10(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box10_id").style.borderStyle = "dotted";
    document.getElementById("box10_id").style.borderColor = "black";
}

function drop11(ev) {
    ev.preventDefault();
    box11_id = ev.dataTransfer.getData("text");
    console.log(box11_id)
    ev.target.appendChild(document.getElementById(box11_id));
    document.getElementById("box11").value = box11_id
    document.getElementById("box11_id").style.borderStyle = "solid";
    document.getElementById("box11_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag11(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box11_id").style.borderStyle = "dotted";
    document.getElementById("box11_id").style.borderColor = "black";
}


function drop12(ev) {
    ev.preventDefault();
    box12_id = ev.dataTransfer.getData("text");
    console.log(box12_id)
    ev.target.appendChild(document.getElementById(box12_id));
    document.getElementById("box12").value = box12_id
    document.getElementById("box12_id").style.borderStyle = "solid";
    document.getElementById("box12_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag12(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box12_id").style.borderStyle = "dotted";
    document.getElementById("box12_id").style.borderColor = "black";
}


function drop13(ev) {
    ev.preventDefault();
    box13_id = ev.dataTransfer.getData("text");
    console.log(box13_id)
    ev.target.appendChild(document.getElementById(box13_id));
    document.getElementById("box13").value = box13_id
    document.getElementById("box13_id").style.borderStyle = "solid";
    document.getElementById("box13_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag13(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box13_id").style.borderStyle = "dotted";
    document.getElementById("box13_id").style.borderColor = "black";
}


function drop14(ev) {
    ev.preventDefault();
    box14_id = ev.dataTransfer.getData("text");
    console.log(box14_id)
    ev.target.appendChild(document.getElementById(box14_id));
    document.getElementById("box14").value = box14_id
    document.getElementById("box14_id").style.borderStyle = "solid";
    document.getElementById("box14_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag14(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box14_id").style.borderStyle = "dotted";
    document.getElementById("box14_id").style.borderColor = "black";
}

function drop15(ev) {
    ev.preventDefault();
    box15_id = ev.dataTransfer.getData("text");
    console.log(box15_id)
    ev.target.appendChild(document.getElementById(box15_id));
    document.getElementById("box15").value = box15_id
    document.getElementById("box15_id").style.borderStyle = "solid";
    document.getElementById("box15_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag15(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box15_id").style.borderStyle = "dotted";
    document.getElementById("box15_id").style.borderColor = "black";
}



function drop16(ev) {
    ev.preventDefault();
    box16_id = ev.dataTransfer.getData("text");
    console.log(box16_id)
    ev.target.appendChild(document.getElementById(box16_id));
    document.getElementById("box16").value = box16_id
    document.getElementById("box16_id").style.borderStyle = "solid";
    document.getElementById("box16_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag16(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box16_id").style.borderStyle = "dotted";
    document.getElementById("box16_id").style.borderColor = "black";
}


function drop17(ev) {
    ev.preventDefault();
    box17_id = ev.dataTransfer.getData("text");
    console.log(box17_id)
    ev.target.appendChild(document.getElementById(box17_id));
    document.getElementById("box17").value = box7_id
    document.getElementById("box17_id").style.borderStyle = "solid";
    document.getElementById("box17_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag17(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box17_id").style.borderStyle = "dotted";
    document.getElementById("box17_id").style.borderColor = "black";
}

function drop18(ev) {
    ev.preventDefault();
    box18_id = ev.dataTransfer.getData("text");
    console.log(box18_id)
    ev.target.appendChild(document.getElementById(box18_id));
    document.getElementById("box18").value = box18_id
    document.getElementById("box18_id").style.borderStyle = "solid";
    document.getElementById("box18_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag18(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box18_id").style.borderStyle = "dotted";
    document.getElementById("box18_id").style.borderColor = "black";
}


function drop19(ev) {
    ev.preventDefault();
    box19_id = ev.dataTransfer.getData("text");
    console.log(box19_id)
    ev.target.appendChild(document.getElementById(box19_id));
    document.getElementById("box19").value = box19_id
    document.getElementById("box19_id").style.borderStyle = "solid";
    document.getElementById("box19_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag19(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box19_id").style.borderStyle = "dotted";
    document.getElementById("box19_id").style.borderColor = "black";
}


function drop20(ev) {
    ev.preventDefault();
    box20_id = ev.dataTransfer.getData("text");
    console.log(box20_id)
    ev.target.appendChild(document.getElementById(box20_id));
    document.getElementById("box20").value = box20_id
    document.getElementById("box20_id").style.borderStyle = "solid";
    document.getElementById("box20_id").style.borderColor = "red";
    var element_exist = document.getElementById("order_status_field_message");
    if (element_exist) {
        document.getElementById("order_status_field_message").remove()
    }
}


function drag20(ev) {
    //  ev.dataTransfer.setData("text", ev.target.id);
    //  document.getElementById("customer_id_message").innerHTML = "Hello World!";
    document.getElementById("box20_id").style.borderStyle = "dotted";
    document.getElementById("box20_id").style.borderColor = "black";
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

function done() {
    var x = document.getElementById("select_parameters");
    x.style.display = "block";
    document.getElementById("heading53").classList.add("collapsed")
    document.getElementById("accordion53").classList.remove("show")

    //x.removeClass("collapsed")
    //  document.getElementById("heading53").className = document.getElementById("heading53").className.replace(/\bshow\b/g, "");
    // document.getElementById("accordion53").className = document.getElementById("heading53").className.add("collapsed")

    // document.getElementById("heading53").className = element.className.replace(/\bmystyle\b/g, "");
    // document.getElementById("accordion53").className = element.className.replace(/\bmystyle\b/g, "");
    var box0_title = document.getElementById("box0").value;
    var box1_title = document.getElementById("box1").value;
    var box2_title = document.getElementById("box2").value;
    var box3_title = document.getElementById("box3").value;
    var box4_title = document.getElementById("box4").value;
    var box5_title = document.getElementById("box5").value;
    var box6_title = document.getElementById("box6").value;
    var box7_title = document.getElementById("box7").value;



    var box8_title = document.getElementById("box8").value;
    var box9_title = document.getElementById("box9").value;
    var box10_title = document.getElementById("box10").value;
    var box11_title = document.getElementById("box11").value;
    var box12_title = document.getElementById("box12").value;
    var box13_title = document.getElementById("box13").value;
    var box14_title = document.getElementById("box14").value;
    var box15_title = document.getElementById("box15").value;
    var box16_title = document.getElementById("box16").value;
    var box17_title = document.getElementById("box17").value;
    var box18_title = document.getElementById("box18").value;
    var box19_title = document.getElementById("box19").value;
    var box20_title = document.getElementById("box20").value;


    //var box9_title = document.getElementById("box1").value;
    console.log(box1_title)

    var str = ''
    var data_string = str.concat(box0_title.toString() + ':' + box0_id.toString(), ',', box1_title.toString() + ':' + box1_id.toString(), ',', box2_title.toString() + ':' + box2_id.toString(), ',', box3_title.toString() + ':' + box3_id.toString(), ',', box4_title.toString() + ':' + box4_id.toString(), ',', box5_title.toString() + ':' + box5_id.toString(), ',', box6_title.toString() + ':' + box6_id.toString(), ',', box7_title.toString() + ':' + box7_id.toString(),',', box8_title.toString() + ':' + box8_id.toString(),',', box9_title.toString() + ':' + box9_id.toString(),',', box10_title.toString() + ':' + box10_id.toString(),',', box11_title.toString() + ':' + box11_id.toString(),',', box12_title.toString() + ':' + box12_id.toString(),',', box13_title.toString() + ':' + box13_id.toString(),',', box14_title.toString() + ':' + box14_id.toString(),',', box15_title.toString() + ':' + box15_id.toString(),',', box16_title.toString() + ':' + box16_id.toString(),',', box17_title.toString() + ':' + box17_id.toString(),',', box18_title.toString() + ':' + box18_id.toString(),',', box19_title.toString() + ':' + box19_id.toString(),',', box20_title.toString() + ':' + box20_id.toString())
    console.log(data_string)
    $.ajax({
        type: 'POST',
        url: 'create_dataset',
        data: {
            user_file_column_structure: data_string,
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


