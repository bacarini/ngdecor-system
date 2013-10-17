class Customer < ActiveRecord::Base
  
  belongs_to :parent,    class_name: 'Customer', foreign_key: "customer_id"

    validates :name, :presence => true
end
