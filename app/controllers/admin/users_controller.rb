class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :archive]

  def index
    @users = User.excluding_archived.order(:email)
  end # index
  
  def show
  end # show
  
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

  def edit
  end # edit
  
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end # if

   if @user.update(user_params)
      flash[:notice] = "User has been updated."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "User has not been updated."
      render "edit"
    end # if
  end # update
  
  def archive
    if @user == current_user
      flash[:alert] = "You cannot archive yourself!"
    else
      @user.archive
    
      flash[:notice] = "User has been archived."
    end # if
    
    redirect_to admin_users_path

  end # archive

private

  def set_user
    @user = User.find(params[:id])
  end # set_user

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end # user_params

end # UsersController
