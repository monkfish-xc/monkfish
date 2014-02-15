# == Schema Information
#
# Table name: notifications
#
#  id           :integer          not null, primary key
#  message      :string(255)
#  click_action :string(255)
#  status       :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

class Notification < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order('created_at DESC') }

  validates :user_id, presence: true



  # def self.create(cohortship)
  #   if cohortship.status == "requested"
  #     user = cohortship.user
  #     cohort = cohortship.cohort



      # note = user.notifications.build(
      #   :message => "User #{cohort.name} has requested to connect with you.",
      #   :status => "unread")
      # note.save
    end
end
