module NotificationHandler
  def send_notification(cohortship)
    @notification = Notification.new(:user_id => cohortship.cohort_id)
    @notification.message = "User #{cohortship.user.email} has requested to connect with you."
    @notification.status = "unread"
    @notification.click_action = "accept,decline"
    @notification.save
  end
end