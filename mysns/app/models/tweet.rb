class Tweet < ApplicationRecord
  has_many :replies
  belongs_to :user
  validates :content, presence: true,
    length: { maximum: 140, message: 'Too long!' }
end
