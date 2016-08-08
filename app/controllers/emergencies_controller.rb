class EmergenciesController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @users = User.where(address: params[:user][:address])
    @users.each do |user|
      Emergency.create(firestation_id: @current_user.id, user_id: user.id)
    end
  end

  def update
    @emergency = Emergency.find(params[:id])
    @emergency.update(user_status: params[:user_status], firestation_status: params[:firestation_status])

    @user = User.find(params[:id])
    redirect_to user_path(@user)
  end


end
