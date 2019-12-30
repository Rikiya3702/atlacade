FactoryBot.define do
  factory :event do
    association :shop
    event_date  Date.today
    content     "This is TestEvent!!!"
  end
end
