require 'spec_helper'
describe SuppliersController do
  before { controller.stub(:authenticate_user!).and_return true }
  let(:valid_attributes) { { name: "MyString" , cnpj: 1234514 } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all suppliers as @suppliers" do
      supplier = Supplier.create! valid_attributes
      get :index, {}, valid_session
      assigns(:suppliers).should eq([supplier])
    end
  end

  describe "GET show" do
    it "assigns the requested supplier as @supplier" do
      supplier = Supplier.create! valid_attributes
      get :show, {:id => supplier.to_param}, valid_session
      assigns(:supplier).should eq(supplier)
    end
  end

  describe "GET new" do
    it "assigns a new supplier as @supplier" do
      get :new, {}, valid_session
      assigns(:supplier).should be_a_new(Supplier)
    end
  end

  describe "GET edit" do
    it "assigns the requested supplier as @supplier" do
      supplier = Supplier.create! valid_attributes
      get :edit, {:id => supplier.to_param}, valid_session
      assigns(:supplier).should eq(supplier)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Supplier" do
        expect {
          post :create, {:supplier => valid_attributes}, valid_session
        }.to change(Supplier, :count).by(1)
      end

      it "assigns a newly created supplier as @supplier" do
        post :create, {:supplier => valid_attributes}, valid_session
        assigns(:supplier).should be_a(Supplier)
        assigns(:supplier).should be_persisted
      end

      it "redirects to the created supplier" do
        post :create, {:supplier => valid_attributes}, valid_session
        response.should redirect_to(Supplier.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved supplier as @supplier" do
        # Trigger the behavior that occurs when invalid params are submitted
        Supplier.any_instance.stub(:save).and_return(false)
        post :create, {:supplier => { "name" => "invalid value" }}, valid_session
        assigns(:supplier).should be_a_new(Supplier)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Supplier.any_instance.stub(:save).and_return(false)
        post :create, {:supplier => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested supplier" do
        supplier = Supplier.create! valid_attributes
        Supplier.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => supplier.to_param, :supplier => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested supplier as @supplier" do
        supplier = Supplier.create! valid_attributes
        put :update, {:id => supplier.to_param, :supplier => valid_attributes}, valid_session
        assigns(:supplier).should eq(supplier)
      end

      it "redirects to the supplier" do
        supplier = Supplier.create! valid_attributes
        put :update, {:id => supplier.to_param, :supplier => valid_attributes}, valid_session
        response.should redirect_to(supplier)
      end
    end

    describe "with invalid params" do
      it "assigns the supplier as @supplier" do
        supplier = Supplier.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Supplier.any_instance.stub(:save).and_return(false)
        put :update, {:id => supplier.to_param, :supplier => { "name" => "invalid value" }}, valid_session
        assigns(:supplier).should eq(supplier)
      end

      it "re-renders the 'edit' template" do
        supplier = Supplier.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Supplier.any_instance.stub(:save).and_return(false)
        put :update, {:id => supplier.to_param, :supplier => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested supplier" do
      supplier = Supplier.create! valid_attributes
      expect {
        delete :destroy, {:id => supplier.to_param}, valid_session
      }.to change(Supplier, :count).by(-1)
    end

    it "redirects to the suppliers list" do
      supplier = Supplier.create! valid_attributes
      delete :destroy, {:id => supplier.to_param}, valid_session
      response.should redirect_to(suppliers_url)
    end
  end

end
