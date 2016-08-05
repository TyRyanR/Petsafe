class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(create_user)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def create_user
    params.require(:user).permit(:username, :password, :name, :address, :unit_number)
  end

end
