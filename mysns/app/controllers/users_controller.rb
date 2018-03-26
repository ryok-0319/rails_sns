class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @followings = @user.followings
    @followers = @user.followers
  end
end
