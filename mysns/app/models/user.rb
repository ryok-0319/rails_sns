class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name,
    presence: true,
    uniqueness: true,
    length: { maximum: 15 },
    format: { with: /\A[a-z0-9]+\z/i}

  validates :nickname,
    presence: true,
    length: { maximum: 15 }
end
