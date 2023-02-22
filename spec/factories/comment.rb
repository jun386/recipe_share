FactoryBot.define do
  factory :comment do
    recipe_id { 1 }
    content { Faker::Lorem.paragraph }
    user_id { 1 }
  end
end