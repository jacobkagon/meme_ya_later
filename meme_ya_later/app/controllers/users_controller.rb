class UsersController < ApplicationController
  
  
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user)
    else
      redirect_to new_session_path
    create(params.require(:user).permit(:name, :username,        
      :email, :password_digest))
      session[:user_id] = @user.id
      redirect_to '/welcome'
   end
end
