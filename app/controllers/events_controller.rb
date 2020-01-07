class EventsController < ApplicationController

  def edit
    @event = Event.find(params[:id])
    shop = Shop.find(@event.shop_id)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    shop = Shop.find(event_params[:shop_id])
    event = shop.event.new(event_params)
    respond_to do |format|
      if event.save
        @events = shop.event
        format.html
        format.js
      end
    end
  end

  def update
    @event = Event.find(params[:id])
    shop = Shop.find(@event.shop_id)
    respond_to do |format|
      if @event.update_attributes(event_params)
        @events = shop.event
        format.html
        format.js
      end
    end
  end

  def destroy
    event = Event.find(params[:id])
    shop = Shop.find(event.shop_id)
    event.destroy
    respond_to do |format|
      @events = shop.event
      format.html
      format.js
    end
  end

  private

    def event_params
      params.require(:event).permit( :shop_id, :event_date, :content )
    end
end
