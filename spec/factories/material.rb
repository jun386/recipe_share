FactoryBot.define do
  factory :material do
    material_name { '砂糖' }
    after(:build) do |material|
      material.recipe_id ||= FactoryBot.create(:recipe).id
    end
  end
end
