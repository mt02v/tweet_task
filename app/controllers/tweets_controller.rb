class TweetsController < ApplicationController
  def index
    @today = Date.today
    @tweet = Tweet.new
    @tweets = Tweet.where(done_at:nill).order(:time)
    @tweets_done = Tweet.where.not(done_at:nill)
  end
  
  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end
  
  def done
    @today = Date.today
    tweet = Tweet.find(params[:id])
    tweet.update(done_at: @today)
    redirect_to :action => "index"
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:time,:title,:done_at)
  end
end