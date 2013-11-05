class RemoveColumnOnSupplier < ActiveRecord::Migration
  def change
    remove_column :suppliers, :string
  end
end
