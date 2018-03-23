class Reply < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  validates :content, presence: true,
    length: { maximum: 140, message: 'Too long!' }
end
