class CommentsController < ApplicationController
    before_action :authenticate_user!, :only => [:create, :destroy]
    
    def create
        @recipe = Recipe.find_by(id: params[:recipe_id])
        @comment = Comment.new(recipe_id: @recipe.id, content: params[:content], user_id: params[:user_id])
        @comment.user_id = current_user.id
        if @comment.save
            flash[:notice] = "コメントしました"
            redirect_to :back
        else
            flash[:alert] = "コメントできません"
            redirect_to :back
        end
    end
    
    def destroy
        @comment = Comment.find_by(id: params[:id])
        if @comment.destroy
            flash[:notice] = "コメントを削除しました"
            redirect_to :back
        end
    end
    
    private
        def comment_params
            params.require(:comment).permit(:comment_content, :recipe_id, :user_id)
        end
end
