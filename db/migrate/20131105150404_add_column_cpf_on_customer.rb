class AddColumnCpfOnCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :cpf, :string
    add_index :customers, :cpf
  end
end
