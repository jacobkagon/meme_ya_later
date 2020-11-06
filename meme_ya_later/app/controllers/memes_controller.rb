class MemesController < ApplicationController
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
    if @meme.save
      redirect_to meme_path(@meme)
    else
      render :new 
    end
  end

  private

  def meme_params
    params.require(:meme).permit(:url, user_id: session[:user], :category_id)
  end
end
