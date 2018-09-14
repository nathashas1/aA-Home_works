class UsersController < ApplicationController


  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end


  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
      redirect_to users_url
    end
  end


private
  def user_params
    params.require(:user).permit(:email, :password_digest, :session_token)
  end


end
