class NotificationsController < ApplicationController
  def create
    @notification = current_user.notifications.build(params)
  end
end
