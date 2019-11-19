class EventsController < ApplicationController
  
  def new
    @shop = Shop.find(params[:id])
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    shop = Shop.find(event_params[:shop_id])
    event = shop.event.create(event_params)
    if event.save
      flash[:success] = "登録しました"
      redirect_to shop_path(shop)
    else
      render 'new'
    end
  end

  def update
    event = Event.find(params[:id])
    shop = Shop.find(event.shop_id)
    if event.update_attributes(event_params)
      flash[:success] = "更新しました"
      redirect_to shop_path(shop)
    else
      render 'edit'
    end
  end

  def destroy
    event = Event.find(params[:id])
    shop = Shop.find(event.shop_id)
    event.destroy
    flash[:success] = "削除しました"
    redirect_to shop_path(shop)
  end

  private

    def event_params
      params.require(:event).permit( :shop_id, :event_date, :content )
    end

end
