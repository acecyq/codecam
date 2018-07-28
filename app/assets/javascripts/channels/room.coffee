App.room = App.cable.subscriptions.create "RoomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    # alert data['message']
    $('#messages').append data['message']

  speak: (message) ->
    @perform 'speak', message: message, sender_id: @user , room_id: @room


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    # event.preventDefault()
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
