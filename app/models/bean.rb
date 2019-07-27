class Bean < ApplicationRecord
  belongs_to :roaster
  has_many :favorite_and_comments
  accepts_nested_attributes_for :roaster
end
