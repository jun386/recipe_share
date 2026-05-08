require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe '永続化' do
    it '名前を指定して保存できること' do
      genre = FactoryBot.build(:genre)
      expect(genre).to be_valid
      expect { genre.save! }.to change(Genre, :count).by(1)
    end
  end
end
