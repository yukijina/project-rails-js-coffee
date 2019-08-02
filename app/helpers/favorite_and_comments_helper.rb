module FavoriteAndCommentsHelper

  def favorite_number(fav_coms)
    fav_coms.filter{|fav_com| fav_com if fav_com.favorite == true }.size
  end
  
end
