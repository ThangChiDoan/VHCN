class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  # Attributes: order_id:integer, product_id:integer, quantity:integer, price:decimal
end
