FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    name {"name"}
    role { 0 }
    password { "password" }
    password_confirmation { "password" }
  end
end