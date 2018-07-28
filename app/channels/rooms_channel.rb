class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params[:room_id]}"
    puts 'channel subscribed'
    puts "room_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(content: data['message'], user: User.find(data['sender_id'].to_i), room: Room.find(data['room_id'].to_i))
  end
end
