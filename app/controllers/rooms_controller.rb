class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    room = return_room(params[:id])

    if room 
      redirect_to room_specific_path(room)
    else
      @room = Room.new

      @room.user1 = User.find(params[:id])
      @room.user2 = current_user

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
    user = User.find(user_id)
    rooms = Room.where(user1: user)

    Room.where(user2: user).each do |r|
      rooms << r
    end

    check = false

    rooms.each do |r|
      if r.user1 == current_user || r.user2 == current_user
        # redirect_to room_specific_path(r)
        check = r
      end
    end

    return check
  end
end
