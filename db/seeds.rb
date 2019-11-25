# coding: utf-8
# ゲームの登録
[
  ["音楽ゲーム",      "KONYAMI",       "ポップ ポップ ミュージック"],
  ["音楽ゲーム",      "KONYAMI",       "U-beat"],
  ["音楽ゲーム",      "KONYAMI",       "ギターマニア"],
  ["音楽ゲーム",      "KONYAMI",       "SOUND CLIMAX"],
  ["音楽ゲーム",      "KONYAMI",       "ピアノフォルテ"],
  ["音楽ゲーム",      "KONYAMI",       "THE☆ビチバチ"],
  ["音楽ゲーム",      "SEGO",           "Project ODIVA Arcade"],
  ["音楽ゲーム",      "SEGO",           "音華"],
  ["音楽ゲーム",      "SEGO",           "ちゅーりずむ"],
  ["音楽ゲーム",      "パーフェクト",   "WOCCO"],
  ["音楽ゲーム",      "バンナイダムコ", "三味線の達人"],
  ["音楽ゲーム",      "バンナイダムコ", "グルっとコースター"],
  ["メダルゲーム",    "KONYAMI",        "トゥインクルパイレーツ"],
  ["メダルゲーム",    "KONYAMI",        "ヴィーナスジュエル"],
  ["メダルゲーム",    "SEGO",           "ホカトルカ"],
  ["メダルゲーム",    "SEGO",           "ムーンフォース３"],
  ["メダルゲーム",    "トイター",       "スペースモンスター"],
  ["格闘ゲーム",      "キャプコム",     "ストレートファイター"],
  ["格闘ゲーム",      "バンナイダムコ", "鉄剣７"],
  ["格闘ゲーム",      "SEGO",           "婆ちゃんファイター"],
  ["格闘ゲーム",      "SEGO",           "ギルギルティ XXX"],
  ["ビデオゲーム",    "KONYAMI",       "ボンバーギャル"],
  ["ビデオゲーム",    "KONYAMI",       "天下一麻雀会"],
  ["ビデオゲーム",    "KONYAMI",       "将棋格闘クラブ"],
  ["ビデオゲーム",    "KONYAMI",       "クイズマジックユニバーシティ"],
  ["ビデオゲーム",    "KONYAMI",       "ウイニングテン 2019"],
  ["ビデオゲーム",    "SEGO",          "ワンダーランド ピース"],
  ["ビデオゲーム",    "エニウェア・スクックス", "ディシシア FF"],
  ["体感ゲーム",    "SEGO",            "マッドタクシー"],
  ["体感ゲーム",    "バンナイダムコ",  "ハイパニック ボール"],
  ["体感ゲーム",    "バンナイダムコ",  "湾岸モーニング"],
  ["体感ゲーム",    "トイター",        "自転車でGO！！"],
  ["体感ゲーム",    "スン電子",        "エクストリーム もぐら叩き"],
  ["体感ゲーム",    "エニウェア・スクックス", "ルイスのパラドックス"],
  ["プリントシール",  "ルリュー",      "Ｒ７"],
  ["プリントシール",  "ルリュー",      "PINK PINK BABY 5"],
  ["プリントシール",  "ルリュー",      "トキメキガール"],
  ["頭脳ゲーム",      "プロゲーム",    "コットリン"],
  ["頭脳ゲーム",      "プロゲーム",    "Goo!!"],
  ["頭脳ゲーム",      "プロゲーム",    "ユーニティーC"],
  ["頭脳ゲーム",      "プロゲーム",    "ワールドプレス"],
  ["頭脳ゲーム",      "プロゲーム",    "スカラ・コボォル"]
].each do |genre, maker, title|
  Machine.create!(  title:        title,
                    maker:        maker,
                    genre:        genre,
                    official_url: "https://www.google.com/",
                    machine_info: Faker::Lorem.paragraph
                  )
end

