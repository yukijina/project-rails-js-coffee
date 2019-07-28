class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :favorite_and_comments
  has_many :beans, through: :favorite_and_comments
end
