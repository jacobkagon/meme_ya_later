class MemesController < ApplicationController
  before_action :require_login
  
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
    @meme.category_id = params[:category]
    if @meme.save
      redirect_to meme_path(@meme)
    else
      render :new 
    end
   
  end

  private

  def meme_params
    params.require(:meme).permit(:url, :user_id, :category_id)
  end
end
