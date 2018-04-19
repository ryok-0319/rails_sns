class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @followings = @user.followings
    @followers = @user.followers
    all_tweets = Tweet.where(user_id: params[:id])
    @tweets = []
    if admin_signed_in?
      all_tweets.each do |tweet|
        @tweets.push(tweet)
      end
    else
      all_tweets.each do |tweet|
        unless tweet.unviewable?(current_user)
          @tweets.push(tweet)
        end
      end
    end
    @tweets.sort_by! {|a| a.created_at}.reverse!
    if user_signed_in?
      @favs = TweetFav.user_favs(@tweets, current_user)
    end
  end
end
