FactoryBot.define do
  factory :inquiry do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { '09012345678' }
    content { Faker::Lorem.paragraph }
  end
end
