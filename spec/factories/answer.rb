FactoryBot.define do
  factory :answer do
    association :inquiry
    content { Faker::Lorem.paragraph }
  end
end
