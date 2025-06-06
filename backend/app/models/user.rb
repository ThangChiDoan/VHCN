class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null
  has_many :orders
  has_many :addresses
  has_many :reviews
  # Add devise or authentication logic as needed
  # Attributes: email:string, encrypted_password:string, name:string, phone:string
end
