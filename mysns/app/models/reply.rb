class Reply < ApplicationRecord
  belongs_to :tweet
  validates :content, presence: true,
    length: { maximum: 140, message: 'Too long!' }
end
