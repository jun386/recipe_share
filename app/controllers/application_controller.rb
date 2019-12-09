class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def forbid_login_user
      if user_signed_in?
          flash[:notice] = "すでにログインしています"
          redirect_to("/recipes/index")
      end
  end
  
  # ログインした後にrecipe/indexに遷移させる
  def after_sign_in_path_for(resource)
    recipes_path
  end
  
  # ログアウトした後にroot_pathに遷移させる
  def after_sign_out_path_for(resource)
    root_path
  end
  
  # def self.search(search)
  #     return Recipe.all unless search
  #     Recipe.where(['content LIKE ?', "%#{search}%"])
  # end
    
end
