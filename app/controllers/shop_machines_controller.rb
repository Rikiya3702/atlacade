class ShopMachinesController < ApplicationController
  before_action :set_shop
  before_action :user_is_owner?

  def new
    @machines = Machine.where.not(id: @shop.machine_ids)
  end

  def create
      success_count = 0
      create_shop_machines_params.each do |param|
        next if param[:own].to_i == 0
        shop_machine = ShopMachine.create(param)
        if  shop_machine.save
          success_count += 1
        end
      end

      if success_count == 0
        flash[:danger] = "登録に失敗しました"
      else
        flash[:success] = "#{success_count}件のデータを登録しました"
      end
      redirect_to @shop
  end

  def edit
    @shop_machines = ShopMachine.where(shop_id: @shop.id)
    @machines = Machine.where(id: @shop.machine_ids)
  end

  def update
    # params[:shop_machines].values
    success_count = 0

    update_shop_machines_params.values.each do |param|
      @shop_machine = ShopMachine.find_by(id: param[:id])

      if param[:own].to_i == 0
        @shop_machine.destroy
        success_count += 1
      elsif @shop_machine[:own] == param[:own].to_i && @shop_machine[:price] == param[:price]
        next
      elsif @shop_machine.update_attributes(param)
        success_count += 1
      end
    end

    if success_count == 0
      flash[:danger] = "編集に失敗しました"
    else
      flash[:success] = "#{success_count}件のデータを更新しました"
    end
      redirect_to @shop
  end

  private

    def user_is_owner?
      authenticate_user!
      return admin_user?
      if current_user.role == 0 || current_user.shop.blank? || current_user.shop != @shop
        redirect_to(root_url)
      end
    end

    def set_shop
      @shop = Shop.find_by(id: params[:id])
    end

    def update_shop_machines_params
      params.permit(shop_machines: [:id, :shop_id, :machine_id, :price, :own])[:shop_machines]
    end

    def create_shop_machines_params
      params.require(:shop_machines).map do |m|
        m.permit(:shop_id, :machine_id, :price, :own)
      end
    end

end
