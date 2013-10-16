require 'spec_helper'

describe UsersController do
  before { controller.stub(:authenticate_user!).and_return true }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
