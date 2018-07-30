function refreshChat() { 
    var element = document.getElementById('chatbox');
    element.scrollTop = element.scrollHeight;
}

var element = document.getElementById('chatbox');
    element.scrollTop = element.scrollHeight;


    $("#chatText").on('keyup', function (e) {
        if (e.keyCode == 13) {
            refreshChat();
        }
    });