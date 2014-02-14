class NotificationsObserver < ActiveRecord::Observer
  observe :cohortship, :post, :comment

  def after_create(record)

  end
end
