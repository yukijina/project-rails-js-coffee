class FavoriteAndComment < ApplicationRecord
  belongs_to :user
  belongs_to :bean

  def self.find_matching_data(user, bean)
    where(["user_id = ? AND bean_id = ?", user, bean])
  end
end
