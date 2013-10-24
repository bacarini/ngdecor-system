class AddIndexToArchitectOnCustomer < ActiveRecord::Migration
  def change
    add_index :customers, :architect 
  end
end
