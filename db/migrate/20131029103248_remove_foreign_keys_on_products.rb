class RemoveForeignKeysOnProducts < ActiveRecord::Migration
  def change
    remove_column :products, :supplier_id
  end
end
