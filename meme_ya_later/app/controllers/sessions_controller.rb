class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
        
    end

    def create
       @user = User.find_by(name: params[:name])
      if @user && @user.authenticate(params[:user][:password_digest])
       session[:user_id] = @user.id
       redirect_to user_path(@user)
      else
      redirect_to login_path
      end
    end

    def login

    end

    def welcome

    end
    
  


end
