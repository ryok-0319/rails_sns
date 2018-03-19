class Tweet < ApplicationRecord
  has_many :replies
  validates :content, presence: true, length: { maximum: 140, message: 'Too long!' }
end
