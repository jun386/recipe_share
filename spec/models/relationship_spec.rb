require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe "バリデーション" do
    let(:follower) { FactoryBot.create(:user1) }
    let(:following) { FactoryBot.create(:user2) }
    
    it "follower_idが空欄でないこと" do
      relationship = Relationship.new(follower_id: nil, following: following)
      expect(relationship).to be_invalid
    end

    it "following_idが空欄でないこと" do
      relationship = Relationship.new(follower: follower, following_id: nil)
      expect(relationship).to be_invalid
    end

    it "有効な状態であること" do
      relationship = Relationship.new(follower: follower, following: following)
      expect(relationship).to be_valid
    end
  end

  describe "アソシエーション" do
    it "followerとの関連付け" do
      expect(Relationship.reflect_on_association(:follower).macro).to eq :belongs_to
    end

    it "followingとの関連付け" do
      expect(Relationship.reflect_on_association(:following).macro).to eq :belongs_to
    end
  end
end
