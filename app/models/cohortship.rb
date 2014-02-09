# == Schema Information
#
# Table name: cohortships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  cohort_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Cohortship < ActiveRecord::Base
  belongs_to :user
  belongs_to :cohort, class_name: "User"
end
