module ApplicationHelper

  def has_shop?(user)
    user_signed_in? && user.shop.present? && user.shop.persisted?
  end

  def has_edit_authority?(user, shop)
    return false unless has_shop?(user)
    user.role == 2 || shop.id == user.shop.id
  end

  def somoking_cheked?(shop, int)
    shop.tag.smoking == int
  end

  def show_self_image(object, size = 300)
    if object.image.present?
      case size
        when 30   then image_tag object.image.thumb30.url
        when 100  then image_tag object.image.thumb100.url
        else           image_tag object.image.thumb.url
      end
    elsif object.class == User
        # if object.role == 2
        #   image_tag("default_user_admin", height: size)
        #   return
      image_tag "default_user/#{object.id % 19}.jpg", height: size
    elsif object.class == Shop
      image_tag "default_shop/#{object.id % 26}.jpg", class:"self-image", height: size
    else
      image_tag("logo.png", height: size)
    end
  end

  # ランダムな日付を取得する
  # 参考URL https://codeday.me/jp/qa/20190112/126884.html
  def time_rand from = 0.0, to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
  end

  def perfectures
    [
      ['北海道'],['青森県'],['岩手県'],['宮城県'],['秋田県'],['山形県'],['福島県'],
      ['茨城県'],['栃木県'],['群馬県'],['埼玉県'],['千葉県'],['東京都'],['神奈川県'],
      ['新潟県'],['富山県'],['石川県'],['福井県'],['山梨県'],['長野県'],['岐阜県'],['静岡県'],['愛知県'],
      ['三重県'],['滋賀県'],['京都府'],['大阪府'],['兵庫県'],['奈良県'],['和歌山県'],
      ['鳥取県'],['島根県'],['岡山県'],['広島県'],['山口県'],['徳島県'],['香川県'],['愛媛県'],['高知県'],
      ['福岡県'],['佐賀県'],['長崎県'],['熊本県'],['大分県'],['宮崎県'],['鹿児島県'],['沖縄県']
    ]
  end
end
