require 'spec_helper'

describe "suppliers/new" do
  before(:each) do
    assign(:supplier, stub_model(Supplier,
      :name => "MyString",
      :cnpj => 1,
      :address => "MyString",
      :phone => "MyString"
    ).as_new_record)
  end

  it "renders new supplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suppliers_path, "post" do
      assert_select "input#supplier_name[name=?]", "supplier[name]"
      assert_select "input#supplier_cnpj[name=?]", "supplier[cnpj]"
      assert_select "input#supplier_address[name=?]", "supplier[address]"
      assert_select "input#supplier_phone[name=?]", "supplier[phone]"
    end
  end
end
