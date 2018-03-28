class RelationshipMailer < ApplicationMailer
  default from: "運営"

  def notify_follow_to_user(sender, user)
    @sender = sender
    @user = user
    mail(
      subject: "フォローされました", #メールのタイトル,
      to: @user.email #宛先
    )
  end

  def notify_fav_to_tweet(sender, user, tweet)
    @sender = sender
    @user = user
    @tweet = tweet
    mail(
      subject: "あなたのツイートがファボられました", #メールのタイトル,
      to: @user.email #宛先
    )
  end

  def notify_fav_to_reply(sender, user, reply)
    @sender = sender
    @user = user
    @reply = reply
    mail(
      subject: "あなたのリプライがファボられました", #メールのタイトル,
      to: @user.email #宛先
    )
  end

  def notify_reply_to_tweet(sender, user, reply)
    @sender = sender
    @user = user
    @reply = reply
    mail(
      subject: "あなたのツイートにリプライが来ました", #メールのタイトル,
      to: @user.email #宛先
    )
  end
end
