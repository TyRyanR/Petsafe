class EmergenciesController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @users = User.where(address: params[:user][:address])
    @users.each do |user|
      Emergency.create(firestation_id: @current_user.id, user_id: user.id, status: nil)
    end
  end

end
