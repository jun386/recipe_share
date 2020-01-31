class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [:index, :show, :following, :followers, :likes] 
  
  def show
    @user = User.find_by(id: params[:id])
    @users = User.where(id: current_user.followings & current_user.followers)
    @following_check = false
    @users.each do |user|
      if user.id == @user.id
        @following_check = true
      end
    end
    @recipes = Recipe.where(user_id: @user.id).order(created_at: :desc)
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
    @users_related = User.where(id: current_user.followings & current_user.followers)
    @users_following = User.where(id: current_user.followings).where.not(id: current_user.followers)
    @users_followers = User.where(id: current_user.followers).where.not(id: current_user.followings)
    @users = User.where.not(id: current_user.followers).where.not(id: current_user.followings).where.not(id: current_user)
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
    @users = User.where(id: current_user.followings & current_user.followers)
    @following_check = false
    @users.each do |user|
      if user.id == @user.id
        @following_check = true
      end
    end
    @likes = Like.where(user_id: @user.id).order(created_at: :desc)
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
  
end
