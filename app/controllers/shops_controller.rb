class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    redirect_to shop_path(current_user) if current_user.shop.present?
    @shop = Shop.new
  end

  def edit
    @shop = Shop.find(params[:id])
    unless @shop == current_user.shop || current_user.role == 2
      flash[:notice] = "権限がありません。"
      redirect_to shop_path(@shop)
    end
  end

  def create
    if user_signed_in? && current_user.shop.present?
      redirect_to root_path
    else
      @shop = current_user.build_shop(shop_params)
      if @shop.save
        flash[:success] = "登録しました"
        redirect_to shop_path(@shop)
      else
        render 'new'
      end
    end
  end

  def update
    @shop = Shop.find(params[:id])

    if @shop == current_user.shop && @shop.update_attributes(shop_params)
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
                                    :shop_info, :image)
    end
end
