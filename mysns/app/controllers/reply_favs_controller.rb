class ReplyFavsController < ApplicationController
  def create
    @user_id = current_user.id
    @reply_id = Tweet.find(params[:id]).id
    @reply_fav = ReplyFav.new(reply_id: @reply_id, user_id: @user_id)
    if @reply_fav.save
      redirect_to tweet_path(@tweet_id)
    end
  end

  def destroy
    @reply_fav = ReplyFav.find(params[:id])
    if @reply_fav.destroy
      redirect_to tweet_path(@tweet_id)
    end
  end
end
