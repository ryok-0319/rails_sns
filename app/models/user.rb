class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :following_relationships,
    foreign_key: "follower_id",
    class_name: "Relationship",
    dependent: :destroy

  has_many :followings, through: :following_relationships

  has_many :follower_relationships,
    foreign_key: "following_id",
    class_name: "Relationship",
    dependent: :destroy

  has_many :followers, through: :follower_relationships

  has_many :tweets

  has_many :replies

  has_many :tweet_favs, dependent: :destroy
  has_many :tweets, through: :tweet_favs

  has_many :reply_favs, dependent: :destroy
  has_many :replies, through: :reply_favs

  has_many :notifications, dependent: :destroy

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 15 },
    format: { with: /\A[a-z0-9]+\z/i}

  validates :nickname,
    presence: true,
    length: { maximum: 15 }
end
