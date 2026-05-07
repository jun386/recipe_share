FactoryBot.define do
  factory :comment do
    association :recipe
    association :user
    content { Faker::Lorem.paragraph }
  end
end