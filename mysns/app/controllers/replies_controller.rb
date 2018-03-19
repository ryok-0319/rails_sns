class RepliesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.replies.create(reply_params)
    redirect_to tweet_path(@tweet)
  end

  def edit
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.find(params[:id])
    if @reply.update(reply_params)
      redirect_to tweet_path(@tweet)
    else
      render 'edit'
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.find(params[:id])
    @reply.destroy
    redirect_to tweet_path(@tweet)
  end

  private
    def reply_params
      params.require(:reply).permit(:content)
    end

end
