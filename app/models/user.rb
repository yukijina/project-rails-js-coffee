class User < ApplicationRecord
  has_secure_password
  has_many :favorite_and_comments
  has_many :beans, through: :favorite_and_comments
  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true

end
