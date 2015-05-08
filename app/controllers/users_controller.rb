class UsersController < ApplicationController

  before_action :who_is_user, only: [:edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to loggedin_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private

  def user_params 
    params.require(:user).permit(:name, :username, :email, :profile_picture, :password, :password_confirmation)
  end

end
