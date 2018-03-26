# ツイートの操作
class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tweets = Tweet.permitted_tweet(current_user)
    # @tweetsのうち、フォロー中と自分自身のものだけを@following_tweetsに格納
    @following_tweets = []
    @tweets.each do |tweet|
      if user_signed_in? && (current_user.following?(tweet.user) || current_user == tweet.user)
        @following_tweets.push(tweet)
      end
    end
  end

  def show
    @poster = @tweet.user
    if @tweet.unviewable?(current_user)
      render plain: "閲覧権限がありません"
    end
    @replies = Reply.permitted_reply(@tweet, current_user)
    @tweet_fav = TweetFav.find_by(user_id: current_user.id, tweet_id: @tweet.id)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet[:user_id] = current_user.id
    if @tweet.save
      redirect_to tweets_path
    else
      render 'new'
    end
  end

  def edit
    if @tweet.user_id != current_user.id
      render plain: "編集・削除は作成者のみです"
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path
    else
      render 'edit'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :level)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
