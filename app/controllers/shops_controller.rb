class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @new_event = Event.new

  end

  def new
    redirect_to shop_path(current_user) if current_user.shop.present?
    @shop = Shop.new
    @shop.build_tag
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
      @shop.build_tag(tag_params)
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

    if  (@shop == current_user.shop || current_user.role == 2)  &&
        @shop.update_attributes(shop_params)   &&
        @shop.tag.update_attributes(tag_params)

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
                                    :shop_info, :official_url,    :image,
                                    :latitude,  :longitude  )
    end

    def tag_params
      params.require(:tag).permit(  :emoney,     :paseli,  :parking,
                                    :open24h,    :older18, :smoking,
                                    :hand_towel, :locker,  :wifi )
    end
end
