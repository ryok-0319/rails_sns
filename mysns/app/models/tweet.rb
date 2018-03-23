class Tweet < ApplicationRecord
  has_many :replies
  belongs_to :user
  enum level: { to_all: 0, to_followers: 1, to_myself: 2 }
  validates :content, presence: true,
    length: { maximum: 140, message: 'Too long!' }
end
