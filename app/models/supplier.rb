class Supplier < ActiveRecord::Base

  validates :cnpj, uniqueness: true, numericality: { only_integer: true }
  validates :cnpj, :name, presence: true
end
