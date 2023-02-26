require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'アソシエーション' do
    it "Userモデルとの関連付け" do
      expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it "Recipeモデルとの関連付け" do
      expect(Comment.reflect_on_association(:recipe).macro).to eq :belongs_to
    end
  end

  describe "バリデーション" do
    let(:comment) { FactoryBot.create(:comment) }

    it "有効な状態であること" do
      expect(comment).to be_valid
    end

    it "contentが空欄でないこと" do
      comment.content = ""
      expect(comment).not_to be_valid
    end
  end
end
