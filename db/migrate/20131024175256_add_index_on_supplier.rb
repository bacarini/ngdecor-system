class AddIndexOnSupplier < ActiveRecord::Migration
  def change
    add_index :suppliers, :name
  end
end
