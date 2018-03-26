class TweetFav < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: :favs_count

  def self.user_favs(tweets, user)
    favs = []
    tweets.each do |tweet|
      fav = self.find_by(user_id: user.id, tweet_id: tweet.id)
      favs.push(fav)
    end
    return favs
  end
end
