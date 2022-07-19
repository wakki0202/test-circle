class TalksController < ApplicationController
  def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    # pluck
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)
    
    unless user_rooms.nil?
      @room = user_rooms.room
    else
      @room = Room.new
      @room.save
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    end
    @talks = @room.talks
    @talk = Talk.new(room_id: @room.id)
  end
  def create
    @talk = current_user.talks.new(talk_params)
    @talk.save
    redirect_to request.referer 
    # referer??
  end

  private
  def talk_params
    params.require(:talk).permit(:message, :room_id)
  end
end
