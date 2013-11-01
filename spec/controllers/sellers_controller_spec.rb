require 'spec_helper'

describe SellersController do

  before { controller.stub(:authenticate_user!).and_return true }
  let(:valid_attributes) { { "name" => "MyString" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all sellers as @sellers" do
      seller = Seller.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sellers).should eq([seller])
    end
  end

  describe "GET show" do
    it "assigns the requested seller as @seller" do
      seller = Seller.create! valid_attributes
      get :show, {:id => seller.to_param}, valid_session
      assigns(:seller).should eq(seller)
    end
  end

  describe "GET new" do
    it "assigns a new seller as @seller" do
      get :new, {}, valid_session
      assigns(:seller).should be_a_new(Seller)
    end
  end

  describe "GET edit" do
    it "assigns the requested seller as @seller" do
      seller = Seller.create! valid_attributes
      get :edit, {:id => seller.to_param}, valid_session
      assigns(:seller).should eq(seller)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Seller" do
        expect {
          post :create, {:seller => valid_attributes}, valid_session
        }.to change(Seller, :count).by(1)
      end

      it "assigns a newly created seller as @seller" do
        post :create, {:seller => valid_attributes}, valid_session
        assigns(:seller).should be_a(Seller)
        assigns(:seller).should be_persisted
      end

      it "redirects to the created seller" do
        post :create, {:seller => valid_attributes}, valid_session
        response.should redirect_to(Seller.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved seller as @seller" do
        # Trigger the behavior that occurs when invalid params are submitted
        Seller.any_instance.stub(:save).and_return(false)
        post :create, {:seller => { "name" => "invalid value" }}, valid_session
        assigns(:seller).should be_a_new(Seller)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Seller.any_instance.stub(:save).and_return(false)
        post :create, {:seller => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested seller" do
        seller = Seller.create! valid_attributes
        # Assuming there are no other sellers in the database, this
        # specifies that the Seller created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Seller.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => seller.to_param, :seller => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested seller as @seller" do
        seller = Seller.create! valid_attributes
        put :update, {:id => seller.to_param, :seller => valid_attributes}, valid_session
        assigns(:seller).should eq(seller)
      end

      it "redirects to the seller" do
        seller = Seller.create! valid_attributes
        put :update, {:id => seller.to_param, :seller => valid_attributes}, valid_session
        response.should redirect_to(seller)
      end
    end

    describe "with invalid params" do
      it "assigns the seller as @seller" do
        seller = Seller.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Seller.any_instance.stub(:save).and_return(false)
        put :update, {:id => seller.to_param, :seller => { "name" => "invalid value" }}, valid_session
        assigns(:seller).should eq(seller)
      end

      it "re-renders the 'edit' template" do
        seller = Seller.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Seller.any_instance.stub(:save).and_return(false)
        put :update, {:id => seller.to_param, :seller => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested seller" do
      seller = Seller.create! valid_attributes
      expect {
        delete :destroy, {:id => seller.to_param}, valid_session
      }.to change(Seller, :count).by(-1)
    end

    it "redirects to the sellers list" do
      seller = Seller.create! valid_attributes
      delete :destroy, {:id => seller.to_param}, valid_session
      response.should redirect_to(sellers_url)
    end
  end

end
