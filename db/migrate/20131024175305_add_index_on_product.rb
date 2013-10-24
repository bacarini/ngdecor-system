class AddIndexOnProduct < ActiveRecord::Migration
  def change
    add_index :products, :name
    add_index :products, :category_id
    add_index :products, :supplier_id
  end
end
