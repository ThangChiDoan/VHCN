class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  # Attributes: user_id:integer, product_id:integer, rating:integer, comment:text
end
