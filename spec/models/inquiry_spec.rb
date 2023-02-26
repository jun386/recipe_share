require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  describe 'アソシエーション' do
    it "Answerモデルとの関連付け" do
      expect(Inquiry.reflect_on_association(:answers).macro).to eq :has_many
    end
  end
end
