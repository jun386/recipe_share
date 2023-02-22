require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    let(:user) { FactoryBot.create(:user) }

    it "有効な状態であること" do
      expect(user).to be_valid
    end

    it "ニックネームが空欄でないこと" do
      user.nickname = ""
      expect(user).not_to be_valid
    end
  end

  describe "アソシエーション" do
    it "Messageモデルとの関連付け" do
      expect(User.reflect_on_association(:messages).macro).to eq :has_many
    end

    it "Entryモデルとの関連付け" do
      expect(User.reflect_on_association(:entries).macro).to eq :has_many
    end
    
    it "FollowingRelationshipモデルとの関連付け" do
      expect(User.reflect_on_association(:following_relationships).macro).to eq :has_many
    end
    
    it "Followingsモデルとの関連付け" do
      expect(User.reflect_on_association(:followings).macro).to eq :has_many
    end
    
    it "FollowerRelationshipモデルとの関連付け" do
      expect(User.reflect_on_association(:follower_relationships).macro).to eq :has_many
    end
    
    it "Followersモデルとの関連付け" do
      expect(User.reflect_on_association(:followers).macro).to eq :has_many
    end
    
    it "Recipeモデルとの関連付け" do
      expect(User.reflect_on_association(:recipes).macro).to eq :has_many
    end
    
    it "Commentモデルとの関連付け" do
      expect(User.reflect_on_association(:comments).macro).to eq :has_many
    end
  end
    
  describe "フォロー機能" do
    let(:user1) { FactoryBot.create(:user) }
    let(:user2) { FactoryBot.create(:user) }

    it "フォローしていないユーザーはフォローしていないこと" do
      expect(user1.following?(user2)).to be_falsey
    end
    
    it "フォローできること" do
      user1.follow!(user2)
      expect(user1.following?(user2)).to be_truthy
    end
    
    it "フォロー解除できること" do
      user1.follow!(user2)
      user1.unfollow!(user2)
      expect(user1.following?(user2)).to be_falsey
    end
  end
end
