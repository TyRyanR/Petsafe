class EmergenciesController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if @current_user
      @users = User.where(address: params[:user][:address])
      @users.each do |user|
        Emergency.create(firestation_id: @current_user.id, user_id: user.id, address: params[:user][:address])
      end
      redirect_to @current_user
    else
      redirect_to root_url
    end
  end

  def update
    if @current_user
      @emergency = Emergency.find(params[:id])

      if params[:user_status]
        @emergency.update(user_status: params[:user_status])
      else
        @emergency.update(firestation_status: params[:firestation_status])
      end

      redirect_to user_path(@current_user)
    else
      redirect_to root_url
    end
  end

  def destroy

    if @current_user
      if @current_user
        @emergencies = Emergency.where(firestation_id: @current_user.id)
        @emergencies.destroy_all
        redirect_to @current_user
      else
        redirect_to root_url
      end
    else
      redirect_to root_url
    end

  end
  
end
