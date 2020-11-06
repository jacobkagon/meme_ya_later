class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:name, :username,        
      :email, :password))
      session[:user_id] = @user.id
      redirect_to '/welcome'
   end
end
