class TweetFavsController < ApplicationController
  def create
    @tweet_fav = TweetFav.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @tweet = Tweet.find(params[:tweet_id])
    if @tweet.user.notification
      RelationshipMailer.notify_fav_to_tweet(current_user, @tweet.user, @tweet).deliver
    end
    if @tweet.user.id != current_user.id
      Notification.create(
        user_id: @tweet.user.id,
        notified_by_id: current_user.id,
        notification_type: :fav_to_tweet,
        message: "#{@tweet.content}",
        link: "/tweets/#{@tweet.id}"
      )
    end
    #redirect_back(fallback_location: root_path)
  end

  def destroy
    @tweet_fav = TweetFav.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    @tweet_fav.destroy
    @tweet = Tweet.find(params[:tweet_id])
    @tweet_favs = TweetFav.where(tweet_id: params[:tweet_id])
    @tweets = Tweet.all
    redirect_back(fallback_location: root_path)
  end
end
