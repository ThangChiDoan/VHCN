class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :reviews
  # Attributes: name:string, description:text, price:decimal, stock:integer, category_id:integer
end
