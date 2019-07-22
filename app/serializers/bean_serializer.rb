class BeanSerializer < ActiveModel::Serializer
  attributes :id, :brand, :variety, :taste_note, :description, :organic, :fairtrade, :origin_1, :origin_2, :origin_3
  belongs_to :roaster
end
