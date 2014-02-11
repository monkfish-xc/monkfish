# == Schema Information
#
# Table name: cohortships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  cohort_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  status     :string(255)      'pending', 'requested', 'accepted' (rejected are destroyed)
#

class Cohortship < ActiveRecord::Base
  belongs_to :user
  belongs_to :cohort, class_name: "User", foreign_key: "cohort_id"

  validates :user_id, presence: true
  validates :cohort_id, presence: true

  def self.are_cohorts(user, cohort)
    return false if user == cohort
    return true unless find_by_user_id_and_cohort_id(user, cohort).nil?
    return true unless find_by_user_id_and_cohort_id(cohort, user).nil?
    false
  end

  def self.request(user, cohort)
    return false if are_cohorts(user, cohort)
    return false if user == cohort
    c1 = new(:user => user, :cohort => cohort, :status => "pending")
    c2 = new(:user => cohort, :cohort => user, :status => "requested")
    # tx enforces coupling of c1 and c2 saves
    transaction do
      c1.save
      c2.save
    end
  end

  #def self.accept(user, cohort)
end
