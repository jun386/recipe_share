class RecipesController < ApplicationController
    before_action :authenticate_user!, {only: [:index, :show, :edit, :update]}
    before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
    
    def index
        @recipes = Recipe.all.order(created_at: :desc)
    end
    
    def show
        @recipe = Recipe.find_by(id: params[:id])
        @comment = Comment.new
        #@comment = @recipe.comments.build
        #@comments = @recipe.comments
        
        if @recipe
         @user = @recipe.user
         @likes_count = Like.where(recipe_id: @recipe.id).count
        end
        
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def create
        logger.debug("=================== tag_list = #{params[:recipe][:tag_list]}")
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            flash[:notice] = "新しいレシピが作成されました"
            redirect_to recipe_path(@recipe.id)
        else
            flash[:alert] = "レシピが作成できませんでした"
            render('recipes/new')
        end
    end
    
    def edit
        @recipe = Recipe.find_by(id: params[:id])
    end
    
    def update
    end
    
    def destroy
        @recipe = Recipe.find_by(id: params[:id])
        @recipe.destroy
        flash[:notice] = "投稿を削除しました"
        redirect_to("/recipes/index")
    end
    
    def ensure_correct_user
        @recipe = Recipe.find_by(id: params[:id])
        if @recipe.user_id != @current_user.id
          flash[:notice] = "権限がありません"
          redirect_to("/recipes/index")
        end
    end
    
    private
        def recipe_params
            params.require(:recipe).permit(:name, :method, :tag_list, :user_id, :genre, {images: []}).merge(user_id: current_user.id)
        end
    
end
