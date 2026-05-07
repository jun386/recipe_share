require 'rails_helper'

RSpec.describe Home, type: :model do
  describe '永続化' do
    it '画像なしで保存できること' do
      home = FactoryBot.create(:home)
      expect(home).to be_persisted
    end
  end
end
