class FavoriteAndCommentSerializer < ActiveModel::Serializer
  attributes :id, :favorite, :comments, :user
  #belongs_to :user
  belongs_to :bean

   def user
     id = self.object.user_id
     { user_id: id,
       username: User.find_by(id: id).username  }
   end
end


##self.object
#<FavoriteAndComment:0x00007fc732958e80
 #id: 1,
 #favorite: true,
 #comments: "I love this beans. Fresh light roast, amazing flavor.",
 #user_id: 1,
 #bean_id: 1,
 #created_at: Mon, 29 Jul 2019 01:31:14 UTC +00:00,
 #updated_at: Mon, 29 Jul 2019 01:31:14 UTC +00:00>
