class ShopMachinesController < ApplicationController
  before_action :set_shop
  before_action :user_is_owner?

  def new
    @shop_machines = ShopMachine.new
    @machines = Machine.where.not(id: @shop.machine_ids)
  end

  def create
      success_count = 0
      create_params = shop_machines_params
      create_params[:own].each_with_index do |own, i|
        next if own.to_i <= 0
        shop_machine = ShopMachine.create(shop_id:    create_params[:shop_id],
                                          machine_id: create_params[:machine_id][i],
                                          own:        create_params[:own][i],
                                          price:      create_params[:price][i] )
        if  shop_machine.save
          success_count += 1
        end
      end

      if success_count == 0
        flash[:danger] = "登録に失敗しました"
      else
        flash[:success] = "#{success_count}件のデータを登録しました"
      end
      redirect_to shop_path(create_params[:shop_id])
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

      if param[:own].to_i <= 0
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

    def shop_machines_params
      params.require(:shop_machine).permit(:shop_id, machine_id: [], price: [], own: [])
    end

end
