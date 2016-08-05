class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(create_user)
    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def create_user
    params.require(:user).permit(:username, :password, :name, :address, :unit_number)
  end

end
