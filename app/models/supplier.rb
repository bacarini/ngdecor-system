class Supplier < ActiveRecord::Base

  has_many :products

  validates :cnpj, uniqueness: true, numericality: { only_integer: true }
  validates :cnpj, :name, presence: true
end
