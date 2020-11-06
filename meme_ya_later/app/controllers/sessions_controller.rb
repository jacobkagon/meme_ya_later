class SessionsController < ApplicationController
    def new
        @session = Session.new
    end

    def create
       @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
       session[:user_id] = @user.id
       redirect_to user_path(@user)
    else
      redirect_to new_session_path
    end

    def login

    end

    def welcome

    end


end
