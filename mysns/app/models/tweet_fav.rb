class TweetFav < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: :favs_count
end
