class UsersController < ApplicationController
  def index
  end

  def create
    require "pry"
    binding.pry
    @user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password])
  end

  def new
    @user = User.new
  end
end
