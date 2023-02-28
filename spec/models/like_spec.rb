require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "バリデーション" do
    it "user_idが空欄でないこと" do
      like = Like.new(recipe_id: 1).save
      expect(like).to eq(false)
    end

    it "recipe_idが空欄でないこと" do
      like = Like.new(user_id: 1).save
      expect(like).to eq(false)
    end

    it "有効な状態であること" do
      like = Like.new(user_id: 1, recipe_id: 1).save
      expect(like).to eq(true)
    end
  end

  describe 'アソシエーション' do
    it "Userモデルとの関連付け" do
      expect(Like.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it "Recipeモデルとの関連付け" do
      expect(Like.reflect_on_association(:recipe).macro).to eq :belongs_to
    end
  end
end
