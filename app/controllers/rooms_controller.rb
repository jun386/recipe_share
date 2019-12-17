class RoomsController < ApplicationController
  before_action :authenticate_user!, :only => [:create, :show, :index, :related]


  def related
    @users = User.where(id: current_user.followings & current_user.followers)
    @current_user_entries = Entry.where(user_id: current_user.id)
    @entries = []
    @user_is_rooms = {}
    @users.each do |user|
      @is_room = false
      @user_entries = Entry.where(user_id: user.id)
      @current_user_entries.each do |cu|
        @user_entries.each do |u|
          if cu.room_id == u.room_id then
            @is_room = true
            @user_is_rooms[user.id] = true
            @entries.push(u)
          end
        end
      end
      if @is_room == false
        @user_is_rooms[user.id] = false
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
    # flash[:notice] = "チャットを作成しました！"
  end

  def show
    @room = Room.find_by(id: params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_to :back
      flash[:alert] = "無効なユーザー"
    end
    @current_entries = current_user.entries
    @another_entries = Entry.where(room_id: @room.id).where('user_id != ?', current_user.id)
  end

  def index
    @current_entries = current_user.entries
    my_room_ids = []
    @current_entries.each do |entry|
      my_room_ids << entry.room.id
    end
    @another_entries = Entry.where(room_id: my_room_ids).where('user_id != ?', current_user.id)
  end

end
