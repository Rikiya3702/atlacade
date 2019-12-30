FactoryBot.define do
  factory :user do
    nickname "Tester"
    sequence(:email) { |n| "test#{n}@test.com" }
    password "password"
  end
end
