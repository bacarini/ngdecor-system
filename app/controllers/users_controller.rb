class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url, notice: t('users.create.success') 
    else
      render action: 'new' 
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url 
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
