require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'アソシエーション' do
    it "Userモデルとの関連付け" do
      expect(Recipe.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it "Likeモデルとの関連付け" do
      expect(Recipe.reflect_on_association(:likes).macro).to eq :has_many
    end

    it "Commentモデルとの関連付け" do
      expect(Recipe.reflect_on_association(:comments).macro).to eq :has_many
    end
  end

  describe "メソッド" do
    describe "#user" do
      let(:user) { FactoryBot.create(:user) }
      let(:recipe) { FactoryBot.create(:recipe, user: user) }

      it "レシピを作成したユーザーを返すこと" do
        expect(recipe.user).to eq(user)
      end
    end

    describe "#search" do
      let!(:recipe1) { FactoryBot.create(:recipe, name: "パスタ") }
      let!(:recipe2) { FactoryBot.create(:recipe, name: "ピザ") }
      
      it "検索対象の単語が存在する時、検索結果を返すこと" do
        expect(Recipe.search("パスタ")).to include(recipe1)
      end
      
      it "検索対象の単語がnilの時、全てのレシピを返すこと" do
        expect(Recipe.search(nil)).to include(recipe1, recipe2)
      end
    end
  end
end
