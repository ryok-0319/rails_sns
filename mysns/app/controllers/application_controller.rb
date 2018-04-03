class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :count_unread_notifications

  def count_unread_notifications
    if user_signed_in?
      @num_of_unread = Notification.where(user_id: current_user.id).where(read: false).count
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :name, :nickname, :notification ]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:notification])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:notification])
  end
end
