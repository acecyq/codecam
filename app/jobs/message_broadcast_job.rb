class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message) #message content plus stuff from message table
    @room = "room_#{message.room.id}"
    ActionCable.server.broadcast @room, {message: render_message(message)}
  end
    
  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end