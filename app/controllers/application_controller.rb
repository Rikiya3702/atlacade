class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user, if: :user_signed_in?

  protected

    def configure_permitted_parameters
      added_attributes = [  :nickname,
                            :email,
                            :password,
                            :password_confirmation,
                            :image,
                            :profile,
                            :role ]
      devise_parameter_sanitizer.permit :sign_up,        keys: added_attributes
      devise_parameter_sanitizer.permit :account_update, keys: added_attributes
      devise_parameter_sanitizer.permit :sign_in,        keys: added_attributes
    end

    def user_is_owner?
      authenticate_user!
      return admin_user?
      if current_user.role == 0 || current_user.shop.blank? || current_user.shop != @shop
        redirect_to(root_url)
      end
    end

    def set_user
      @user = current_user
    end

    def admin_user?
      user_signed_in? && current_user.role == 2
    end
end
