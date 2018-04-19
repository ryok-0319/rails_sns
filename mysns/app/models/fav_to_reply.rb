class FavToReply < ApplicationRecord
  belongs_to :user
  belongs_to :reply
end
