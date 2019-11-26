class MachinesController < ApplicationController
  before_action :admin_user, only: [:new, :edit, :craete, :update, :destroy]

  def index
    @machines = Machine.page(params[:page])
  end

  def show
    @machine = Machine.find(params[:id])
  end

  def new
    @machine = Machine.new
  end

  def edit
    @machine = Machine.find(params[:id])
  end

  def create
    @machine = Machine.create(machine_params)
    if @machine.save
      flash[:success] = "登録しました"
      redirect_to machine_path(@machine)
    else
      render 'new'
    end
  end

  def update
    @machine = Machine.find(params[:id])
    if @machine.update_attributes(machine_params)
      flash[:success] = "更新しました"
      redirect_to machine_path(@machine)
    else
      render 'edit'
    end
  end

  def destroy
    Machine.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to machines_path
  end

  private

    def machine_params
      params.require(:machine).permit( :title, :genre, :maker, :official_url)
    end

    def admin_user
      redirect_to(root_url) unless admin_user?
    end
end
