class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :phone
      t.string :cnpj
      t.string :email

      t.timestamps
    end
    
    add_index :sellers, :name
    add_index :sellers, :cnpj
  end
end
