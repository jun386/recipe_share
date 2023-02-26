require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'アソシエーション' do
    it "Messageモデルとの関連付け" do
      expect(Room.reflect_on_association(:messages).macro).to eq :has_many
    end

    it "Entryモデルとの関連付け" do
      expect(Room.reflect_on_association(:entries).macro).to eq :has_many
    end
  end
end
