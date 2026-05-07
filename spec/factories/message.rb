FactoryBot.define do
  factory :message do
    message { Faker::Lorem.paragraph }
    association :room
    association :sender, factory: :user
  end
end