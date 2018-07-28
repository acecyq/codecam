class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    @room = "room_#{message.room.id}"
    ActionCable.server.broadcast @room, {message: render_message(message)}
    # ActionCable.server.broadcast "room_#{message.room.id}", {message: render_message(message)}
  end
    
  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end