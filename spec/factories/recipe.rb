FactoryBot.define do
  factory :recipe do
    association :user
    name { Faker::Food.dish }
  end

  factory :recipe1 do
  end

  factory :recipe2 do
  end
end