roomUrl = `window.location.href.split('/')`
room_id = `roomUrl[roomUrl.length - 1]`
user_id = `document.getElementById('cool').innerText`

App.room = App.cable.subscriptions.create { channel: "RoomsChannel", room_id: room_id },
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log 'connected on client side'

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # `alert(data['messager'])`
    $('#messages').append data['message']

  speak: (obj) ->
    # @perform 'speak', message: obj.message + '/' + obj.sender_id + '/' + obj.room_id
    @perform 'speak', message: obj.message, sender_id: obj.sender_id, room_id: obj.room_id

    # console.log 'XXXXXXXXXXHELLOOOOOOXXXX'
    # console.log @user
    # console.log @room
    # console.log @message


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    # event.preventDefault()
    obj = {
      message: event.target.value,
      sender_id: user_id,
      room_id: room_id
    }
    # console.log(obj)
    # console.log event.target.value
    App.room.speak obj
    event.target.value = ''
    event.preventDefault()
