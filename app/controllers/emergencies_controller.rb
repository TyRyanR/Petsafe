class EmergenciesController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @users = User.where(address: params[:user][:address])
    @users.each do |user|
      Emergency.create(firestation_id: @current_user.id, user_id: user.id, address: params[:user][:address])
    end
  end

  def update
    @emergency = Emergency.find(params[:id])

    if params[:user_status]
      @emergency.update(user_status: params[:user_status])
    else
      @emergency.update(firestation_status: params[:firestation_status])
    end

    @user = User.find(params[:id])
    redirect_to user_path(@current_user)
  end

end
