require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe 'アソシエーション' do
    it "Roomモデルとの関連付け" do
      expect(Entry.reflect_on_association(:room).macro).to eq :belongs_to
    end

    it "Userモデルとの関連付け" do
      expect(Entry.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end
end
