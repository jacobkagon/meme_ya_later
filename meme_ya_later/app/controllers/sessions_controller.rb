class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
    
  end

    def create
       @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id 
       redirect_to memes_path, :flash => {:success => "You are Logged in as #{current_user.username}"} 
      else
        flash.now[:danger] = "Bad name/password combination. Please try again."
        render :new
      end
    end

    def login
      redirect_to memes_path

    end

    def welcome

    end

    def page_requires_login
      
    end
    
    def destroy
      session.delete :user_id
      redirect_to welcome_path
    end
    
  
end
