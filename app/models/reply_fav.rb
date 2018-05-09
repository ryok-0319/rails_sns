class ReplyFav < ApplicationRecord
  belongs_to :user
  belongs_to :reply, counter_cache: :favs_count

  def self.user_favs(replies, user)
    favs = []
    replies.each do |reply|
      fav = self.find_by(user_id: user.id, reply_id: reply.id)
      favs.push(fav)
    end
    return favs
  end
end
