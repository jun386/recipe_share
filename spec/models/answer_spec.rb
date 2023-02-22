require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'アソシエーション' do
    it "Inquiryモデルとの関連付け" do
      expect(Answer.reflect_on_association(:inquiry).macro).to eq :belongs_to
    end
  end
end
