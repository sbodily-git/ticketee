class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.order(:email)
  end # index
  
  def new
    @user = User.new
  end # new

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "User has not been created."
      render "new"
    end # if
  end # create

private

  def user_params
    params.require(:user).permit(:email, :password)
  end # user_params

end # UsersController
