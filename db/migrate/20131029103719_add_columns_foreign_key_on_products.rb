class AddColumnsForeignKeyOnProducts < ActiveRecord::Migration
  def change
    add_column :products, :supplier_id, :integer
    add_column :products, :category_id, :integer
    add_index :products, :category_id
    add_index :products, :supplier_id
  end
end
