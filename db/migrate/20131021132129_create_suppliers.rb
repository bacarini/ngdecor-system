class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.integer :cnpj
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
