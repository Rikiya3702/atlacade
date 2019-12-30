FactoryBot.define do
  factory :tag do
    association :shop
    emoney     true
    paseli     true
    parking    true
    open24h    true
    older18    true
    hand_towel true
    locker     true
    wifi       true
    smoking    0
  end
end
