class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def new
    render :new
  end

    def create
       @user = User.find_by(name: params[:name])
      if @user && @user.authenticate(params[:user][:password_digest])
       session[:user_id] = @user.id
       redirect_to memes_path
      else
        "Invalid Login. Please try again or create an account."
        redirect_to login_path
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
