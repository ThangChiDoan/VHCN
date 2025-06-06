class User < ApplicationRecord
  has_many :orders
  has_many :addresses
  has_many :reviews
  # Add devise or authentication logic as needed
  # Attributes: email:string, encrypted_password:string, name:string, phone:string
end