# ランダムな日付の範囲
# 参考URL https://thr3a.hatenablog.com/entry/20151016/1444968237
s1 = Date.parse("2019/12/01")
s2 = Date.parse("2020/01/31")

# 管理者
su = User.create!(  nickname:   "Administrator",
                    email:      "admin@example.com",
                    password:   "password",
                    role:       2
                  )
# 管理者の店舗
su.create_shop!(  shop_name:        "Admin_Shop",
                  tel:              "000-0000-0000",
                  business_hours:   "24時間営業",
                  adress:           "東京都中野区",
                  nearest_station:  "JR中野駅",
                  access:           "JR中野駅よりXXXXX",
                  shop_info:        "管理者の店舗です。"
                )
su.shop.create_tag!(  emoney:     true,
                      paseli:     true,
                      parking:    true,
                      open24h:    true,
                      older18:    true,
                      hand_towel: true,
                      locker:     true,
                      wifi:       true,
                      smoking:    0
                    )
5.times do
  su.shop.event.create!( event_date:   Random.rand(s1 .. s2),
                         content:      "#{Faker::Lorem.paragraph(sentence_count: 2)}\n#{Faker::Lorem.paragraph(sentence_count: 2)}"
                       )
end
# 管理者のShopMachine
machines = Machine.all
owns = [0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 4, 5, 6, 7, 8]

machines.each do |m|
  if (own = owns.sample) == 0
    next
  else
    case m.genre
      when "メダルゲーム"   then price = "-"
      when "プリントシール" then price = "300円"
      else                       price = "100円"
    end
    su.shop.shop_machine.create!( machine_id: m.id,
                                  price: price,
                                  own:  own)
  end
end

# 一般の店舗
bool = [true, false]
shop_brand = [  "ラウンドゼロ",
                "トイターステーション",
                "アットアーズ",
                "ファーストプラネット",
                "セーゴ",
                "レジャーワールド",
                "ゲームズ",
                "アミューズメント",
                "ウェアガーデン",
                "ルビオン レイルズ",
                "パーソン ジャンゴ",
                "ピエピ ララベル",
                "シナットーラ",
                "ＪＳリアクト"]
50.times do |i|
  u = User.create!( nickname:   Gimei.name.to_s,
                    email:      "user_#{i}@example.com",
                    password:   "password",
                    role:       1
                  )

  address = Gimei.address
  u.create_shop!(  shop_name:         "#{shop_brand.sample} #{address.town.kanji}店",
                    tel:              Faker::Base.numerify('0#0-####-####'),
                    business_hours:   "10:00〜24:00",
                    adress:           address.to_s,
                    nearest_station:  "#{address.town.to_s}駅",
                    access:           "#{address.town.to_s}駅よりXXXXX",
                    shop_info:        "#{Faker::Lorem.paragraph(sentence_count: 2)}\n#{Faker::Lorem.paragraph(sentence_count: 4)}\n#{Faker::Lorem.paragraph(sentence_count: 4)}",
                    official_url:     "https://www.google.com/"
                  )

  u.shop.create_tag!(   emoney:     bool.sample,
                        paseli:     bool.sample,
                        parking:    bool.sample,
                        open24h:    false,
                        older18:    bool.sample,
                        hand_towel: bool.sample,
                        locker:     bool.sample,
                        wifi:       bool.sample,
                        smoking:    [0, 1, 2].sample
                      )

  3.times do
    u.shop.event.create!(  event_date:   Random.rand(s1 .. s2),
                           content:      Faker::Lorem.paragraph
                         )
  end

  machines.each do |m|
    if (own = owns.sample) == 0
      next
    else
      case m.genre
        when "メダルゲーム"   then price = "-"
        when "プリントシール" then price = "300円"
        else                       price = "100円"
      end
      u.shop.shop_machine.create!( machine_id: m.id,
                                    price: price,
                                    own:  own)
    end
  end
end
