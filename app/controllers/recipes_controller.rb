class RecipesController < ApplicationController
    before_action :authenticate_user!, {only: [:index, :show, :edit, :update]}
    before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
    
    def index
        @recipes = Recipe.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
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
         @comments = @recipe.comments.order(created_at: :desc)
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
        if @recipe.update(params.require(:recipe).permit(:name, :materials, :method, :tag_list, :user_id, :genre, :image).merge(user_id: @recipe.user_id))
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
    
    def recipe_search
        @recipes = Recipe.search(params[:search]).order(created_at: :desc)
    end
    
    def genre_search
    end
    
    def vegetable
        @recipes = Recipe.where(genre: "1").paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    end
    
    def meat
        @recipes = Recipe.where(genre: "2").paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    end
    
    def fish
        @recipes = Recipe.where(genre: "3").paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    end
    
    def rice
        @recipes = Recipe.where(genre: "4").paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    end
    
    def pasta_gratin
        @recipes = Recipe.where(genre: "5").paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    end
    
    def noodles
        @recipes = Recipe.where(genre: "6").paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    end
    
    def soup
        @recipes = Recipe.where(genre: "7").paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    end
    
    def salad
        @recipes = Recipe.where(genre: "8").paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    end
    
    def powder
        @recipes = Recipe.where(genre: "9").paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    end
    
    def other
        @recipes = Recipe.where(genre: "10").paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    end
    
    private
        def recipe_params
            params.require(:recipe).permit(:name, :materials, :method, :tag_list, :user_id, :genre, :image).merge(user_id: current_user.id)
        end
        
        def ensure_correct_user
            @recipe = Recipe.find_by(id: params[:id])
            if (@recipe.user_id == current_user.id || current_user.admin == true)
            else
              flash[:notice] = "権限がありません"
              redirect_to("/recipes")
            end
        end
    
    
end
