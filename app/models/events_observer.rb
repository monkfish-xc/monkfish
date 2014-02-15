class EventsObserver < ActiveRecord::Observer
  observe :cohortship

  def after_create(cohortship)
    
  end
end
