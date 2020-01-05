class RecipesController < ApplicationController
    before_action :authenticate_user!, {only: [:index, :show, :edit, :update]}
    before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
    
    def index
        @recipes = Recipe.all.order(created_at: :desc)
        if params[:tag_name]
          @recipes = @recipes.tagged_with("#{params[:tag_name]}")
        end
    end
    
    def show
        @recipe = Recipe.find_by(id: params[:id])
        @comment = Comment.new
        # @comment = @recipe.comments.build
        # @comments = @recipe.comments
        
        if @recipe
         @user = @recipe.user
         @likes_count = Like.where(recipe_id: @recipe.id).count
         @comments = @recipe.comments
        end
        
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def create
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
        @recipe = Recipe.find_by(id: params[:id])
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe.id)
        else
            flash[:alert] = "レシピが編集できませんでした"
            render('recipes/#{@recipe.id}')
        end
    end
    
    def destroy
        @recipe = Recipe.find_by(id: params[:id])
        @recipe.destroy
        flash[:notice] = "投稿を削除しました"
        redirect_to("/recipes")
    end
    
    def ensure_correct_user
        @recipe = Recipe.find_by(id: params[:id])
        if @recipe.user_id != current_user.id
          flash[:notice] = "権限がありません"
          redirect_to("/recipes")
        end
    end
    
    def recipe_search
        @recipes = Recipe.search(params[:search]).order(created_at: :desc)
    end
    
    def genre_search
    end
    
    def vegetable
        @recipes = Recipe.where(genre: "1")
    end
    
    def meat
        @recipes = Recipe.where(genre: "2")
    end
    
    def fish
        @recipes = Recipe.where(genre: "3")
    end
    
    def rice
        @recipes = Recipe.where(genre: "4")
    end
    
    def pasta_gratin
        @recipes = Recipe.where(genre: "5")
    end
    
    def noodles
        @recipes = Recipe.where(genre: "6")
    end
    
    def soup
        @recipes = Recipe.where(genre: "7")
    end
    
    def salad
        @recipes = Recipe.where(genre: "8")
    end
    
    def powder
        @recipes = Recipe.where(genre: "9")
    end
    
    private
        def recipe_params
            params.require(:recipe).permit(:name, :materials, :method, :tag_list, :user_id, :genre, :image).merge(user_id: current_user.id)
        end
    
end
