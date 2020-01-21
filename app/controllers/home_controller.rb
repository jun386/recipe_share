class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  before_action :authenticate_user!, only: [:new, :create]
  before_action :user_admin, only: [:new, :create]
  
  def top
    @home_image = Home.last
  end
  
  def new
    @home_image = Home.new
  end
  
  def create
    @home_image = Home.new(home_params)
    if @home_image.save
      flash[:notice] = "画像が変更されました"
      redirect_to "/"
    else
      flash[:alert] = "画像の変更ができませんでした"
      render('/')
    end
  end
  
  # def edit
    
  # end
  
  # def update
  # end
  
  private
  
    def home_params
      params.require(:home).permit(:image)
    end
    
    def user_admin
       @users = User.all
       if  current_user.admin == false
           redirect_to recipes_path
       end
    end
  
end
