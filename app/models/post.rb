# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  content      :string(255)
#  title        :string(255)
#  lead_comment :string(255)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 150 }
end
