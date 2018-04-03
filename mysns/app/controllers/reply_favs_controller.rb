class ReplyFavsController < ApplicationController
  def create
    @reply_fav = ReplyFav.create(user_id: current_user.id, reply_id: params[:reply_id])
    @reply = Reply.find(params[:reply_id])
    @user = @reply.user
    RelationshipMailer.notify_fav_to_reply(current_user, @user, @reply).deliver
    if @user.id != current_user.id
      Notification.create(
        user_id: @user.id,
        notified_by_id: current_user.id,
        notification_type: :fav_to_reply,
        message: "#{@reply.content}",
        link: "/tweets/#{@reply.tweet.id}"
      )
    end
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
