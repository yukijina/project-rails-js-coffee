class FavoriteAndCommentsController < ApplicationController

  def new
    @fav_com = @FavoriteAndComment.new
  end

  def create
    user = User.find_by(id: current_user.id)
    bean = Bean.find_by(id: params[:favorite_and_comment][:bean_id])
    roaster = bean.roaster
    #check if a user already added to favorite
    fc_data = FavoriteAndComment.find_matching_data(current_user.id, params[:favorite_and_comment][:bean_id])

    if params[:favorite_and_comment][:favorite]
      if fc_data.exists?
        fc_data.update(favorite: true)
        flash[:notice] = "Successfully added to your favorite!"
        redirect_to roaster_bean_path(roaster, bean)
      else
        user.favorite_and_comments.create(favorite: true, bean_id: params[:favorite_and_comment][:bean_id])
        flash[:notice] = "Successfully added to your favorite!"
        redirect_to roaster_bean_path(roaster, bean)
      end
    elsif params[:favorite_and_comment][:comments]
      if fc_data.exists?
        fc_data.update(comments: params[:favorite_and_comment][:comments])
        redirect_to roaster_bean_path(roaster, bean)
      else
        user.favorite_and_comments.create(comments: params[:favorite_and_comment][:comments], bean_id: bean.id)
        redirect_to roaster_bean_path(roaster, bean)
      end
    end
  end

  private
  def fav_com_params
    params.require(:favorite_and_comment).permit(:favorite, :comments, :user_id, :bean_id)
  end
end
