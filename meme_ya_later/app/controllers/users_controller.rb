class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  
  def index
    @users = User.all 
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(users_param)
    session[:user_id] = @user.id
    redirect_to memes_path
  end

  private
  def users_param
    params.require(:user).permit(:name,:username,:email, :password_digest, :password_confirmation)
  end
end
