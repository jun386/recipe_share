require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  describe 'アソシエーション' do
    it "Answerモデルとの関連付け" do
      expect(Inquiry.reflect_on_association(:answers).macro).to eq :has_many
    end

    it "inquiry を削除すると answers も削除されること" do
      inquiry = FactoryBot.create(:inquiry)
      FactoryBot.create(:answer, inquiry: inquiry)
      expect { inquiry.destroy }.to change(Answer, :count).by(-1)
    end
  end
end
