FactoryBot.define do
  factory :message do
    message { Faker::Lorem.paragraph }
    sender_id { 1 }
    user_id { 1 }
    room_id { 1 }
  end
end