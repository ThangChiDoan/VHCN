class Category < ApplicationRecord
  has_many :products
  # Attributes: name:string, description:text
end
