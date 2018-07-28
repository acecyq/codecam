class RoomsChannel < ApplicationCable::Channel
  def subscribed
    # room = Room.find(params[:id])
    # stream_for "room
    stream_from "room_#{params[:room_id]}"
    puts 'channel subscribed'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  # Message.create(content: data['message'])
    Message.create! content: data['message'] user: data['sender_id'] room: data['room_id']
  end
end
