class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_user)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(create_user)
    if @user.save
      redirect_to user_path(@user), notice: "Your account has been updated"
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @emergency = Emergency.find_by(user_id: @user.id) ### Since pet owners will only have to view one emergency at a time.
  end

  private
  def create_user
    params.require(:user).permit(:username, :password, :name, :address, :unit_number)
  end

end
