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
    @errors = @user.errors
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to memes_path, notice: "Thank you for Joining Meme Ya Later, #{@user.name}!"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)

  end

  private
  def user_params
    params.require(:user).permit(:name,:username,:email, :password, :password_confirmation)
  end
end
