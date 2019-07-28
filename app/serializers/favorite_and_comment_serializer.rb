class FavoriteAndCommentSerializer < ActiveModel::Serializer
  attributes :id, :favorite, :comments#, :user
  belongs_to :user
  belongs_to :bean

  # def user
  #   {
  #     user_id: self.object.user_id,
  #     username: self.scope.username
  #   }
  # end
end
