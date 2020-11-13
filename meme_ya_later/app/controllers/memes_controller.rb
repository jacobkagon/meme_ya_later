class MemesController < ApplicationController
  #before_action :require_login
  
  def index
    @memes = Meme.all

  end

  def show
    @meme = Meme.find(params[:id])
  end

  def new
    @meme = Meme.new
  end

  def create
    
    @meme = Meme.new(meme_params)
    @meme.user_id = session[:user_id]
    
    if @meme.save
      redirect_to meme_path(@meme)
    else
      render :new 
    end
   
  end

  def destroy
    @meme = Meme.find(params[:id])
    @meme.delete
    redirect_to memes_path
  end

  private

  def meme_params
    params.require(:meme).permit(:url, :category_id)
  end
end

