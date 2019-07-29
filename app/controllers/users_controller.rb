class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user && @user.save
      session[:user_id] = @user.id
      redirect to beans_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
