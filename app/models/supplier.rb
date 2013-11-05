class Supplier < ActiveRecord::Base

  has_many :products

  validates :cnpj, uniqueness: true
  validates :cnpj, :name, presence: true
end
