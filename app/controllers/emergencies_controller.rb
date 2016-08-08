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
  end


end
