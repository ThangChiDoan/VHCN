class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :address
  # Attributes: user_id:integer, address_id:integer, total:decimal, status:string
end
