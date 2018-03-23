# ツイートの操作
class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @all_tweets = Tweet.all.order(created_at: 'desc')
    @tweets = []
    # 全てのツイートのうち、条件を満たしているものだけを@tweetsに格納
    permitted_tweet(@tweets, @all_tweets)
    @tweets.sort_by!{ |a| a[:created_at] }.reverse!
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
    if unauthorized?(@tweet)
      render plain: "閲覧権限がありません"
    end
    @replies = []
    # ツイートについたリプライのうち、公開設定を満たしているものだけを@repliesに格納
    permitted_tweet(@replies, @tweet.replies)
    @replies.sort_by! { |a| a[:created_at] }
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

  def unauthorized?(tweet)
    (tweet.to_followers? && (!(user_signed_in?) || !(current_user.following?(tweet.user)))) ||
      (tweet.to_myself? && (!(user_signed_in?) || current_user != tweet.user))
  end

  # judge if the tweet can be shown
  def permitted_tweet(permitted_tweets, tweets)
    tweets.each do |tweet|
      if !(unauthorized?(tweet))
        permitted_tweets.push(tweet)
      end
    end
  end
end
