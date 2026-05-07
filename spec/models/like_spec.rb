require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "バリデーション" do
    let(:user) { FactoryBot.create(:user) }
    let(:recipe) { FactoryBot.create(:recipe) }

    it "user_idが空欄でないこと" do
      like = Like.new(recipe: recipe)
      expect(like).not_to be_valid
    end

    it "recipe_idが空欄でないこと" do
      like = Like.new(user: user)
      expect(like).not_to be_valid
    end

    it "有効な状態であること" do
      like = FactoryBot.build(:like, user: user, recipe: recipe)
      expect(like).to be_valid
      expect { like.save! }.to change(Like, :count).by(1)
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
