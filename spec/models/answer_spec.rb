require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'アソシエーション' do
    it "Inquiryモデルとの関連付け" do
      expect(Answer.reflect_on_association(:inquiry).macro).to eq :belongs_to
    end

    it "inquiry とともに保存できること" do
      answer = FactoryBot.create(:answer)
      expect(answer.inquiry).to be_present
      expect(answer).to be_persisted
    end
  end
end
