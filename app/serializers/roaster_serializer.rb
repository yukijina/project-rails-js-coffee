class RoasterSerializer < ActiveModel::Serializer
  attributes :id, :roaster_name, :city, :state, :description, :url
  has_many :beans
end
