class AddColumnCnpjOnSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :cnpj, :string
    add_index :suppliers, :cnpj
  end
end
