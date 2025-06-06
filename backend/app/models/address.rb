class Address < ApplicationRecord
  belongs_to :user
  has_many :orders
  # Attributes: user_id:integer, street:string, city:string, state:string, zip:string, country:string
end
