class UsersController < ApplicationController
  
  # before_action :authenticate_user!, only: [:index] 
  
  def show
    @user = User.find_by(id: params[:id])
    @posts = Recipe.where(user_id: @user.id)
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def index
    @users = User.all
  end
  
  def following
    @user = User.find_by(id: params[:id])
    @users = @user.followings
    # @user1 = current_user.followings & current_user.followers
    # @currentUserEntry=Entry.where(user_id: current_user.id)
    # @userEntry=Entry.where(user_id: @user.id)
    # if @user.id == current_user.id
    # else
    #   @currentUserEntry.each do |cu|
    #     @userEntry.each do |u|
    #       if cu.room_id == u.room_id then
    #         @isRoom = true
    #         @roomId = cu.room_id
    #       end
    #     end
    #   end
    #   if @isRoom
    #   else
    #     @room = Room.new
    #     @entry = Entry.new
    #   end
    # end
    render 'show_follow'
  end

  def followers
    @user  = User.find_by(id: params[:id])
    @users = @user.followers
    render 'show_follower'
  end
  
  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end
  
end
