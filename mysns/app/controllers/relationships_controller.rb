class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    if @user.notification
      RelationshipMailer.notify_follow_to_user(current_user, @user).deliver
    end
    Notification.create(
      user_id: @user.id,
      notified_by_id: current_user.id,
      notification_type: :followed,
      message: "",
      link: "/users/#{@current_user.id}"
    )
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to @user
  end
end
