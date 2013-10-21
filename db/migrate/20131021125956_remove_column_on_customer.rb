class RemoveColumnOnCustomer < ActiveRecord::Migration
  def change
    remove_column :customers, :customer_id
  end
end
