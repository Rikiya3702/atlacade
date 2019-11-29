class HomeController < ApplicationController
  def index
    @shop = Shop.new
    @machines = Machine.all
  end

  def about
  end

  def result
  end

  def shop
  end
end
