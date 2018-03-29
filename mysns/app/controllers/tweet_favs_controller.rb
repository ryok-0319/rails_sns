class TweetFavsController < ApplicationController
  def create
    @tweet_fav = TweetFav.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @tweet = Tweet.find(params[:tweet_id])
    @tweet_favs = TweetFav.where(tweet_id: params[:tweet_id])
    @tweets = Tweet.all
    redirect_to tweet_path(@tweet)
  end

  def destroy
    @tweet_fav = TweetFav.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    @tweet_fav.destroy
    @tweet = Tweet.find(params[:tweet_id])
    @tweet_favs = TweetFav.where(tweet_id: params[:tweet_id])
    @tweets = Tweet.all
    redirect_to tweet_path(@tweet)
  end
end
