class ReplyFavsController < ApplicationController
  def create
    @reply_fav = ReplyFav.create(user_id: current_user.id, reply_id: params[:reply_id])
    @tweet = Tweet.find(params[:tweet_id])
    @reply_favs = ReplyFav.where(reply_id: params[:reply_id])
    @replies = Reply.all
    redirect_to tweet_path(@tweet)
  end

  def destroy
    reply_fav = ReplyFav.find_by(user_id: current_user.id, reply_id: params[:reply_id])
    reply_fav.destroy
    @tweet = Tweet.find(params[:tweet_id])
    @reply_favs = ReplyFav.where(reply_id: params[:reply_id])
    @replies = Reply.all
    redirect_to tweet_path(@tweet)
  end
end
