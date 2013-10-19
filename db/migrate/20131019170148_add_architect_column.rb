class AddArchitectColumn < ActiveRecord::Migration
  def change
    add_column :customers, :architect, :boolean, default: false
  end
end
