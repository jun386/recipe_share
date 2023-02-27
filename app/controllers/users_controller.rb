class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [:index, :show, :following, :followers, :likes] 
  
  def show
    @user = User.find_by(id: params[:id])
    @recipes = Recipe.where(user_id: @user.id).order(created_at: :desc)
    currentUserEntry = Entry.where(user_id: current_user.id).pluck(:room_id)
    userEntry = Entry.where(user_id: @user.id).pluck(:room_id)
    currentUserRoomId = currentUserEntry & userEntry
    if currentUserRoomId.present?
      @roomId = currentUserRoomId[0]
      @isRoom = true
    else
      @room = Room.new
      @entry = Entry.new
    end
  end

  def index
    @users = User.where.not(id: current_user)
  end
  
  def following
    @user = User.find_by(id: params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find_by(id: params[:id])
    @users = @user.followers
    render 'show_follower'
  end
  
  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id).order(created_at: :desc)
    currentUserEntry = Entry.where(user_id: current_user.id).pluck(:room_id)
    userEntry = Entry.where(user_id: @user.id).pluck(:room_id)
    currentUserRoomId = currentUserEntry & userEntry
    if currentUserRoomId.present?
      @roomId = currentUserRoomId[0]
      @isRoom = true
    else
      @room = Room.new
      @entry = Entry.new
    end
  end
  
end
