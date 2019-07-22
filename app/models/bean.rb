class Bean < ApplicationRecord
  belongs_to :roaster
  accepts_nested_attributes_for :roaster
end
