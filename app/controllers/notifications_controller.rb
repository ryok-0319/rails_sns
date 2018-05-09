class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.read_notifications(current_user)
  end
end
