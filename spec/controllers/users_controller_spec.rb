require 'spec_helper'

describe UsersController do
  before { controller.stub(:authenticate_user!).and_return true }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end
  end
end
