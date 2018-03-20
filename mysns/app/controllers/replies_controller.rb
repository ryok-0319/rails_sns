# リプライの操作
class RepliesController < ApplicationController
  before_action :set_tweet
  before_action :set_reply, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def create
    @reply = @tweet.replies.new(reply_params)
    @reply[:user_id] = current_user.id
    if @reply.save
      redirect_to tweet_path(@tweet)
    else
      @tweet = Tweet.find(params[:tweet_id])
      render 'tweets/show'
    end
  end

  def edit
    if @reply.user_id != current_user.id
      render plain: "編集・削除は作成者のみです"
    end
  end

  def update
    if @reply.update(reply_params)
      redirect_to tweet_path(@tweet)
    else
      render 'edit'
    end
  end

  def destroy
    @reply.destroy
    redirect_to tweet_path(@tweet)
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def set_reply
    @reply = @tweet.replies.find(params[:id])
  end
end
