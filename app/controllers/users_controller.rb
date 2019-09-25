class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new( nickname: params[:nickname],
                      email:    params[:email],
                      password: params[:password]
                    )
    redirect_to root_url
  end
end
