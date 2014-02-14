class EventsObserver < ActiveRecord::Observer
  observe :cohortship

  def after_create(record)
  end
end
