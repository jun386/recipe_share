FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name } 
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at {Time.now - 100}
  end

  factory :user1, :class => 'User' do
    id { 1 }
    nickname { Faker::Name.name } 
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at {Time.now - 100}
  end

  factory :user2, :class => 'User' do
    id { 2 }
    nickname { Faker::Name.name } 
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at {Time.now - 100}
  end
end