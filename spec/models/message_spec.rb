require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'アソシエーション' do
    it "Userモデルとの関連付け" do
      expect(Message.reflect_on_association(:sender).macro).to eq :belongs_to
    end

    it "Roomモデルとの関連付け" do
      expect(Message.reflect_on_association(:room).macro).to eq :belongs_to
    end
  end

  describe "メソッド" do
    describe "#user" do
      let(:message) { FactoryBot.create(:message) }

      it "メッセージを送ったユーザーを返すこと" do
        expect(message.user).to eq(message.sender)
      end
    end
  end
end
