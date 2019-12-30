FactoryBot.define do
  factory :shop do
    association :user
    shop_name       "Test_Shop"
    sequence(:tel) { |n| "#{n}-0000-0000" }
    business_hours  "10:00〜24:00"
    adress          "Test adress"
    nearest_station "TestStation"
    access          "Walking 3minutes from TestStation"
    shop_info       "This Shop is test shop."
    official_url    "https://www.google.com/"

    trait :with_events do
      after(:create) { |shop| create_list(:event, 3, shop: shop) }
    end
  end
end
