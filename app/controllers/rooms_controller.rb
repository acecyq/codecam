class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.new
    @room.save

    redirect_to room_specific_path(@room)
  end

  def show
    @messages = Message.all
    @room = Room.find(params[:id])
  end
end
