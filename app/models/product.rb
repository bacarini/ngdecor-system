class Product < ActiveRecord::Base

  belongs_to :category
  belongs_to :supplier

  validates :name, :price, :markup, :category_id, :supplier_id, presence: true

end
