class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = current_user.build_shop(shop_params)
    if @shop.save
      flash[:success] = "登録しました"
      redirect_to shop_path(@shop)
    else
      render 'new'
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(shop_params)
      flash[:success] = "更新しました"
      redirect_to "/shops/#{@shop.id}"
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

    def shop_params
      params.require(:shop).permit( :shop_name, :business_hours,  :tel,
                                    :adress,    :nearest_station, :access,
                                    :shop_info)
    end
end
