class SessionsController < ApplicationController
  # Root
  def home
  end

  #sign in form
  def new
    @user = User.new
    render :signin
  end

  #sign in
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      #redirect_to beans_path
    else
      #error message
      redirect_to signin_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end
