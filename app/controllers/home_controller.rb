class HomeController < ApplicationController
  def index
      @user = current_user if current_user
  end

  def about
  end

  def result
  end

  def shop
  end
end
