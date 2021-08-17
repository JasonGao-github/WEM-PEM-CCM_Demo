$('document').ready(function () {
    chat__expand = setInterval(LuChatBtnExpand, 10000);

    function LuChatBtnExpand() {
        $('.LuChatBtn').toggleClass('expanded')
        $('.LuChatBtn__helper').toggleClass('active')
    }
})

function resetInterval() {
    clearInterval(chat__expand);

    chat__expand = setInterval(LuChatBtnExpand, 10000);

    function LuChatBtnExpand() {
        $('.LuChatBtn').toggleClass('expanded')
        $('.LuChatBtn__helper').toggleClass('active')
    }
}

var count = 0

function openChat() {
    if ($('.LuChatBtn').hasClass('active')) {
        resetInterval();
    }
    $('.chatWindow').toggleClass('active')
    $('.LuChatBtn').toggleClass('active')
    if (count == 0) {
        $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">Hello! I\'m your Virtual Assistant and I\'m here to help you make the most of my platform!</p></div>')
        $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">Now, how may I help you?</p></div>')
        count = 1;
    }
    $('.LuChatBtn').removeClass('expanded')

    $('.LuChatBtn__helper').removeClass('active')
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

function askQuestion(q) {
    $('.chatWindow__question').val('')
    console.log(q);
    console.log($('.chatWindow__question').val(''));
    $('.chatWindow__chat').append('<div class="chat__question"><p class="chat__question__text">' + q + '</p></div>')

    $('.chatWindow__chat').append('<div class="chating"><div class="dot dot--1"></div><div class="dot dot--2"></div><div class="dot dot--3"></div></div>')
    $(".chatWindow__chat").scrollTop(function () {
        return this.scrollHeight;
    });


    var str = ''
    var data_str = str.concat('user_input_text' + ':' + q.toString())
    $.ajax({
        type: "POST",
        url: 'rasa_send',
        data: {
            data: data_str,
            csrfmiddlewaretoken: getCookie('csrftoken'),

        },
        success: async function (data) {

            console.log(data.toString());

            var responseData = JSON.parse(data);
            var chatText = responseData.text;
            var chatImage = responseData.image;

            console.log(chatText);
            console.log(chatImage);

            for (var i = 0; i < chatImage.length; i++) {
                $('.chating').remove();
                try {
                    $('.chatWindow__chat').append('<div class="chat__response"><p class="chat__response__text">' + chatText[i].toString() + '</p></div>')
                    if(chatText[i].toString() === 'This is your current stock evaluation , '){
                        $('.chatWindow__chat').append('<div class="chat__response"> <iframe id="eia_widget" style="width:100%;height:300px;border:0" src="https://www.eia.gov/opendata/embed/iframe.php?series_id=PET.WCESTP11.W;PET.WCESTP21.W;PET.WCESTP41.W;PET.WCESTP31.W;PET.WCESTP51.W&periods=10A"></iframe></div>')
                     } else if (chatText[i].toString() === 'Here is the oil price chart for the past week. It seems that prices have been trending down')
                    {
                        $('.chatWindow__chat').append('<div class="chat__response">  <iframe id="eia_widget" style="width:100%;height:300px;border:0" src="//www.eia.gov/opendata/embed/iframe.php?series_id=PET.RWTC.D;PET.RBRTE.D&periods=24M"></iframe></div>')
                    } else if (chatText[i].toString() === 'Good question. Let\'s have a look at next week’s price forecast first: , ')
                    {
                        $('.chatWindow__chat').append('<div class="chat__response"> <iframe style="width:100%;height:100%;border:0" src="https://d3fy651gv2fhd3.cloudfront.net/charts/commodity-crude-oil.png?s=cl1&v=202005120719V20191105&d1=20190912&d2=20200512&forecast=te"></iframe></div>')
                    }
                } catch (e) {
                    console.log("chat error. " + e)
                }
                if (chatImage[i] != null) {
                    // $('.chatWindow__chat').append('<div class="chat__response"> <img src= ' + chatImage[i].toString() + ' alt="Graph" style="max-width: 300px; max-height: 300px"> </div>')
                } else {
                    console.log("no image")
                }
                $(".chatWindow__chat").scrollTop(function () {
                    return this.scrollHeight;
                });
                await new Promise(r => setTimeout(r, 2000));
            }


        },
        error: function (message, error, type) {
            console.log(error + " " + type);
//output a 'refresh your browser' msg to user

        }
    });
}
