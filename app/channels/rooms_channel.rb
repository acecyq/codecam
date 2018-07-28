class RoomsChannel < ApplicationCable::Channel
  def subscribed
    # room = Room.find(params[:id])
    # stream_for "room
    stream_from "room_#{params[:room_id]}"
    puts 'channel subscribed'
    puts "room_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  # Message.create(content: data['message'])
    Message.create!(content: data['message'], user: User.find(data['sender_id'].to_i), room: Room.find(data['room_id'].to_i))
   #puts "room_#{params[:room_id]}"
    #puts render_message(data['message'])
    #ActionCable.server.broadcast "room_#{params[:room_id]}", message: render_message(data['message'])
  end

  # def perform(message)
  #   ActionCable.server.broadcast "room_#{params[:room_id]}", message: render_message(message)
  #   puts 'message'
  #   puts message
  # end
    
  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
