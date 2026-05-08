require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  describe '永続化' do
    it '名前を指定して保存できること' do
      prefecture = FactoryBot.build(:prefecture)
      expect(prefecture).to be_valid
      expect { prefecture.save! }.to change(Prefecture, :count).by(1)
    end
  end
end
