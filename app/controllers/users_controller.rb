class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password])
  end

  def edit
  end
end
