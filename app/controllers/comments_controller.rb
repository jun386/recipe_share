class CommentsController < ApplicationController
    def create
        @recipe = Recipe.find_by(id: params[:recipe_id])
        @comment = @recipe.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            flash[:notice] = "コメントしました"
            redirect_to　recipe_path(@recipe.id)
        else
            flash[:alert] = "コメントできません"
            render recipe_path(@recipe.id)
        end
    end
    
    def destroy
        @comment = Comment.find_by(id: params[:id])
        if @comment.destroy
            flash[:notice] = "コメントを削除しました"
            redirect_to recipe_path(@recipe.id)
        end
    end
    
    private
        def comment_params
            params.require(:comment).permit(:comment_content, :recipe_id, :user_id)
        end
end
