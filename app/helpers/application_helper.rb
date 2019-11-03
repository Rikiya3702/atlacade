module ApplicationHelper

  def has_shop?(user)
    user.shop.present?
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
      image_tag "default_shop/#{object.id % 26}.jpg", height: size
    else
      image_tag("logo.png", height: size)
    end
  end

end
