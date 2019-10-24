# 管理者
su = User.create!(  nickname:   "Administrator",
                    email:      "admin@example.com",
                    password:   "password",
                    role:       2
                  )

# 管理者の店舗
su.create_shop!(  shop_name:        "Admin_Shop",
                  tel:              "090-0011-2233",
                  business_hours:   "10:00〜24:00",
                  adress:           "東京都新宿区 X-X-X Adminビル3F",
                  nearest_station:  "新宿駅",
                  access:           "JR新宿駅よりXXXXX",
                  shop_info:        "テストアカウントです。"
                )

# 一般の店舗
5.times do |i|
  u = User.create!( nickname:   "ニックネーム_#{i}",
                    email:      "user_#{i}@example.com",
                    password:   "password",
                    role:       1
                  )
  u.create_shop!(  shop_name:         "Test_Shop_[#{i}]",
                    tel:              "090-0011-#{i}#{i}#{i}#{i}",
                    business_hours:   "10:00〜24:00",
                    adress:           "東京都新宿区 X-X-X Adminビル3F",
                    nearest_station:  "新宿駅",
                    access:           "JR新宿駅よりXXXXX",
                    shop_info:        "テストアカウントです。"
                  )
end
