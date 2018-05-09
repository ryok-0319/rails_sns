class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  has_many :reply_favs, dependent: :destroy
  enum level: { to_all: 0, to_followers: 1, to_myself: 2 }
  validates :content, presence: true,
    length: { maximum: 140, message: 'Too long!' }

  def unviewable?(user)
    (self.to_followers? && user != self.user && (user.nil? || !(user.following?(self.user)))) ||
      (self.to_myself? && (user.nil? || user != self.user))
  end

  def self.permitted_reply(tweet, user)
    permitted_replies = []
    tweet.replies.each do |reply|
      if !(reply.unviewable?(user))
        permitted_replies.push(reply)
      end
    end
    permitted_replies.sort_by!{ |a| a[:created_at] }
  end

  def fav_added?(user_id)
    reply_favs.find_by(user_id: user_id)
  end
end
