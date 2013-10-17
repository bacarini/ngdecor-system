class AddForeignKeyOnCustomer < ActiveRecord::Migration
  def change
     add_column :customers, :customer_id, :integer, references: :customers
     add_index  :customers, :customer_id
  end
end
