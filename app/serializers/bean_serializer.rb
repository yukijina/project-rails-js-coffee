class BeanSerializer < ActiveModel::Serializer
  attributes :id, :brand, :variety, :taste_note, :description, :organic, :origin_1, :origin_2, :origin_3
  belongs_to :roaster
  has_many :favorite_and_comments
  #has_many :users
end
