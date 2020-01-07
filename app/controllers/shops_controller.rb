class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index

    # 全件表示リンク・リダイレクト用
    if params[:search].nil?
      @shops = Shop.page(params[:page])
      flash.now[:info] = "全店舗を表示します。"
      return
    end

    # エリアが選択された時、マッチするshop_idをids[:from_adress]に代入
    ids = {}
    if params[:search][:adress].present?
      ids[:from_adress] = Shop.search_adress(params[:search][:adress]).map(&:id)
      @query_adress = params[:search][:adress]
    # エリアもゲームも選択しなかった時は全件表示
    elsif params[:search][:machine_ids].nil?
      @shops = Shop.page(params[:page])
      flash.now[:info] = "全店舗を表示します。"
      return
    end

    # 選択されたゲームを持つshop_idをids[:from_machine]に代入
    # 参考URL https://orangelog.site/rails/search-filter-associated-models/
    @machine_ids = params[:search][:machine_ids]
    if @machine_ids.present?
      conditions = {}
      conditions[:shop_machines] = {}
      conditions[:shop_machines][:machine_id] = @machine_ids.map(&:to_i)
      ids[:from_machine] = ShopMachine.where(machine_id: conditions[:shop_machines][:machine_id]).group(:shop_id).having('count(shop_id) = ?', @machine_ids.length).map(&:shop_id)
      @query_machines = Machine.find(@machine_ids)

    end

    # ids[:from_adress] と ids[:from_machine] から 出力するid配列 ids[:shop] を求める
    if ids[:from_adress].present? && ids[:from_machine].present?
      ids[:shop] = ids[:from_adress] & ids[:from_machine]
    elsif ids[:from_adress].nil?
      ids[:shop] = ids[:from_machine]
    elsif ids[:from_machine].nil?
      ids[:shop] = ids[:from_adress]
    end

    # ids[:shop] で抽出
    if ids[:shop].present?
      @shops = Shop.where(id: ids[:shop]).page(params[:page])
    else
      redirect_to root_path, notice: "該当する店舗がありませんでした。"
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @new_event = Event.new
    @events = @shop.event
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
      flash[:success] = "更新しました。"
      redirect_to "/shops/#{@shop.id}"
    else
      render 'edit'
    end
  end

  def destroy
    Shop.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to root_path
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
