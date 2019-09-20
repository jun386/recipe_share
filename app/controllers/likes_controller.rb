class LikesController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @like = Like.new(
            user_id: @current_user.id,
            recipe_id: params[:recipe_id]
            )
        @like.save
        @recipe = Recipe.find_by(id: @like.recipe_id)
        @like_count = Like.where(recipe_id: params[:recipe_id]).count
        redirect_to("/recipes/#{params[:recipe_id]}")
    end
    
    def destroy
        @like = Like.find_by(
            user_id: @current_user.id,
            recipe_id: params[:recipe_id]
            )
        @recipe = Recipe.find_by(id: @like.recipe_id)
        @like.destroy
        @like_count = Like.where(recipe_id: params[:recipe_id]).count
        redirect_to("/recipes/#{params[:recipe_id]}")
    end
end
