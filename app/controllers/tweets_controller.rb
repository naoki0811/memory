class TweetsController < ApplicationController
  def index
    @tweet = Tweet.all
  end

  def new
   @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id != current_user.id 
      redirect_to root_path
   end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweet_path
    else
      render :edit
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:title, :text, :hashtag, :image).merge(user_id: current_user.id)
  end
end
