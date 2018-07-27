class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    if return_room(params[:id])

      redirect_to room_specific_path(Room.find)
    else
      @room = Room.new
      @room.save

      redirect_to room_specific_path(@room)
    end
  end

  def show
    if Room.find(params[:id])
      @room = Room.find(params[:id])
    else
      redirect_to rooms_path()

    end

    # @messages = Message.where()
  end

  def distribute(user1, user2)
    puts 'distribute'
    puts user1
    puts user2
  end

  private
  def return_room(user_id)
    puts user_id
    user = User.find(user_id)
    byebug
  end
end
