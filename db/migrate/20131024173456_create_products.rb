class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :markup
      t.string :category_id
      t.string :supplier_id

      t.timestamps
    end
  end
end
