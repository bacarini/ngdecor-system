class ChangeTypeOfAttributeOnSupplier < ActiveRecord::Migration
  def change
    rename_column :suppliers, :cnpj, :string
  end
end
