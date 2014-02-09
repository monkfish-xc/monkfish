class Cohortship < ActiveRecord::Base
  belongs_to :user
  belongs_to :cohort, class_name: "User"
end
