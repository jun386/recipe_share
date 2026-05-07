require 'rails_helper'

RSpec.describe Material, type: :model do
  describe '永続化' do
    it 'レシピに紐づく材料として保存できること' do
      material = FactoryBot.create(:material)
      expect(material).to be_persisted
      expect(material.material_name).to be_present
      expect(material.recipe_id).to be_present
    end
  end
end
