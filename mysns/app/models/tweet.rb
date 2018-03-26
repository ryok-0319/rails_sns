class Tweet < ApplicationRecord
  has_many :replies
  belongs_to :user
  enum level: { to_all: 0, to_followers: 1, to_myself: 2 }
  validates :content, presence: true,
    length: { maximum: 140, message: 'Too long!' }

  def unviewable?(user)
    (self.to_followers? && user != self.user && (user.nil? || !(user.following?(self.user)))) ||
      (self.to_myself? && (user.nil? || user != self.user))
  end

  def self.permitted_tweet(user)
    all_tweets = self.all
    @permitted_tweets = []
    all_tweets.each do |tweet|
      if !(tweet.unviewable?(user))
        @permitted_tweets.push(tweet)
      end
    end
    @permitted_tweets.sort_by!{ |a| a[:created_at] }.reverse!
  end
end
