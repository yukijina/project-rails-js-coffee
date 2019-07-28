class FavoriteAndCommentsController < ApplicationController

  def new
    @fav_com = @FavoriteAndComment.new
  end

  def create
    user = User.find_by(id: current_user.id)
    bean = Bean.find_by(id: params[:favorite_and_comments][:bean_id])
    roaster = bean.roaster
    #check if a user already added to favorite
    if !FavoriteAndComment.find_favorite(current_user.id, params[:favorite_and_comments][:bean_id]).exists?
      user.favorite_and_comments.create(favorite: true, bean_id: params[:favorite_and_comments][:bean_id])
      flash[:notice] = "Successfully added to your favorite!"
      redirect_to roaster_bean_path(roaster, bean)
    else
      flash[:notice] = "It is already in your favorite."
      redirect_to roaster_bean_path(roaster, bean)
    end
  end

  private
  def fav_com_params
    params.require(:favorite_and_comments).permit(:favorite, :comments, :user_id, :bean_id)
  end
end
