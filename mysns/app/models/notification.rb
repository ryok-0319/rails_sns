class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notified_by, class_name: 'User'
  enum notification_type: { fav_to_tweet: 0, fav_to_reply: 1, reply_to_tweet: 2, followed: 3 }

  def self.read_notifications(user)
    self.where(user_id: user.id).update_all(read: true)
    notifications = self.where(user_id: user.id)
    sorted_notifications = []
    unless notifications.nil?
      notifications.each do |notification|
        sorted_notifications.push(notification)
      end
    end
    sorted_notifications.sort_by!{ |a| a[:created_at] }.reverse!
  end
end
